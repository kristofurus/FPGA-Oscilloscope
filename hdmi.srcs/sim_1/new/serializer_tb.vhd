----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 19:59:56
-- Design Name: 
-- Module Name: serializer_tb - Behavioral
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

entity serializer_tb is
--  Port ( );
end serializer_tb;

architecture Behavioral of serializer_tb is

signal pix_clk : std_logic := '0';
signal tmds_clk : std_logic := '0';
signal rst : std_logic := '1';

signal din : std_logic_vector(9 downto 0) := (others => '0');
signal dout : std_logic;

component serializer
    Generic (
        DIN_WIDTH : integer := 10
    );
    Port ( 
        rst : STD_LOGIC;
        pix_clk : in STD_LOGIC;
        tmds_clk : in STD_LOGIC;
        din : in STD_LOGIC_VECTOR (DIN_WIDTH-1 downto 0);
        dout : out STD_LOGIC);
end component;

begin

    serial: serializer port map (
        rst => rst,
        pix_clk => pix_clk,
        tmds_clk => tmds_clk,
        din => din,
        dout => dout
    );
    
    process
    begin
        wait for 100 ns;
        rst <= '0';
        wait;
    end process;

    process 
    begin
        pix_clk <= not pix_clk;
        wait for 100 ns;
    end process;
    
    process 
    begin
        wait for 100 ns;
        loop
            din <= "0101010101";
            wait for 200 ns;
            din <= "1111111111";
            wait for 200 ns;
            din <= "1010101010";
            wait for 200 ns;
        end loop;
    end process;
    
    process 
    begin
        tmds_clk <= not tmds_clk;
        wait for 10 ns;
    end process;

end Behavioral;
