----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2023 08:04:21
-- Design Name: 
-- Module Name: decoder - Behavioral
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

use work.resolutions.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
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
end decoder;

architecture Behavioral of decoder is

    signal tmp : STD_LOGIC_VECTOR(DIN_WIDTH-1 downto 0) := (others => '0');
    
begin
    
    process(din, rst)
    begin
    
        if rst = '1' then
            tmp <= (others => '0');
            dout <= (others => '0');
            ctrl <= (others => '0');
        else
            ctrl <= "00";
            
            case din is
            when "1101010100" => ctrl <= "00";
            when "0010101011" => ctrl <= "01";
            when "0101010100" => ctrl <= "10";
            when "1010101011" => ctrl <= "11";
            when others =>
                if din(9) = '1' then
                    if din(8) = '1' then
                        dout(0) <= not din(0);
                        dout(1) <= (not din(1)) xor (not din(0));
                        dout(2) <= (not din(2)) xor (not din(1));
                        dout(3) <= (not din(3)) xor (not din(2));
                        dout(4) <= (not din(4)) xor (not din(3));
                        dout(5) <= (not din(5)) xor (not din(4));
                        dout(6) <= (not din(6)) xor (not din(5));
                        dout(7) <= (not din(7)) xor (not din(6));
                    else 
                        dout(0) <= not din(0);
                        dout(1) <= (not din(1)) xnor (not din(0));
                        dout(2) <= (not din(2)) xnor (not din(1));
                        dout(3) <= (not din(3)) xnor (not din(2));
                        dout(4) <= (not din(4)) xnor (not din(3));
                        dout(5) <= (not din(5)) xnor (not din(4));
                        dout(6) <= (not din(6)) xnor (not din(5));
                        dout(7) <= (not din(7)) xnor (not din(6));
                    end if;
                else 
                    if din(8) = '1' then
                        dout(0) <= din(0);
                        dout(1) <= din(1) xor din(0);
                        dout(2) <= din(2) xor din(1);
                        dout(3) <= din(3) xor din(2);
                        dout(4) <= din(4) xor din(3);
                        dout(5) <= din(5) xor din(4);
                        dout(6) <= din(6) xor din(5);
                        dout(7) <= din(7) xor din(6);
                    else 
                        dout(0) <= din(0);
                        dout(1) <= din(1) xnor din(0);
                        dout(2) <= din(2) xnor din(1);
                        dout(3) <= din(3) xnor din(2);
                        dout(4) <= din(4) xnor din(3);
                        dout(5) <= din(5) xnor din(4);
                        dout(6) <= din(6) xnor din(5);
                        dout(7) <= din(7) xnor din(6);
                    end if;
                end if;
            end case; 
        end if;
    end process;

end Behavioral;
