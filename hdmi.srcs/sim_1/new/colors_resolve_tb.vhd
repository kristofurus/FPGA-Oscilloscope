----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2023 11:52:57
-- Design Name: 
-- Module Name: colors_resolve_tb - Behavioral
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

use work.image_generation_pkg.all;

entity colors_resolve_tb is
--  Port ( );
end colors_resolve_tb;

architecture Behavioral of colors_resolve_tb is

signal color1, color2, result : t_color;

signal rgb : std_logic_vector(23 downto 0);

begin

    process
    begin
    
    for c1 in t_color loop
        for c2 in t_color loop
            color1 <= c1;
            color2 <= c2;
            wait for 100 ns;
        end loop;
    end loop;
    
    end process;
    
    result <= color1;
    result <= color2;
    
    rgb <= gen_color(result);

end Behavioral;
