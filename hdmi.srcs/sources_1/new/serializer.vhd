----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 19:48:51
-- Design Name: 
-- Module Name: serializer - Behavioral
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

entity serializer is
    Generic (
        DIN_WIDTH : integer := 10
    );
    Port ( 
        rst : in STD_LOGIC;
        en : in STD_LOGIC;
        pix_clk : in STD_LOGIC;
        tmds_clk : in STD_LOGIC;
        din : in STD_LOGIC_VECTOR (DIN_WIDTH-1 downto 0);
        dout : out STD_LOGIC);
end serializer;

architecture Behavioral of serializer is
        
    -- internal signal that holds input data between pix clocks
    signal d_tmp : STD_LOGIC_VECTOR (din'length - 1 downto 0) := (others => '0');
--    signal idx : natural := 0;

begin

--    process(tmds_clk)
--        variable count : natural range 0 to DIN_WIDTH := DIN_WIDTH-1;
--    begin
--        if rst = '1' then
--            dout <= '0';
--            count := DIN_WIDTH-1;
--        elsif en = '0' then
--            dout <= '0';
--            count := DIN_WIDTH-1;
--        elsif rising_edge(tmds_clk) then
--            count := count + 1;
--            if count = 9 then
--                d_tmp <= din;
--            elsif count = 10 then
----                d_tmp <= din;
--                count := 0;
--            end if;
--            dout <= d_tmp(count);
--        end if;
--    end process;

    update_data: process(pix_clk)
    begin
        if rising_edge(pix_clk) and en = '1' then
            d_tmp <= din;
        end if;
    end process;
    
    send_data: process(tmds_clk)
     variable idx : natural range 0 to DIN_WIDTH;
    begin
        if rst = '1' then
            dout <= '0';
            idx := 0;
        elsif en = '0' then
            dout <= '0';
            idx := 0;
--        elsif (rising_edge(tmds_clk) or falling_edge(tmds_clk)) and en = '1' then
        elsif rising_edge(tmds_clk) and en = '1' then    
            idx := idx + 1;
            if(idx = DIN_WIDTH) then
                idx := 0;
            end if;
            
            dout <= d_tmp(idx);
        end if;
    end process;

end Behavioral;
