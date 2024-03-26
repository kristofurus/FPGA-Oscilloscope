----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2023 12:38:06
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

use work.resolutions.all;

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is

    constant res :        t_RESOLUTION := VGA;
    signal pix_clk :    std_logic := '0';
    signal sync :       std_logic_vector(1 downto 0);
    signal count_h :    natural;
    signal count_v :    natural;
    signal draw_en :    std_logic;
    
    signal count_draw   : natural :=0;
    signal count_draw_h : natural :=0;
    signal count_draw_v : natural :=0;
    signal count_Hsync  : natural :=0;    
    signal count_Vsync  : natural :=0;    
    
    component counter is 
        Generic ( res : t_RESOLUTION := VESA_640x480_75Hz); -- should it be a signal so that it can be changed on the fly?
        Port ( pix_clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               en : in STD_LOGIC;
               sync : out STD_LOGIC_VECTOR (1 downto 0);
               count_h : out natural;
               count_v : out natural;
               draw_en : out STD_LOGIC);
    end component;
    
begin

    count1: counter 
    generic map(res => res)
    port map(
        pix_clk => pix_clk,
        rst => '0',
        en => '1',
        sync => sync,
        count_h => count_h,
        count_v => count_v,
        draw_en => draw_en);

    process 
    begin
        pix_clk <= not pix_clk;
        wait for 100 ns;
    end process;
    
    counter_draw_h: process(count_h)
    begin
        if draw_en = '1' then
            count_draw_h <= count_draw_h + 1;
            count_draw <= count_draw + 1;
        end if;
        
        if sync(1) = '0' then
            count_draw_h <= 0;
        end if;
        
        if sync = "00" then
            count_draw <= 0;
        end if;               
        
    end process counter_draw_h;
    
    counter_draw_v: process(count_v)
    begin
        if count_v >= RES_VDrawingBegin(res) and count_v <= RES_VDrawingEnd(res) then -- not active when count_v updated
            count_draw_v <= count_draw_v + 1;
        end if; 
        
        if sync(0) = '0' then
            count_draw_v <= 0;
        end if;
        
    end process counter_draw_v;
    
    counter_Hsync: process(count_h)
    begin
        if sync(1) = '0' then
            count_Hsync <= count_Hsync + 1;
        elsif count_h = 0 then
            count_Hsync <= 0;
        end if;
    end process counter_Hsync;
    
    counter_Vsync: process(count_v)
    begin
        if sync(0) = '0' then
            count_Vsync <= count_Vsync + 1;
        elsif count_v = 0 then
            count_Vsync <= 0;
        end if;
    end process counter_Vsync;

end Behavioral;
