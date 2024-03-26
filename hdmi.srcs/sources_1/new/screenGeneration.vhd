----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2023 18:23:42
-- Design Name: 
-- Module Name: screenGeneration - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- import package containing image info
use work.image_generation_pkg.all;
use work.font_pkg.all;
use work.resolutions.all;

entity screenGeneration is
    Generic(
        res : t_RESOLUTION := VESA_640x480_75Hz
    );
    Port ( -- CURRENT LOCATION INPUT
           h_idx : in natural;
           v_idx : in natural;
           -------------------------------------------------
           -- SIGNALS INPUT
           -- probably would be better if made as an array
           data : in t_data_out_array;
           valid : in t_valid_in_array;
           clk_reg : in std_logic;
           -------------------------------------------------
           -- RGB OUTPUT
           r : out STD_LOGIC_VECTOR (7 downto 0);
           g : out STD_LOGIC_VECTOR (7 downto 0);
           b : out STD_LOGIC_VECTOR (7 downto 0));
end screenGeneration;

architecture Behavioral of screenGeneration is

component draw_signal is
    Generic(
    X0 : natural := RES_HDrawingBegin(res) + 65;  -- START_OF_DRAWING_AREA + 0-63 border 
    Y0 : natural := RES_VDrawingBegin(res) + 112; -- START_OF_DRAWING_AREA + 0-111 border
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
end component;

component draw_background is
    Generic(
        res    : t_RESOLUTION := res
    );
    Port(
        row       : in natural;
        column    : in natural;
        color     : in t_color;
        pix_color : out t_color
    );
end component;

component draw_character is
    Generic(
        X0 : natural := RES_HDrawingBegin(res) + 10; 
        Y0 : natural := RES_VDrawingBegin(res) + 256 + 112 + 10;
        WIDTH : natural := FONT_WIDTH;
        HEIGHT : natural := FONT_HEIGHT
    );
    Port ( row       : in natural;
           column    : in natural;
           color     : in t_color;
           char      : in t_font;
           pix_color : out t_color
    );
end component;

component calculate_params is
    Generic (
        ARRAY_WIDTH : natural := PLOT_WIDTH
--        DATA_WIDTH : natural := 8 -- data width should be taken from image_generation_pkg
    );
    Port (
        clk_reg : in std_logic;
        values : in t_data(0 to ARRAY_WIDTH - 1);
        valid : in std_logic;
        ch1 : out t_font;
        ch2 : out t_font;
        ch3 : out t_font
    );

end component;

signal pixel_color : t_color := BLACK;
signal ch1, ch2, ch3 : t_signal_chars;

signal pixel_color_arr : t_ucolor_vector(0 to 36) := (others => BLACK);

begin

    background: draw_background port map (
        row => v_idx,
        column => h_idx,
        color => WHITE,
        pix_color => pixel_color_arr(0)
    );

    signals_in: for i in 0 to NUMBER_OF_SIGNALS - 1 generate
    
        sig_in : draw_signal port map (
            row => v_idx,
            column => h_idx,
            color => COLORS(i),
            data => data(i),
            valid => valid(i),
            pix_color => pixel_color_arr(1+9*i)
        );
    
    end generate;
    
    chars: for i in 0 to NUMBER_OF_SIGNALS - 1 generate
    
    calc: calculate_params port map (
        clk_reg=>clk_reg,
        values => data(i),
        valid => valid(i),
        ch1 => ch1(i),
        ch2 => ch2(i), 
        ch3 => ch3(i)
    );
    
--    charV: draw_character generic map (
--        X0 => RES_HDrawingBegin(res) + 10 + 160*i,  -- START_OF_DRAWING_AREA + 0-63 border 
--        Y0 => RES_VDrawingBegin(res) + 480 - 50 -- START_OF_DRAWING_AREA + 0-111 border
--    ) port map (
--            row => v_idx,
--            column => h_idx,
--            color => COLORS(i),
--            char => CHARACTER_V_upper,
--            pix_color => pixel_color_arr(2+9*i)
--    );
    
--    char_p1: draw_character generic map (
--        X0 => RES_HDrawingBegin(res) + 10 + 160*i + FONT_WIDTH,  -- START_OF_DRAWING_AREA + 0-63 border 
--        Y0 => RES_VDrawingBegin(res) + 480 - 50 -- START_OF_DRAWING_AREA + 0-111 border
--    ) port map (
--            row => v_idx,
--            column => h_idx,
--            color => COLORS(i),
--            char => CHARACTER_p,
--            pix_color => pixel_color_arr(3+9*i)
--    );
    
--    char_p2: draw_character generic map (
--        X0 => RES_HDrawingBegin(res) + 10 + 160*i + FONT_WIDTH*2 ,  -- START_OF_DRAWING_AREA + 0-63 border 
--        Y0 => RES_VDrawingBegin(res) + 480 - 50 -- START_OF_DRAWING_AREA + 0-111 border
--    ) port map (
--            row => v_idx,
--            column => h_idx,
--            color => COLORS(i),
--            char => CHARACTER_p,
--            pix_color => pixel_color_arr(4+9*i)
--    );
    
--    char_eq: draw_character generic map (
--        X0 => RES_HDrawingBegin(res) + 10 + 160*i + FONT_WIDTH*3 ,  -- START_OF_DRAWING_AREA + 0-63 border 
--        Y0 => RES_VDrawingBegin(res) + 480 - 50 -- START_OF_DRAWING_AREA + 0-111 border
--    ) port map (
--            row => v_idx,
--            column => h_idx,
--            color => COLORS(i),
--            char => CHARACTER_EQ,
--            pix_color => pixel_color_arr(5+9*i)
--    );
    
    char_val1: draw_character generic map (
        X0 => RES_HDrawingBegin(res) + 10 + 160*i + FONT_WIDTH*4 ,
        Y0 => RES_VDrawingBegin(res) + 480 - 50
    ) port map (
            row => v_idx,
            column => h_idx,
            color => COLORS(i),
            char => ch1(i),
            pix_color => pixel_color_arr(6+9*i)
    );
    
    char_dot: draw_character generic map (
        X0 => RES_HDrawingBegin(res) + 10 + 160*i + FONT_WIDTH*5 ,
        Y0 => RES_VDrawingBegin(res) + 480 - 50 
    ) port map (
            row => v_idx,
            column => h_idx,
            color => COLORS(i),
            char => CHARACTER_DOT,
            pix_color => pixel_color_arr(7+9*i)
    );
    
    char_val2: draw_character generic map (
        X0 => RES_HDrawingBegin(res) + 10 + 160*i + FONT_WIDTH*6 , 
        Y0 => RES_VDrawingBegin(res) + 480 - 50 
    ) port map (
            row => v_idx,
            column => h_idx,
            color => COLORS(i),
            char => ch2(i),
            pix_color => pixel_color_arr(8+9*i)
    );
    
    char_val3: draw_character generic map (
        X0 => RES_HDrawingBegin(res) + 10 + 160*i + FONT_WIDTH*7 , 
        Y0 => RES_VDrawingBegin(res) + 480 - 50 
    ) port map (
            row => v_idx,
            column => h_idx,
            color => COLORS(i),
            char => ch3(i),
            pix_color => pixel_color_arr(9+9*i)
    );
    
    end generate;
    
    -- there is no resolution function in synthesis.., or I don't know how to use it
    -- or it just works differently than I assumed
    pixel_color <= resolved(pixel_color_arr); 
    
    -- conversion from color name to RGB value
    r <= gen_color(pixel_color)(23 downto 16);
    g <= gen_color(pixel_color)(15 downto 8);
    b <= gen_color(pixel_color)(7 downto 0);
    
end Behavioral;
