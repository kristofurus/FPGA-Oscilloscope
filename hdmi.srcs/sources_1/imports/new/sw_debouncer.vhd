
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sw_debouncer is
    generic ( delay: integer  := 1_250_000); --10 ms opoznienia
    Port ( clk      : in std_logic;
           btn_in   : in std_logic;
           btn_out  : out std_logic);
end sw_debouncer;

architecture Behavioral of sw_debouncer is

 signal count   : integer := 0;
 signal btn_tmp : std_logic := '0';

begin

process(clk)

begin
        if(clk'event and clk = '1') then
            if (btn_in /= btn_tmp) then
                btn_tmp <= btn_in;
                count <= 0;
            elsif (count = delay) then 
                btn_out <= btn_tmp;
            else   
                count <= count + 1;
            end if;
        end if;
end process;

end Behavioral;

