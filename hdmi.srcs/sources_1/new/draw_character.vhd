----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2023 18:50:53
-- Design Name: 
-- Module Name: draw_character - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

use work.image_generation_pkg.all;
use work.font_pkg.all;
use work.resolutions.all;

entity draw_character is
    Generic(
        X0 : natural := 0;  -- START_OF_DRAWING_AREA + 0-63 border 
        Y0 : natural := 0; -- START_OF_DRAWING_AREA + 0-111 border
        WIDTH : natural := FONT_WIDTH;
        HEIGHT : natural := FONT_HEIGHT
    );
    Port ( row       : in natural;
           column    : in natural;
           color     : in t_color;
           char      : in t_font;
           pix_color : out t_color
    );
end draw_character;

architecture Behavioral of draw_character is

begin

    process(row, column)
        variable set_color : t_color;
        variable img_col : natural;
        variable img_row : natural;        
    begin 
        set_color := BLACK;
        is_inside: if (row >= Y0 and row < Y0 + HEIGHT) and (column >= X0 and column < X0 + WIDTH) then       
            -- change index so it fits drawing area
            img_row := row - Y0;
            img_col := column - X0;           
            -- check pixel color
            set_color := get_font_color(img_col, img_row, color, char);        
        else 
            set_color := BLACK;
        end if is_inside;
        pix_color <= set_color;
    end process;

end Behavioral;
