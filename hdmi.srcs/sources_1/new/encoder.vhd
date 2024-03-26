----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2023 04:28:48 PM
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           draw_en : in STD_LOGIC;
           ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           din : in STD_LOGIC_VECTOR (0 downto 0);
           dout : out STD_LOGIC_VECTOR (9 downto 0));
end encoder;

architecture Behavioral of encoder is

begin


end Behavioral;
