----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2023 10:44:32
-- Design Name: 
-- Module Name: oscilloscope_noADC_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- file libraries
use STD.textio.all;
use ieee.std_logic_textio.all;

use work.image_generation_pkg.all;  -- color settings
use work.resolutions.all;           -- resolution settings
use work.font_pkg.all;              -- font and background maps

entity oscilloscope_tb_full is
--  Port ( );
end oscilloscope_tb_full;

architecture Behavioral of oscilloscope_tb_full is

component oscilloscope is
    Port (
        -- system clock and reset
        sysclk  : in STD_LOGIC;
        rst     : in STD_LOGIC;
        
        -- I2C 
        -- inout?
        sda     : INOUT STD_LOGIC;
        scl     : INOUT STD_LOGIC;
--        clk_fifo_tmp: in STD_LOGIC;       -- later should be based on sampling frequency 
--        din_tmp     : in t_data_in_array; -- for now so i can test this part
        -- switches
        sw      : in std_logic_vector(3 downto 0);
        -- TMDS clock output 
        clk_p   : out std_logic;
        clk_n   : out std_logic;
        -- TMDS data output
        dataR_p : out std_logic;
        dataR_n : out std_logic;
        dataG_p : out std_logic;
        dataG_n : out std_logic;
        dataB_p : out std_logic;
        dataB_n : out std_logic
        
    );
end component;

component decoder is
    Generic(
        DIN_WIDTH : natural := 10
    );
    Port ( 
        clk  : in STD_LOGIC;
        rst  : in STD_LOGIC;
        din  : in STD_LOGIC_VECTOR(9 downto 0);
        dout : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
        ctrl : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0')
    );
end component;

component serialToParallel is
    Generic (
        DIN_WIDTH : integer := 10
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           din : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (DIN_WIDTH-1 downto 0);
           ready: out STD_LOGIC
   );   
end component;

component i2c_slave is
    Port(
      clk       : IN     STD_LOGIC;                   --system clock
      reset_n   : IN     STD_LOGIC;                   --port resetu urzadzenia do tworzenia wewnetrznego zegara danych
      sda       : INOUT  STD_LOGIC;                   --port sda danych i2c
      scl       : IN  STD_LOGIC); 
end component;

    -- clock and reset
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    
    -- I2C     
    signal rst_n        : STD_LOGIC := '1';
    signal scl          : STD_LOGIC  := 'H';
    signal sda          : STD_LOGIC  := 'H';
    signal sw           : STD_LOGIC_VECTOR(3 DOWNTO 0)  := (others => '1');
    
    -- data input
    signal clk_fifo_tmp : std_logic := '0';
    signal din_tmp      : t_data_in_array;
    
    -- TMDS clock output 
    signal clk_p   : std_logic;
    signal clk_n   : std_logic;
    -- TMDS data output
    signal dataR_p : std_logic;
    signal dataR_n : std_logic;
    signal dataG_p : std_logic;
    signal dataG_n : std_logic;
    signal dataB_p : std_logic;
    signal dataB_n : std_logic;
    
    -- deserializer
    signal deserial_r, deserial_g, deserial_b : STD_LOGIC_VECTOR (9 downto 0);
    signal ready_r, ready_g, ready_b : STD_LOGIC;
    
    -- decoded data
    signal dec_R       : std_logic_vector(7 downto 0) := (others => '0');
    signal dec_G       : std_logic_vector(7 downto 0) := (others => '0');
    signal dec_B       : std_logic_vector(7 downto 0) := (others => '0');
    signal dec_ctrl_R  : std_logic_vector(1 downto 0) := (others => '0');
    signal dec_ctrl_G  : std_logic_vector(1 downto 0) := (others => '0');
    signal dec_ctrl_B  : std_logic_vector(1 downto 0) := (others => '0');
    
    signal res : t_RESOLUTION := VESA_640x480_75Hz;

    file file_VECTORS : text;
    file file_WRITER : text;
    file file_DECODED : text;
    
--    type t_counter is array (0 to NUMBER_OF_SIGNALS - 1) of unsigned(11 downto 0);

begin

    save_data: process
        variable o_line : line;
    begin
        file_open(file_DECODED, "decoded_rgb.csv", write_mode);
        file_close(file_DECODED);
        while true loop
            -- wait for signal that decoding was finished
            wait until rising_edge(ready_r);
            wait for 1 ns;
            file_open(file_DECODED, "decoded_rgb.csv", append_mode);
            -- red
            write(o_line, dec_R, right, dec_R'length);
            write(o_line, string'(";"));
            -- green
            write(o_line, dec_G, right, dec_G'length);
            write(o_line, string'(";"));
            -- blue
            write(o_line, dec_B, right, dec_B'length);
            write(o_line, string'(";"));
            -- sync
            write(o_line, dec_ctrl_B, right, dec_ctrl_B'length);
            writeline(file_DECODED, o_line);
            
            file_close(file_DECODED);
        end loop;
        wait;
    end process;

    -- clock simulation
    main_clk: process
    begin
        clk <= not clk;
        wait for 4 ns;
    end process; 
    
    -- clock simulation
    fs_clk: process
    begin
        clk_fifo_tmp <= not clk_fifo_tmp;
        wait for 1 us;
    end process; 
    
    -- reset simulation
    reset_clock: process
    begin
        wait for 20 ns;
        rst <= '0';
        wait;
    end process;
    
    rst_n <= not rst;
    
    switches: process
    begin
        wait for 10 ms;
        sw <= (others => '1');
        wait;
    end process;

i2c_slave_0:  i2c_slave
    PORT MAP(clk => clk, reset_n => rst_n, sda => sda,
             scl => scl);

    -- deserializers
    deserializer_r: serialToParallel port map(clk=>clk_p, rst=>rst, din=>dataR_p, dout=>deserial_r, ready=>ready_r);
    deserializer_g: serialToParallel port map(clk=>clk_p, rst=>rst, din=>dataG_p, dout=>deserial_g, ready=>ready_g);
    deserializer_b: serialToParallel port map(clk=>clk_p, rst=>rst, din=>dataB_p, dout=>deserial_b, ready=>ready_b);
    
    -- decoders
    decoder_r: decoder port map(clk=>ready_r, rst=>rst, din=>deserial_r, ctrl=>dec_ctrl_R, dout=>dec_R);
    decoder_g: decoder port map(clk=>ready_g, rst=>rst, din=>deserial_g, ctrl=>dec_ctrl_G, dout=>dec_G);
    decoder_b: decoder port map(clk=>ready_b, rst=>rst, din=>deserial_b, ctrl=>dec_ctrl_B, dout=>dec_B);
    
    -- oscilloscope
    osc: oscilloscope port map (
        -- system clock and reset
        sysclk =>clk,
        rst => rst,
        
        sda => sda,
        scl => scl,
        
        sw => sw,
        
        -- TMDS clock output 
        clk_p => clk_p,
        clk_n => clk_n,
        -- TMDS data output
        dataR_p => dataR_p,
        dataR_n => dataR_n,
        dataG_p => dataG_p,
        dataG_n => dataG_n,
        dataB_p => dataB_p,
        dataB_n => dataB_n
    );

end Behavioral;
