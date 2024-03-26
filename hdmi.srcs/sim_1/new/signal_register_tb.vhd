----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 10:08:09
-- Design Name: 
-- Module Name: signal_register_tb - Behavioral
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
-- W przypadku tej symulacji warto zmniejszyæ rozmiar tablicy danych do np. 100
-- Dla koñcowego 512 symulacja Vivado nie za³adowywuje wszysktich elementów tablicy
-- co mo¿e na symulacji powodowaæ mylne wra¿enie, ¿e FIFO zaczyna dzia³aæ ze
-- znacznie wiêkszym opóŸnieniem ni¿ w rzeczywistoœci.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.image_generation_pkg.all;

entity signal_register_tb is
--  Port ( );
end signal_register_tb;

architecture Behavioral of signal_register_tb is

component signal_register is
    Generic(
    DIN_WIDTH : natural := 12;
    ARRAY_WIDTH : natural := PLOT_WIDTH
    -- data out width should be taken from image_generation_pkg
    );
    Port ( 
        clk_fifo  : in STD_LOGIC;
        clk_reg   : in STD_LOGIC;
        rst       : in STD_LOGIC;
        din       : in STD_LOGIC_VECTOR (DIN_WIDTH - 1 downto 0);
        valid_in  : in STD_LOGIC;
        dout      : out t_data(0 to ARRAY_WIDTH - 1);
        valid_out : out STD_LOGIC_VECTOR(ARRAY_WIDTH - 1 downto 0)
        );
end component;

constant DIN_WIDTH : natural :=  12;

signal clk_fifo, clk_reg, rst : STD_LOGIC := '1';
signal din : STD_LOGIC_VECTOR (DIN_WIDTH - 1 downto 0);
signal valid_in : STD_LOGIC := '0';

signal dout : t_data(0 to PLOT_WIDTH - 1);
signal valid_out : STD_LOGIC_VECTOR(PLOT_WIDTH - 1 downto 0);

begin

    input_to_mem: signal_register port map (
        clk_fifo => clk_fifo,
        clk_reg => clk_reg,
        rst => rst,
        din => din,
        valid_in => valid_in,
        dout => dout,
        valid_out => valid_out
    );
    
    clk1: process
    begin
        clk_fifo <= not clk_fifo;
        wait for 10 ns;
    end process;
    
    clk2: process
    begin
        clk_reg <= not clk_reg;
        wait for 1000 ns;
    end process;
    
    reset: process
    begin
    wait for 50 ns;
        rst <= '0';
        wait;
    end process;
    
    sine_gen: process
        variable is_up : std_logic := '1';
        variable count : unsigned(11 downto 0) := (others => '0');
    begin
        wait until falling_edge(clk_fifo);
        if is_up = '1' then
            count := count + 1;
        else
            count := count -1;
        end if;
        
        if count = 0 then
            is_up := '1';
        elsif count = 4095 then
            is_up := '0';
        end if;
        
        din <= std_logic_vector(count);
        
    end process sine_gen;
    
    is_valid: process
    begin
        wait for 100 ns;
        valid_in <= '1';
    end process;
    
end Behavioral;
