----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 10:21:50 AM
-- Design Name: 
-- Module Name: video_generator_tb - Behavioral
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
use STD.textio.all;
use ieee.std_logic_textio.all;

use work.resolutions.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity video_generator_tb is
--  Port ( );
end video_generator_tb;

architecture Behavioral of video_generator_tb is

signal clk : std_logic := '1';
signal rst : std_logic := '1';

signal pixel_clk : std_logic := '0';
signal tmds_clk : std_logic := '0';

-- RGB input
signal data_r      : std_logic_vector(7 downto 0) := (others => '0');
signal data_g      : std_logic_vector(7 downto 0) := (others => '0');
signal data_b      : std_logic_vector(7 downto 0) := (others => '0');
--         data input (instead of RGB input)
--        data        : in std_logic_vector(23 downto 0);
-- TMDS clock output 
signal clk_p       : std_logic;
signal clk_n       : std_logic;
-- TMDS data output
signal dataR_p     : std_logic;
signal dataR_n     : std_logic;
signal dataG_p     : std_logic;
signal dataG_n     : std_logic;
signal dataB_p     : std_logic;
signal dataB_n     : std_logic;

-- decoded data
signal dec_R       : std_logic_vector(7 downto 0) := (others => '0');
signal dec_G       : std_logic_vector(7 downto 0) := (others => '0');
signal dec_B       : std_logic_vector(7 downto 0) := (others => '0');
signal dec_ctrl_R  : std_logic_vector(1 downto 0) := (others => '0');
signal dec_ctrl_G  : std_logic_vector(1 downto 0) := (others => '0');
signal dec_ctrl_B  : std_logic_vector(1 downto 0) := (others => '0');

signal res : t_RESOLUTION := VGA;

file file_VECTORS : text;
file file_WRITER : text;
file file_DECODED : text;

signal send_r : std_logic_vector(9 downto 0) := (others => '0');
signal end_writing : boolean := false;

signal generate_en : std_logic := '0';
signal send_en     : std_logic := '0';
signal read_en     : std_logic := '0';

component video_generator
    port(
        -- rst and clocks
        sysclk      : in std_logic;
        rst         : in std_logic;
        -- RGB input
--        data_r      : in std_logic_vector(7 downto 0);
--        data_g      : in std_logic_vector(7 downto 0);
--        data_b      : in std_logic_vector(7 downto 0);
--         data input (instead of RGB input)
--        data        : in std_logic_vector(23 downto 0);
        -- TMDS clock output 
        clk_p       : out std_logic;
        clk_n       : out std_logic;
        -- TMDS data output
        dataR_p      : out std_logic;
        dataR_n      : out std_logic;
        dataG_p      : out std_logic;
        dataG_n      : out std_logic;
        dataB_p      : out std_logic;
        dataB_n      : out std_logic;
        
        generate_en  : out std_logic;
        send_en      : out std_logic
    );
end component;

component clock_gen_wrapper
  Port (
    clk_in : in STD_LOGIC;
    pixel_clk : out STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    tmds_clk : out STD_LOGIC
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
        dout : out STD_LOGIC_VECTOR(7 downto 0);
        ctrl : out STD_LOGIC_VECTOR(1 downto 0)
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

signal deserial_r, deserial_g, deserial_b : STD_LOGIC_VECTOR (9 downto 0);
signal ready_r, ready_g, ready_b : STD_LOGIC;

begin

    clk_gen: clock_gen_wrapper port map(clk_in=>clk, pixel_clk=>pixel_clk, tmds_clk=>tmds_clk, reset_rtl=>rst);
    
    deserializer_r: serialToParallel port map(clk=>clk_p, rst=>rst, din=>dataR_p, dout=>deserial_r, ready=>ready_r);
    deserializer_g: serialToParallel port map(clk=>clk_p, rst=>rst, din=>dataG_p, dout=>deserial_g, ready=>ready_g);
    deserializer_b: serialToParallel port map(clk=>clk_p, rst=>rst, din=>dataB_p, dout=>deserial_b, ready=>ready_b);
    
    decoder_r: decoder port map(clk=>ready_r, rst=>rst, din=>deserial_r, ctrl=>dec_ctrl_R, dout=>dec_R);
    decoder_g: decoder port map(clk=>ready_g, rst=>rst, din=>deserial_g, ctrl=>dec_ctrl_G, dout=>dec_G);
    decoder_b: decoder port map(clk=>ready_b, rst=>rst, din=>deserial_b, ctrl=>dec_ctrl_B, dout=>dec_B);
    
    video: video_generator port map (
        sysclk=>clk,
        rst=>rst,
        -- RGB input
--        data_r=>data_r,
--        data_g=>data_g,
--        data_b=>data_b,
--         data input (instead of RGB input)
--        data        : in std_logic_vector(23 downto 0);
        -- TMDS clock output 
        clk_p=>clk_p,
        clk_n=>clk_n,
        -- TMDS data output
        dataR_p=>dataR_p,
        dataR_n=>dataR_n,
        dataG_p=>dataG_p,
        dataG_n=>dataG_n,
        dataB_p=>dataB_p,
        dataB_n=>dataB_n,
        
        generate_en=>generate_en,
        send_en=>send_en
    );
    
    process(send_en, pixel_clk)
    
    begin
        if send_en = '0' then
            read_en <= '0';
        elsif send_en = '1' and rising_edge(pixel_clk) then
            read_en <= '1';
        end if;
    end process;
    
--    -- insert image simulation
--    process
--        variable i_line : line;
--        variable r_text : std_logic_vector(7 downto 0);
--        variable g_text : std_logic_vector(7 downto 0);
--        variable b_text : std_logic_vector(7 downto 0);
        
--        variable space : character;
--    begin
--        if generate_en = '1' then
--            file_open(file_VECTORS, "raw_img.txt", read_mode);
            
--            while not endfile(file_VECTORS) loop
--                readline(file_VECTORS, i_line);
--                read(i_line, r_text);
--                read(i_line, space);
--                read(i_line, g_text);
--                read(i_line, space);
--                read(i_line, b_text);
                
--                data_r <= r_text;
--                data_g <= g_text;
--                data_b <= b_text;
                
--                wait until rising_edge(pixel_clk);
                
--            end loop;
            
--            file_close(file_VECTORS);
--            end_writing <= true;
--            wait until rising_edge(pixel_clk);
            
--        end if;
--        wait until rising_edge(clk);
--    end process;

    process
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
    
    process
    
        variable o_line : line;
        variable r_text : std_logic_vector(9 downto 0);
        variable g_text : std_logic_vector(9 downto 0);
        variable b_text : std_logic_vector(9 downto 0);

    begin
        if read_en = '0' then
        
            file_open(file_WRITER, "results_blue.txt", write_mode);
            wait until rising_edge(tmds_clk);
            wait until rising_edge(tmds_clk);
            while not end_writing loop
                for i in 0 to send_r'length -1 loop
                    send_r(i) <= dataB_p;
                    wait until rising_edge(tmds_clk);
                end loop;
                b_text := send_r;
                write(o_line, b_text, right, b_text'length);
                writeline(file_WRITER, o_line);
                send_r <= (others => '0');
            end loop;
            
            file_close(file_WRITER);
            
        end if;
        wait until rising_edge(clk);

    end process;

    -- clock simulation
    process
    begin
        clk <= not clk;
        wait for 4 ns;
    end process; 
    
    -- reset simulation
    process
    begin
        wait for 20 ns;
        rst <= '0';
        wait;
    end process;

end Behavioral;
