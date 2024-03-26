----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 12:27:25 PM
-- Design Name: 
-- Module Name: inputDivider - Behavioral
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
-- We are converting data from 12bits to 8 bits because there will be 256 pixels
-- designed for plotting signal so there will be 2^8 values. 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.image_generation_pkg.all;

entity inputDivider is
    Generic(
    DIN_WIDTH : natural := 12
    -- data out width should be taken from image_generation_pkg
--    DOUT_WIDTH: natural := DATA_WIDTH
    );
    Port ( din : in STD_LOGIC_VECTOR (DIN_WIDTH - 1 downto 0);
           dout : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
end inputDivider;

architecture Behavioral of inputDivider is

begin

    -- since input data is unsigned we can just read the bits from 11 to 4
    -- we are losing some precision but we get data with values from 0 to 255
    -- if this is how ADC is sending and saving data
    -- 1 value in dout is one of 16(2^4) values in din.
    dout <= din(DIN_WIDTH - 1 downto DIN_WIDTH - DATA_WIDTH);

end Behavioral;
