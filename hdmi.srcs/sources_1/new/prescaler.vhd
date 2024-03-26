----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2023 08:16:04 AM
-- Design Name: 
-- Module Name: prescaler - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity prescaler is
    Generic (
        COUNT_WIDTH : natural := 50_000_000/400_000*36
    );
    Port ( clk_in : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end prescaler;

architecture Behavioral of prescaler is

signal count : natural := 0;

begin

    process(clk_in)
    begin
    
        if rst = '1' then
            count <= 0;
        elsif rising_edge(clk_in) then
            if count = (COUNT_WIDTH -1) then
                count <= 0;
                clk_out <= '1';
            else 
                count <= count + 1;
                clk_out <= '0';
            end if;
        end if;
    
    end process;

end Behavioral;
