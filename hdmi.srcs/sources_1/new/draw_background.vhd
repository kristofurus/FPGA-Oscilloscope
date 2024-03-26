----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 13:52:30
-- Design Name: 
-- Module Name: draw_background - Behavioral
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

use work.image_generation_pkg.all;
use work.resolutions.all;

entity draw_background is
    Generic(
        res    : t_RESOLUTION := VESA_640x480_75Hz
    );
    Port(
        row       : in natural;
        column    : in natural;
        color     : in t_color;
        pix_color : out t_color
    );
    
end draw_background;

architecture Behavioral of draw_background is

begin

    process(row, column)
        variable set_color : t_color;
        variable img_col : natural;
        variable img_row : natural;        
    begin 
        set_color := BLACK;
        is_inside: if RES_isInDrawArea(res, column, row) = '1' then        
            -- change index so it fits drawing area
            img_row := row - RES_VDrawingBegin(res);
            img_col := column - RES_HDrawingBegin(res);            
            -- check pixel color
            set_color := get_background_color(img_col, img_row, color);        
        else 
            set_color := BLACK;
        end if is_inside;
        pix_color <= set_color;
    end process;     
        
end Behavioral;
