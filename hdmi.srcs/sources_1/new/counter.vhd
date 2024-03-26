----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2023 11:39:03
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.resolutions.all;

entity counter is
    Generic ( res : t_RESOLUTION := VESA_640x480_75Hz); -- should it be a signal so that it can be changed on the fly?
    Port ( pix_clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           sync : out STD_LOGIC_VECTOR (1 downto 0);
           count_h : out natural;
           count_v : out natural;
           draw_en : out STD_LOGIC);
end counter;

architecture Behavioral of counter is

signal counter_h : natural := 0;  -- x counter
signal counter_v : natural := 0;  -- y counter

begin

    count_h <= counter_h;
    count_v <= counter_v;
    
    process(pix_clk) is
    begin
    
        if rst = '1' then
            counter_h <= 0;
            counter_v <= 0;
        elsif en = '0' then
            counter_h <= 0;
            counter_v <= 0;
        elsif rising_edge(pix_clk) and en = '1' then
            
            horizontal_check: if(counter_h = RES_HEnd(res)) then 
            -- we got to the line end so we go to begin and update vertical value
                counter_h <= 0;
                vertical_check: if(counter_v = RES_VEnd(res)) then
                    counter_v <= 0;
                else
                    counter_v <= counter_v + 1;
                end if vertical_check;
            else
                counter_h <= counter_h + 1;
            end if horizontal_check;
        end if;
    end process;
    
    -- update draw enable
    draw_en <= RES_isInDrawArea(res, counter_h, counter_v);
    
    -- update sync
    sync <= RES_isInHSync(res, counter_h) & RES_isInVSync(res, counter_v);

end Behavioral;
