----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 12:43:59
-- Design Name: 
-- Module Name: draw_signal - Behavioral
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

entity draw_signal is
    Generic(
    X0 : natural := 0;  -- START_OF_DRAWING_AREA + 0-63 border 
    Y0 : natural := 0; -- START_OF_DRAWING_AREA + 0-111 border
    WIDTH : natural := PLOT_WIDTH;
    HEIGHT : natural := PLOT_HEIGHT
    );
    Port ( row       : in natural;
           column    : in natural;
           color     : in t_color;
           data      : in t_data(0 to PLOT_WIDTH - 1);
           valid     : in std_logic;
           pix_color : out t_color
    );
end draw_signal;

architecture Behavioral of draw_signal is

begin

process(row, column)

variable curr_val, prev_val : unsigned(DATA_WIDTH-1 downto 0);
variable set_color : t_color := BLACK;

variable img_col : natural;
variable img_row : unsigned(DATA_WIDTH-1 downto 0);

begin
    set_color := BLACK;
    is_valid: if valid = '1' then
        is_inside: if (row >= Y0 and row < (Y0 + HEIGHT)) and (column >= X0 and column < (X0 + WIDTH)) then
        
            img_row := to_unsigned(row - Y0, DATA_WIDTH);
            img_col := column - X0;
        
            prep_vals: if img_col = 0 then
                -- first value so there is no previous
                prev_val := PLOT_HEIGHT - unsigned(data(img_col));
                curr_val := PLOT_HEIGHT - unsigned(data(img_col));
            else
                -- get both previous and current value
                prev_val := PLOT_HEIGHT - unsigned(data(img_col - 1));
                curr_val := PLOT_HEIGHT - unsigned(data(img_col));
            end if prep_vals;
            
            set_pixel : if img_row = curr_val then 
                -- if current pixel is current value
                set_color := color;
            elsif img_row > curr_val and img_row < prev_val then
                -- if current pixel is higher than current value AND lower than previous value
                --
                -- P
                --  R
                --  R
                --  C
                set_color := color;
            elsif img_row < curr_val and img_row > prev_val then
                -- if current pixel is lower than current value AND higher than previous value
                --  
                --  C
                --  R
                --  R
                -- P
                set_color := color;
            else
                -- in every other situation set_color should stay black
                set_color := BLACK;
            end if set_pixel;
        else
            set_color := BLACK;        
        end if is_inside;
    end if is_valid;
    
    pix_color <= set_color;
end process;

end Behavioral;
