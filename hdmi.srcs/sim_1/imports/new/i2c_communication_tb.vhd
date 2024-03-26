library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity i2c_communication_tb is
end i2c_communication_tb;

architecture Behavioral of i2c_communication_tb is

component i2c_communication
    generic (sys_clk_freq : INTEGER := 125_000_000 -- basic clock
            );
    Port ( clk          : IN    STD_LOGIC;                       --zegar systemowy
           reset_n      : IN    STD_LOGIC;                       --port resetu do rozpoczecia dzialania urzadzenia
           scl          : INOUT STD_LOGIC;                       --port scl zegara i2c
           sda          : INOUT STD_LOGIC;                       --port sda danych i2c
           i2c_ack_err  : BUFFER   STD_LOGIC;                    --flaga nieprawidlowej odpowiedzi od slave'a
           adc_ch0_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);   --dane z kanalu 0 ADC
           adc_ch1_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);   --dane z kanalu 1 ADC
           adc_ch2_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);   --dane z kanalu 2 ADC
           adc_ch3_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);    --dane z kanalu 3 ADC
           sw           : IN std_logic_vector (3 downto 0); 
           sw_out       : OUT std_logic_vector (3 downto 0)
           );
end component;

component i2c_slave is
    Port(
      clk       : IN     STD_LOGIC;                   --system clock
      reset_n   : IN     STD_LOGIC;                   --port resetu urzadzenia do tworzenia wewnetrznego zegara danych
      sda       : INOUT  STD_LOGIC;                   --port sda danych i2c
      scl       : IN  STD_LOGIC);                     --port scl zegara i2c
 end component;

signal sysclk       : STD_LOGIC  := '0';             
signal reset_n      : STD_LOGIC  := '0';             
signal scl          : STD_LOGIC  := 'H';
signal sda          : STD_LOGIC  := 'H';
signal i2c_ack_err  : STD_LOGIC  := '0';
signal adc_ch0_data : STD_LOGIC_VECTOR(11 DOWNTO 0) := (others => '0');
signal adc_ch1_data : STD_LOGIC_VECTOR(11 DOWNTO 0) := (others => '0');
signal adc_ch2_data : STD_LOGIC_VECTOR(11 DOWNTO 0) := (others => '0');
signal adc_ch3_data : STD_LOGIC_VECTOR(11 DOWNTO 0) := (others => '0');
signal sw           : STD_LOGIC_VECTOR(3 DOWNTO 0)  := (others => '1');
signal sw_out           : STD_LOGIC_VECTOR(3 DOWNTO 0)  := (others => '1');

begin

i2c_communication_entity: i2c_communication generic map (
         sys_clk_freq => 125_000_000
        )
        port map(
            clk => sysclk,
            reset_n => reset_n,
            scl => scl,
            sda => sda,
            i2c_ack_err => i2c_ack_err,
            adc_ch0_data => adc_ch0_data,
            adc_ch1_data => adc_ch1_data,
            adc_ch2_data => adc_ch2_data,
            adc_ch3_data => adc_ch3_data,
            sw => sw,
            sw_out => sw_out
            );

i2c_slave_0:  i2c_slave
    PORT MAP(clk => sysclk, reset_n => reset_n, sda => sda,
             scl => scl);

process is 
begin
    sysclk <= not sysclk;
    wait for 4 ns;
end process;

process is
begin 
    wait for 10 ms;
    reset_n <= '1'; --wlaczenie maszynki
    wait;
    
end process;
end ;
