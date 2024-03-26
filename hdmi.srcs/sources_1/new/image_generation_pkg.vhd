----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 01:29:06 PM
-- Design Name: 
-- Module Name: image_generation_pkg - Behavioral
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

-- import package containing generated background and font
use work.font_pkg.all;

package image_generation_pkg is

----------------------------------------------------------------------------------------------------------------------------
-- DATA
----------------------------------------------------------------------------------------------------------------------------

constant PLOT_WIDTH  : natural := 512; -- number of samples
-- na potrzeby symulacji signal_register_tb
--constant PLOT_WIDTH  : natural := 100; -- number of samples
constant PLOT_HEIGHT : natural := 256; -- value range of sample
constant DATA_WIDTH  : natural := 8;   -- number of bits in single sample

constant DATA_IN_WIDTH : natural := 12;

-- array containing values of signal for each "column"
type t_data is array(natural range <>) of std_logic_vector(DATA_WIDTH-1 downto 0);
--type t_data is array(natural range <>) of std_logic_vector;

-- number of signals
constant MAX_NUMBER_OF_SIGNALS : natural := 4;
-- array for data arrays (outputs from memory)
type t_data_out_array is array (0 to MAX_NUMBER_OF_SIGNALS - 1) of t_data(0 to PLOT_WIDTH - 1);
-- array for valid output from memory
type t_valid_out_array is array (0 to MAX_NUMBER_OF_SIGNALS - 1) of std_logic_vector(PLOT_WIDTH-1 downto 0); 
-- array for data input to memory
type t_data_in_array is array (0 to MAX_NUMBER_OF_SIGNALS - 1) of std_logic_vector(DATA_IN_WIDTH-1 downto 0);
-- array for valid input to memory
type t_valid_in_array is array (0 to MAX_NUMBER_OF_SIGNALS - 1) of std_logic; -- it could be std_logic_vector but for clarity

----------------------------------------------------------------------------------------------------------------------------
-- COLORS
----------------------------------------------------------------------------------------------------------------------------

-- unique colors are:
-- 0: (0  , 0  , 0  )   | BLACK
-- 1: (255, 255, 255)   | WHITE
-- 2: (255, 0  , 0  )   | RED
-- 3: (0  , 255, 0  )   | GREEN
-- 4: (0  , 0  , 255)   | BLUE
-- 5: (0  , 255, 255)   | CYAN
-- 6: (255, 0  , 255)   | MAGENTA
-- 7: (255, 255, 0  )   | YELLOW

-- Unresolved pixel type that will be resolved with help of color_table and resolution function

type t_ucolor is (BLACK, WHITE, RED, GREEN, BLUE, CYAN, MAGENTA, YELLOW);
type t_ucolor_vector is array(natural range <>) of t_ucolor;
type t_color_table is array(t_ucolor, t_ucolor) of t_ucolor;

constant color_table : t_color_table := (
--  ------------------------------------------------------------------------------------------
--  | BLACK     WHITE    RED      GREEN,   BLUE,    CYAN,    MAGENTA, YELLOW       |         |
--  ------------------------------------------------------------------------------------------
    ( BLACK,    WHITE,   RED,     GREEN,   BLUE,    CYAN,    MAGENTA, YELLOW),  -- | BLACK   |
    ( WHITE,    WHITE,   RED,     GREEN,   BLUE,    CYAN,    MAGENTA, YELLOW),  -- | WHITE   |
    ( RED,      RED,     RED,     GREEN,   BLUE,    CYAN,    MAGENTA, YELLOW),  -- | RED     |
    ( GREEN,    GREEN,   GREEN,   GREEN,   BLUE,    CYAN,    MAGENTA, YELLOW),  -- | GREEN   |
    ( BLUE,     BLUE,    BLUE,    BLUE,    BLUE,    CYAN,    MAGENTA, YELLOW),  -- | BLUE    |
    ( CYAN,     CYAN,    CYAN,    CYAN,    CYAN,    CYAN,    MAGENTA, YELLOW),  -- | CYAN    |
    ( MAGENTA,  MAGENTA, MAGENTA, MAGENTA, MAGENTA, MAGENTA, MAGENTA, YELLOW),  -- | MAGENTA |
    ( YELLOW,   YELLOW,  YELLOW,  YELLOW,  YELLOW,  YELLOW,  YELLOW,  YELLOW)   -- | YELLOW  |
);

-- pixel color resolution function
function resolved( color: t_ucolor_vector) return t_ucolor;

-- resolved type of pixel color so we can try to assing multiple colors to one pixel and select 
-- color with highest weight
subtype t_color is resolved t_ucolor; 

-- signal colors
--type t_signal_color is array (0 to NUMBER_OF_SIGNALS - 1) of t_color;
type t_signal_color is array (0 to MAX_NUMBER_OF_SIGNALS - 1) of t_color;
constant COLORS : t_signal_color := (YELLOW, CYAN, GREEN, MAGENTA);

type t_color_arr is array(natural range <>) of t_color;

----------------------------------------------------------------------------------------------------------------------------
-- RGB GENERATION
----------------------------------------------------------------------------------------------------------------------------

constant CHARACTER_EMPTY : t_font := CHARACTER_32;
constant CHARACTER_EQ    : t_font := CHARACTER_61;
constant CHARACTER_DOT   : t_font := CHARACTER_46;

type t_signal_chars is array (0 to MAX_NUMBER_OF_SIGNALS - 1) of t_font;
type char_array is array (0 to 9) of t_font;

constant NUMBERS : char_array := (CHARACTER_0, CHARACTER_1, CHARACTER_2, CHARACTER_3, CHARACTER_4, 
                                  CHARACTER_5, CHARACTER_6, CHARACTER_7, CHARACTER_8, CHARACTER_9); 

function gen_color(color : t_color) return std_logic_vector;

function get_background_color(column: natural; row: natural; color : t_color) return t_color;
function get_font_color(column: natural; row: natural; color : t_color; char : t_font) return t_color;
function get_font_color(column: natural; row: natural; color : t_color) return t_color;

-- since it is not read from 2d array but generated based on values it shouldnt be here probably
function get_signal_color(is_colored: std_logic; color : t_color) return t_color; 

end package;

package body image_generation_pkg is

function resolved( color: t_ucolor_vector) return t_ucolor is
    variable res: t_ucolor := BLACK;
begin

    if color'length = 1 then
        res := color(color'low);
    else 
        for i in color'range loop
            res := color_table(res, color(i));
        end loop;
    end if;
    return res;
end function;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function gen_color(color : t_color) return std_logic_vector is 
    variable output : std_logic_vector(23 downto 0) := "000000000000000000000000";
begin

    case color is
                               -- "RRRRRRRRGGGGGGGGBBBBBBBB"    
        when BLACK   => output := "000000000000000000000000"; -- background color
        when WHITE   => output := "111111111111111111111111"; -- background elements color
        when RED     => output := "000000000000000011111111"; -- N/A
        when GREEN   => output := "000000001111111100000000"; -- channel 3
        when BLUE    => output := "000000000000000011111111"; -- N/A
        when CYAN    => output := "000000001111111111111111"; -- channel 2
        when MAGENTA => output := "111111110000000011111111"; -- channel 4
        when YELLOW  => output := "111111111111111100000000"; -- channel 1 
        when others  => output := "000000000000000000000000"; -- only if something unexpected happens
                               -- "RRRRRRRRGGGGGGGGBBBBBBBB" 
    end case;

    return output;

end function;

function get_background_color(column: natural; row: natural; color : t_color) return t_color is
    variable output : t_color := BLACK;
begin
    if (row >= 0 and row < IMG_HEIGHT) and (column >= 0 and column < IMG_WIDTH) then
        if BACKGROUND(row, column) = 0 then
            output := BLACK;
        elsif BACKGROUND(row, column) = 1 then
            output := color;
        end if;
   end if; 
   return output;
end function;

function get_font_color(column: natural; row: natural; color : t_color; char : t_font) return t_color is
    variable output : t_color := BLACK;
begin
    if (row >= 0 and row < FONT_HEIGHT) and (column >= 0 and column < FONT_HEIGHT) then
        if char(row, column) = 0 then
            output := BLACK;
        elsif char(row, column) = 1 then
            output := color;
        end if;
   end if; 
   return output;
end function;

function get_font_color(column: natural; row: natural; color : t_color) return t_color is 
begin
    return get_font_color(column, row, color, CHARACTER_EMPTY);
end function;

function get_signal_color(is_colored: std_logic; color : t_color) return t_color is
    variable output : t_color := BLACK;
begin
    if is_colored = '1' then
        output := color;
    else
        output := BLACK;
    end if; 
    return output;
end function; 

end package body;