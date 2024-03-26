----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2023 08:36:01
-- Design Name: 
-- Module Name: screenGeneration_tb - Behavioral
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

use STD.textio.all;
use ieee.std_logic_textio.all;

use work.font_pkg.all;
use work.resolutions.all;

entity screenGeneration_tb is
--  Port ( );
end screenGeneration_tb;

architecture Behavioral of screenGeneration_tb is

    component screenGeneration is
        Generic( res : t_RESOLUTION := VGA);
        Port ( h_idx : in natural;
               v_idx : in natural;
               draw_en : in STD_LOGIC;
               r : out STD_LOGIC_VECTOR (7 downto 0);
               g : out STD_LOGIC_VECTOR (7 downto 0);
               b : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component counter is 
        Generic ( res : t_RESOLUTION := VGA);
        Port ( pix_clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               en : in STD_LOGIC;
               sync : out STD_LOGIC_VECTOR (1 downto 0);
               count_h : out natural;
               count_v : out natural;
               draw_en : out std_logic);
    end component;
    
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal en : std_logic := '0';
    
    signal sync : std_logic_vector (1 downto 0) := (others => '0');
    signal draw_en : std_logic := '0';
    
    signal h_idx : natural := 0;
    signal v_idx : natural := 0;
    
    signal r : std_logic_vector (7 downto 0) := (others => '0');
    signal g : std_logic_vector (7 downto 0) := (others => '0');
    signal b : std_logic_vector (7 downto 0) := (others => '0');
    
    file file_WRITER : text;

begin

    count: counter port map(pix_clk=>clk, rst=>rst, en=>en, sync=>sync, count_h=>h_idx, count_v=>v_idx, draw_en=>draw_en);
    gen: screenGeneration port map(h_idx=>h_idx, v_idx=>v_idx, draw_en=>draw_en ,r=>r, g=>g, b=>b);

    process is
    begin
        clk <= not clk;
        wait for 10 ns;
    end process;

    process is
    begin
        wait for 40 ns;
        rst <= '0';
        wait;
    end process;

    process is
    begin
        wait for 80 ns;
        en <= '1';
        wait;
    end process;
    
    process
    
        variable o_line : line;
        variable r_text : std_logic_vector(7 downto 0);
        variable g_text : std_logic_vector(7 downto 0);
        variable b_text : std_logic_vector(7 downto 0);
        
        
        variable count_v : natural := 0;
        variable count_h : natural := 0;
        
        variable updated : boolean := false;

    begin
            file_open(file_WRITER, "background.csv", write_mode);
            
            while true loop
                wait on h_idx;
                wait for 1 ns; -- wait so that color is updated
                if draw_en = '1' then
--                    r_text := r;
--                    g_text := g;
--                    b_text := b;
                    write(o_line, r, right, r'length);
                    write(o_line, string'(";"));
                    write(o_line, g, right, g'length);
                    write(o_line, string'(";"));
                    write(o_line, b, right, b'length);
                    writeline(file_WRITER, o_line);
                end if;
                
                if v_idx > RES_VDrawingEnd(VGA) then
                    file_close(file_WRITER);
                    wait;
                end if;
                
            end loop;
            
            
            
    end process;

end Behavioral;
