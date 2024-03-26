----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2023 18:38:51
-- Design Name: 
-- Module Name: serialToParallel - Behavioral
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

entity serialToParallel is
    Generic (
        DIN_WIDTH : integer := 10
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           din : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (DIN_WIDTH-1 downto 0);
           ready: out STD_LOGIC
   );   
end serialToParallel;

architecture Behavioral of serialToParallel is

    signal r_data : STD_LOGIC_VECTOR (dout'length - 1 downto 0) := (others => '0');
    signal r_count : natural range 0 to DIN_WIDTH - 1 := 0;
    signal r_ready : STD_LOGIC;

begin

    process(clk)
    
    begin
    
        if rst = '1' then
            dout  <= (others=>'0');
            r_data <= (others=>'0');
            ready <= '0';
            r_count <= 0;
            r_ready <= '0';
        elsif rising_edge(clk) then
        
            ready <= '0';
            if r_ready = '1' then
                dout <= r_data;
                ready <= '1';
                r_ready <= '0';
            end if;
            
            r_data <= din & r_data(DIN_WIDTH - 1 downto 1);
            if r_count >= DIN_WIDTH - 1 then
                r_count <= 0;
                r_ready <= '1';
            else
                r_count <= r_count + 1;
                r_ready <= '0';
            end if;
            
        end if;
        
    end process;

end Behavioral;
