----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2023 12:45:51
-- Design Name: 
-- Module Name: resolutions_tb - Behavioral
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

entity resolutions_tb is
--  Port ( );
end resolutions_tb;

architecture Behavioral of resolutions_tb is

    signal res : t_RESOLUTION := VGA;
    
    signal hbp_beg : natural;
    signal hbp_end : natural;
    
    signal hap_beg : natural;
    signal hap_end : natural;
    
    signal hfp_beg : natural;
    signal hfp_end : natural;
    
    signal hsync_beg : natural;
    signal hsync_end : natural;
    
    signal hend : natural;
    
    signal vbp_beg : natural;
    signal vbp_end : natural;
    
    signal vap_beg : natural;
    signal vap_end : natural;
    
    signal vfp_beg : natural;
    signal vfp_end : natural;
    
    signal vsync_beg : natural;
    signal vsync_end : natural;
    
    signal vend : natural;

begin

    process(res)
    begin

        hbp_beg <= RES_HBackPorchBegin(res);
        hbp_end <= RES_HBackPorchEnd(res);
        
        hap_beg <= RES_HDrawingBegin(res);
        hap_end <= RES_HDrawingEnd(res);
        
        hfp_beg <= RES_HFrontPorchBegin(res);
        hfp_end <= RES_HFrontPorchEnd(res);
        
        hsync_beg <= RES_HSyncBegin(res);
        hsync_end <= RES_HSyncEnd(res);
        
        hend <= RES_HEnd(res);
        
        vbp_beg <= RES_VBackPorchBegin(res);
        vbp_end <= RES_VBackPorchEnd(res);
        
        vap_beg <= RES_VDrawingBegin(res);
        vap_end <= RES_VDrawingEnd(res);
        
        vfp_beg <= RES_VFrontPorchBegin(res);
        vfp_end <= RES_VFrontPorchEnd(res);
        
        vsync_beg <= RES_VSyncBegin(res);
        vsync_end <= RES_VSyncEnd(res);
        
        vend <= RES_VEnd(res);

        assert hend = hsync_end
        report "RES_HEnd and RES_HSyncEnd gave different values. RES_HEnd = " 
                & integer'image(hend) & " RES_HSyncEnd = " & integer'image(hsync_end)
        severity error;
        
        assert vend = vsync_end
        report "RES_VEnd and RES_VSyncEnd gave different values. RES_VEnd = " 
                & integer'image(vend) & " RES_VSyncEnd = " & integer'image(vsync_end)
        severity error;
        
    end process;
    
    process 
    begin
        res <= VGA;
        wait for 20 ns;
        res <= SVGA;
        wait for 20 ns;
        res <= HD720P;
        wait for 20 ns;
        res <= HD1080P;
        wait for 20 ns;
    end process;

end Behavioral;
