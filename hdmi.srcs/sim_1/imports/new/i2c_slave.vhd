LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

ENTITY i2c_slave IS
  PORT(
    clk       : IN     STD_LOGIC;                                                   --system clock
    reset_n   : IN     STD_LOGIC;                                                   --port resetu urzadzenia do tworzenia wewnetrznego zegara danych
    sda       : INOUT  STD_LOGIC;                                                   --port sda danych i2c
    scl       : IN  STD_LOGIC);                                                     --port scl zegara i2c
END i2c_slave;

ARCHITECTURE logic OF i2c_slave IS
  TYPE machine IS(ready, rec_command, slv_ack1, wr, rd, mstr_ack, stop);            --stany maszyny stanow
  SIGNAL state         : machine;                                                   --maszyna stanow
  SIGNAL data_clk      : STD_LOGIC;                                                 --zegar danych dla sda
  SIGNAL data_clk_prev : STD_LOGIC;                                                 --zachowana poprzednia wartosc
  SIGNAL sda_int       : STD_LOGIC := '1';                                          --wewnetrzne sda
  SIGNAL addr_rw       : STD_LOGIC_VECTOR(7 DOWNTO 0);                              --sygnal bedacy wewnetrznym adresem urzadzenia
  SIGNAL data_tx       : STD_LOGIC_VECTOR(7 DOWNTO 0);                              --dane do pisania do mastera
  SIGNAL data_rx       : STD_LOGIC_VECTOR(7 DOWNTO 0);                              --dane do czytania z mastera
  SIGNAL bit_cnt       : INTEGER RANGE 0 TO 7 := 7;                                 --pomocniczny licznik bitow
  SIGNAL stretch       : STD_LOGIC := '0';                                          --zabezpieczenie przed rozciaganiem scl
  SIGNAL channel       : std_logic :='0';                                           --bajt starszy lub mlodszy
  SIGNAL counter       : INTEGER RANGE 0 to 3 :=0;                                  --identyfikator kanalu - licznik
  SIGNAL i0            : INTEGER RANGE 0 to 15 :=0;                                 --sygnal pomocniczy do tablicy z sinusami
  SIGNAL i1            : INTEGER RANGE 0 to 31 :=0;                                 --sygnal pomocniczy do tablicy z sinusami        
  SIGNAL i2            : INTEGER RANGE 0 to 63 :=0;                                 --sygnal pomocniczy do tablicy z sinusami
  SIGNAL i3            : INTEGER RANGE 0 to 128 :=0;                                --sygnal pomocniczy do tablicy z sinusami
  signal first         : std_logic  :='0';                                          --flaga oznaczajaca wykrycie warunku poczatkowego                       
  SIGNAL start_cond_scl: std_logic  :='1';                                          --warunek poczatkowy
  Signal enab          : std_logic :='1';                                           --flaga sprawdzajaca odpowiedz mastera
  SIGNAL start_cond_sda    : std_logic  :='1';                                      --warunek poczatkowy
  TYPE memory_type0 is array (0 to 15) of INTEGER RANGE 0 to 4095;                  --tablica sinusow
  TYPE memory_type1 is array (0 to 31) of INTEGER RANGE 0 to 4095;                  --tablica sinusow
  TYPE memory_type2 is array (0 to 63) of INTEGER RANGE 0 to 4095;                  --tablica sinusow
  TYPE memory_type3 is array (0 to 127) of INTEGER RANGE 0 to 4095;                 --tablica sinusow
  SIGNAL sine0 : memory_type0 := (2048,2831,3495,3939,4095,3939,3495,2831,              
                                  2048,1264,600,156,0,156,600,1264);
  SIGNAL sine1 : memory_type1 := (2048,2447,2831,3185,3495,3750,3939,4056,
                                  4095,4056,3939,3750,3495,3185,2831,2447,
                                  2048,1648,1264,910,600,345,156,39,
                                  0,39,156,345,600,910,1264,1648);
  SIGNAL sine2 : memory_type2 := (2048,2248,2447,2642,2831,3013,3185,3346,
                                  3495,3630,3750,3853,3939,4007,4056,4085,
                                  4095,4085,4056,4007,3939,3853,3750,3630,
                                  3495,3346,3185,3013,2831,2642,2447,2248,
                                  2048,1847,1648,1453,1264,1082,910,749,
                                  600,465,345,242,156,88,39,10,
                                  0,10,39,88,156,242,345,465,
                                  600,749,910,1082,1264,1453,1648,1847);
  SIGNAL sine3 : memory_type3 := (2048,2148,2248,2348,2447,2545,2642,2737,
                                  2831,2923,3013,3100,3185,3267,3346,3423,
                                  3495,3565,3630,3692,3750,3804,3853,3898,
                                  3939,3975,4007,4034,4056,4073,4085,4093,
                                  4095,4093,4085,4073,4056,4034,4007,3975,
                                  3939,3898,3853,3804,3750,3692,3630,3565,
                                  3495,3423,3346,3267,3185,3100,3013,2923,
                                  2831,2737,2642,2545,2447,2348,2248,2148,
                                  2048,1947,1847,1747,1648,1550,1453,1358,
                                  1264,1172,1082,995,910,828,749,672,
                                  600,530,465,403,345,291,242,197,
                                  156,120,88,61,39,22,10,2,
                                  0,2,10,22,39,61,88,120,
                                  156,197,242,291,345,403,465,530,
                                  600,672,749,828,910,995,1082,1172,
                                  1264,1358,1453,1550,1648,1747,1847,1947);
  
BEGIN
  --proces generowania zegara danych, takiego samego jak w masterze, czyli przesunietego o cwierc cyklu zegara systemowego wzgledem scl
  PROCESS(clk, reset_n)
    VARIABLE count  :  INTEGER RANGE 0 TO 79*4;  --licznik o wartosci zegar systemowy/fscl zaokraglony w gore - przez to fscl = ok 395.57kHz
  BEGIN
    IF(reset_n = '0') THEN                       --przychodzi reset
      stretch <= '0';
      count := 0;
    ELSIF(clk'EVENT AND clk = '1') THEN
      data_clk_prev <= data_clk;                  --zapisanie poprzedniej wartosci zegara danych
      IF(count = 79*4-1) THEN                     --zapisany caly cykl
        count := 0;                               --reset licznika
      ELSIF(stretch = '0') THEN                   --jezeli scl nie jest rozciagany
        count := count + 1;                       --kontynuacja generowania zegara
      END IF;
      CASE count IS
        WHEN 0 TO (79-1) =>                       --pierwsza cwiartka cyklu zegarowego
          data_clk <= '0';
        WHEN 79 TO 79*2-1 =>                      --druga cwiartka cyklu zegarowego
          data_clk <= '1';
        WHEN 79*2 TO 79*3-1 =>                    --trzecia cwiartka cyklu zegarowego
          IF(scl = '0') THEN                      --zabezpieczenie przez rozciaganiem zegara - w tym czasie licznik nie rosnie
            stretch <= '1';
          ELSE
            stretch <= '0';
          END IF;
          data_clk <= '1';
        WHEN OTHERS =>                            --ostatnia cwiartka cyklu zegarowego
          data_clk <= '0';
      END CASE;
    END IF;
  END PROCESS;
  
 PROCESS(clk)
 --Proces do znajdowania warunku poczatkowego transmisji
  BEGIN
    start_cond_sda<=sda;
    start_cond_scl<=scl;
    --warunek poczatkowy sprawdzany raz
    if(start_cond_scl='0' and start_cond_sda='0' and first='0') THEN
        first<='1';
    END IF;
 END PROCESS;
  
   --maszyna stanow do pisania sda
  PROCESS(clk, reset_n)
  BEGIN
    IF(reset_n = '0') THEN                 --przyszedl reset
      state <= ready;                      --stan oczekiwania
      sda_int <= '1';                      --sda w wysoka impedancje
      bit_cnt <= 7;                        --licznik bitow
    ELSIF(clk'EVENT AND clk = '1') THEN 
      IF(data_clk = '1' AND data_clk_prev = '0') THEN  --rosnace zbocze zegara danych, czyli malejace scl - wtedy mozna pisac
        CASE state IS
        
          WHEN ready =>                      --stan idle
            IF(first = '1') THEN             --spelniony warunek poczatkowy
                addr_rw <= "01010001";       --nadany wlasny adres do porownania (z bitem czytania, bo z ADC i tak tylko odczytujemy)
                IF (channel='0') THEN        -- przygotowanie zawartosci do pisania do mastera - starszy bajt
                    data_tx(7 downto 4) <="0000";            --00[nr kanalu]
                    data_tx(3 downto 0) <= conv_std_logic_vector(sine0(i0),12)(11 downto 8); --wartosc z tablicy na cztery najstarsze bity
                else  
                    data_tx<= conv_std_logic_vector(sine0(i0),12)(7 downto 0);               --bajt mlodszy - przygotowujemy pozostale bity
                end if;
                sda_int <= '1';                  --zwolnienie sda do pisania przez mastera
                state <= rec_command;            --przejscie do stanu odbierania adresu i komendy
            ELSE                                 
                state <= ready;                  --pozostaje stan idle
            END IF;
                     
          WHEN rec_command =>                    --stan odbierania instrukcji
            if(data_rx(bit_cnt)='H') Then        --kwestia symulacji rezystorow podciagajacych - trzeba interpretowac H jako 1
                data_rx(bit_cnt)<='1';   
            end if;           
            IF(bit_cnt = 0) THEN             --zakonczone odczytywanie
              if(data_rx = addr_rw) THEN
                sda_int <= '0';              --jesli adres jest rowny adresowi urzadzenia to wysylamy bit acknowledge
              else
                sda_int <= '1';              --nie wysylamy ack
              end if;
              bit_cnt <= 7;                  --reset licznika bitow
              state <= slv_ack1;             --przejscie do stanu acknowledge
            ELSE
              bit_cnt <= bit_cnt - 1;        --dekrementacja liczniku bitow
              state <= rec_command;          --nadal w staniu odczytywania
            END IF;
            
          WHEN slv_ack1 =>                   
            IF(data_rx(0) = '1') THEN        --jezeli komenda czytania
              sda_int <= data_tx(bit_cnt);   --wysylamy pierwszy bit
              state <= wr;                   --przechodzimy do stanu pisania           
            END IF;
            
          WHEN wr =>                         --stan pisania
            IF(bit_cnt = 0) THEN             --pisanie zakonczone
              sda_int <= '1';                --zwalniamy sda aby odczytac acknowledge od mastera
              bit_cnt <= 7;                  --reset licznika bitow
              IF (channel='1') THEN
                IF (counter = 3) THEN
                    counter <= 0;
                ELSE
                    counter <= counter + 1;  --inkrementacja licznika kanalow
                END IF;
              END IF;
              channel <= not channel;        --toggle pomiedzy starszym a mlodszym bajtem z transmisji
              state <= mstr_ack;             --przechodzimy do stanu acknowledge mastera
            ELSE                             
              bit_cnt <= bit_cnt - 1;        --dekrementacja licznika bitow
              sda_int <= data_tx(bit_cnt-1); --piszemy zawartosc ADC na linie sda 
              state <= wr;                   --nadal piszemy
            END IF;
           
          WHEN mstr_ack =>                   --stan acknowledge mastera
            IF(enab = '0') THEN             --jezeli rzeczywiscie zaszedl warunek poczatkowy
                sda_int <= data_tx(bit_cnt); --piszemy pierwszy bit nastepnego bajtu
                state <= wr;                 --przechodzimy do stanu pisania
                enab <='1';                  --zdejmujemy flage odpowiedzi mastera
            ELSE                             
              state <= stop;                 --przechodzimy do stanu stop
            END IF;
            
          WHEN stop =>                       --stan stop
            state <= ready;                  --wracamy do stanu ready
            
          WHEN OTHERS =>
            NULL;
            
        END CASE;    
        
      ELSIF(data_clk = '0' AND data_clk_prev = '1') THEN  --sekcja czytania, czyli zbocze opadajace zegara danych, zbocze rosnace zegara scl
        CASE state IS
                    
          WHEN rec_command =>
            data_rx(bit_cnt) <= sda;         --po prostu czytamy bity z sda
                  
          WHEN mstr_ack =>
          
            IF(sda='0') THEN                 --sprawdzamy czy master dal acknowledge
                enab <= '0';
            END IF;
            
            CASE counter is                 --w zaleznosci od kanalu wrzucamy dane na wektor piszacy na sda
                    WHEN 0 =>               --kanal 0
                        IF (channel='0') THEN
                            data_tx(7 downto 4) <="0000";            
                            data_tx(3 downto 0) <= conv_std_logic_vector(sine0(i0),12)(11 downto 8);
                        else  
                            data_tx<= conv_std_logic_vector(sine0(i0),12)(7 downto 0);
                            IF (i0 = 15) THEN
                                i0 <= 0;
                            ELSE
                                i0 <= i0 + 1;        --inkrementacja elementu tablicy
                            END IF;
                        end if;
                    WHEN 1 =>               --kanal 1
                        IF (channel='0') THEN
                            data_tx(7 downto 4) <="0001";            
                            data_tx(3 downto 0) <= conv_std_logic_vector(sine1(i1),12)(11 downto 8);
                        else  
                            data_tx<= conv_std_logic_vector(sine1(i1),12)(7 downto 0);
                            IF (i1 = 31) THEN
                                i1 <= 0;
                            ELSE
                                i1 <= i1 + 1;        
                            END IF;
                        end if;
                    WHEN 2 =>                 --kanal 2
                        IF (channel='0') THEN
                            data_tx(7 downto 4) <="0010";            
                            data_tx(3 downto 0) <= conv_std_logic_vector(sine2(i2),12)(11 downto 8);
                        else  
                            data_tx<= conv_std_logic_vector(sine2(i2),12)(7 downto 0);
                            IF (i2 = 63) THEN
                                i2 <= 0;
                            ELSE
                                i2 <= i2 + 1;        --next channel
                            END IF;
                        end if;
                    WHEN 3 =>                   --kanal 3
                        IF (channel='0') THEN
                            data_tx(7 downto 4) <="0011";         
                            data_tx(3 downto 0) <= conv_std_logic_vector(sine3(i3),12)(11 downto 8);
                        else  
                            data_tx<= conv_std_logic_vector(sine3(i3),12)(7 downto 0);
                            IF (i3 = 127) THEN
                                i3 <= 0;
                            ELSE
                                i3 <= i3 + 1;       
                            END IF;
                        end if;
                    WHEN OTHERS=>
                        NULL;
                END CASE;     
     
          WHEN OTHERS =>
            NULL;
        END CASE;
      END IF;
    END IF;
  END PROCESS;  
    
  sda <= '0' WHEN sda_int = '0' ELSE 'H';       --pisanie na sda z H czyli imitacja rezystora podciagajacego
  
END logic;
