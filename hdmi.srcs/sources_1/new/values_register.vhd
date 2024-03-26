----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 01:17:54 PM
-- Design Name: 
-- Module Name: values_register - Behavioral
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
-- probably should be optimized so the size of the input is only as big as number
-- of values that will be generated in a single frame but for now see if it is ok
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.image_generation_pkg.all;

entity values_register is
    Generic (
        ARRAY_WIDTH : natural := PLOT_WIDTH
--        DATA_WIDTH : natural := 8 -- data width should be taken from image_generation_pkg
    );
    Port ( clk : in STD_LOGIC; -- end or the beginning of frame signal
           rst : in STD_LOGIC;
           values_in : in t_data(0 to ARRAY_WIDTH - 1);
--           valid_in : in std_logic_vector(ARRAY_WIDTH - 1 downto 0);
           values_out : out t_data(0 to ARRAY_WIDTH - 1) := (others=>(others=> '0'))
--           valid_out : out std_logic_vector(ARRAY_WIDTH - 1 downto 0) := (others=> '0')
    );
end values_register;

architecture Behavioral of values_register is

begin

    process(clk)
    
    begin
    
        if rst = '1' then
        
            values_out <= (others => (others => '0'));
--            valid_out <= (others => '0');    
        
        elsif rising_edge(clk) then
            
            values_out <= values_in;
--            valid_out <= valid_in;
        
        end if; 
    
    end process;


end Behavioral;
