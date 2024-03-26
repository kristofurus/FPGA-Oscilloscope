------------------------------------------------------------------------------------------------
-- Company: PW - WEITI
-- Engineer: Krzysztof Lada
-- 
-- Create Date: 31.10.2023 18:50:09
-- Design Name: 
-- Module Name: resolutions
-- Project Name: Oscilloscope with HDMI
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
------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- based on Pixel Clock 74.250 MHz and TMDS Clock 742.500 MHz for HD720P 
-- TMDS Clock = 10*Pixel Clock
-- does that mean we should have that fast TMDS Clock or can it be slower so 
-- we will have less fps?
------------------------------------------------------------------------------------------------
--                             RESOLUTIONS PARAMETERS                     
------------------------------------------------------------------------------------------------
--                       VGA        SVGA        HD720        HD1080
------------------------------------------------------------------------------------------------
-- Name            640x480p60  800x600p60  1280x720p60  1920x1080p30
-- Standard        Historical         DMT    CTA-770.3          274M
-- VIC                      1         N/A            4            34
-- Short Name         DMT0659         N/A         720p       1080p30
-- Aspect Ratio           4:3         4:3         16:9          16:9
-- Pixel Clock     25.175 MHz  40.000 MHz   74.250 MHz    74.250 MHz  
-- TMDS Clock     251.750 MHz 400.000 MHz  742.500 MHz   742.500 MHz
-- Active Pixels          640         800         1280          1920
-- Front Porch             16          40          110            88
-- Sync Width              96         128           40            44
-- Back Porch              48          88          220           148
-- Blanking Total         160         256          370           280
-- Total Pixels           800        1056         1650          2200
-- Sync Polarity          neg         pos          pos           pos
-- Active Lines           480         600          720          1080
-- Front Porch             10           1            5             4
-- Sync Width               2           4            5             5
-- Back Porch              33          23           20            36
-- Blanking Total          45          28           30            45
-- Total Lines            525         628          750          1125
-- Sync Polarity          neg         pos          pos           pos
-- Active Pixels      307,200     480,000      921,600     2,073,600
-- Data Rate             0.60        0.90         1.78          1.78
-- 8-bit Memory         2,400       3,750        7,200        16,200
-- 12-bit Memory        3,600       5,625       10,800        24,300
-- 24-bit Memory        7,200      11,250       21,600        48,600
-- 32-bit Memory        9,600      15,000       28,800        64,800
------------------------------------------------------------------------------------------------
--                    DATA REQUIRED FOR PICTURE GENERATION                                      
------------------------------------------------------------------------------------------------
--                       VGA        SVGA        HD720        HD1080
------------------------------------------------------------------------------------------------
--                             Horizontal Timings
------------------------------------------------------------------------------------------------
-- Active Pixels          640         800         1280          1920
-- Front Porch             16          40          110            88
-- Sync Width              96         128           40            44
-- Back Porch              48          88          220           148
-- Blanking Total         160         256          370           280
-- Total Pixels           800        1056         1650          2200
-- Sync Polarity          neg         pos          pos           pos
------------------------------------------------------------------------------------------------
--                             Vertical Timings
------------------------------------------------------------------------------------------------
-- Active Lines           480         600          720          1080
-- Front Porch             10           1            5             4
-- Sync Width               2           4            5             5
-- Back Porch              33          23           20            36
-- Blanking Total          45          28           30            45
-- Total Lines            525         628          750          1125
-- Sync Polarity          neg         pos          pos           pos
------------------------------------------------------------------------------------------------
-- 
--                      Video Signal block
--      0   HBP                                   HBP+AP  HBP+AP+HFP      TP-1           
--      |----|---------------------------------------|-------|------------| 0
--      |    |       Vertical back porch             |       |            |
--      |----|---------------------------------------|-------|------------| VBP
--      |    |                                       |       |            |
--      | H  |                                       | H     | Horizontal |
--      | B  |       Active Pixels                   | F     | Sync       |
--      | P  |                                       | P     |            |
--      |    |                                       |       |            |
--      |----|---------------------------------------|-------|------------| VBP+AP
--      |    |       Vertical Front Porch            |       |            |
--      |----|---------------------------------------|-------|------------| VBP+AP+VFP
--      |    |       Vertical Sync                   |       |            |
--      |----|---------------------------------------|-------|------------| TP-1

-- here we describe types and declare function (it's something like .h file in c++)
package resolutions is

-- TODO:
-- create test bench where we check if:
--  * RES_HEend and RES_HSyncEnd return same value
--  * RES_VEend and RES_VSyncEnd return same value
--  * For constants calculate manually beginning and end of all sectors
--    and check if they are the same as returned with functions

----------------------------------------------------------------------------------------------------------------------------------------------------
-- TYPEDEFS
----------------------------------------------------------------------------------------------------------------------------------------------------

type t_POLARITY is (neg, pos);

type t_RESOLUTION is record
--    res_type            : t_RES_TYPES;       -- resolution name eg.: VGA, SVGA
    -- horizontal timings
    h_active_pixels     : natural;      -- horizontal drawing area size
    h_front_porch       : natural;      -- pixels between sync and active pixels
    h_sync_width        : natural;      -- horizontal sync demarcates a line  
    h_back_porch        : natural;      -- pixels before active pixels
    h_blanking_total    : natural;      -- total number of not "drawing" pixels (unnecessary?)
    h_total_pixels      : natural;      -- total number of pixels
    h_sync_polarity     : t_POLARITY;   -- defines what is the idle and active state of the sync signal
    -- vertical timings
    v_active_pixels     : natural;      -- vertical drawing area size
    v_front_porch       : natural;      -- pixels between sync and active pixels
    v_sync_width        : natural;      -- vertical sync demarcates a frame
    v_back_porch        : natural;      -- pixels before active pixels
    v_blanking_total    : natural;      -- total number of not "drawing" pixels (unnecessary?)
    v_total_pixels      : natural;      -- total number of pixels
    v_sync_polarity     : t_POLARITY;   -- defines what is the idle and active state of the sync signal
end record t_RESOLUTION;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION DECLARATIONS
----------------------------------------------------------------------------------------------------------------------------------------------------

-- GETTERS 

-- total width and height
function RES_getTotalWidht(res: t_RESOLUTION) return natural;
function RES_getTotalHeight(res: t_RESOLUTION) return natural;

-- drawing area width and height
function RES_getDrawingWidth(res: t_RESOLUTION) return natural;
function RES_getDrawingHeight(res: t_RESOLUTION) return natural;

-- "ITERATORS"

-- Horizontal

function RES_HBegin(res: t_RESOLUTION) return natural;
function RES_HEnd(res: t_RESOLUTION) return natural;

function RES_HBackPorchBegin(res: t_RESOLUTION) return natural;
function RES_HBackPorchEnd(res: t_RESOLUTION) return natural;

function RES_HDrawingBegin(res: t_RESOLUTION) return natural;
function RES_HDrawingEnd(res: t_RESOLUTION) return natural;

function RES_HFrontPorchBegin(res: t_RESOLUTION) return natural;
function RES_HFrontPorchEnd(res: t_RESOLUTION) return natural;

function RES_HSyncBegin(res: t_RESOLUTION) return natural;
function RES_HSyncEnd(res: t_RESOLUTION) return natural;

-- Vertical

function RES_VBegin(res: t_RESOLUTION) return natural;
function RES_VEnd(res: t_RESOLUTION) return natural;

function RES_VDrawingBegin(res: t_RESOLUTION) return natural;
function RES_VDrawingEnd(res: t_RESOLUTION) return natural;

function RES_VBackPorchBegin(res: t_RESOLUTION) return natural;
function RES_VBackPorchEnd(res: t_RESOLUTION) return natural;

function RES_VFrontPorchBegin(res: t_RESOLUTION) return natural;
function RES_VFrontPorchEnd(res: t_RESOLUTION) return natural;

function RES_VSyncBegin(res: t_RESOLUTION) return natural;
function RES_VSyncEnd(res: t_RESOLUTION) return natural;

-- Checking current area function

function RES_isInDrawArea(res: t_RESOLUTION; h_idx: natural; v_idx: natural) return STD_LOGIC; 
function RES_isInHSync(res: t_RESOLUTION; h_idx: natural) return STD_LOGIC;
function RES_isInVSync(res: t_RESOLUTION; v_idx: natural) return STD_LOGIC;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- CONSTANTS
----------------------------------------------------------------------------------------------------------------------------------------------------

constant VGA : t_RESOLUTION := (
--    name                => "VGA",
    -- horizontal timings
    h_active_pixels     => 640,
    h_front_porch       => 16,
    h_sync_width        => 96,
    h_back_porch        => 48,
    h_blanking_total    => 160,
    h_total_pixels      => 800,
    h_sync_polarity     => neg,
    -- vertical timings
    v_active_pixels     => 480,
    v_front_porch       => 10,
    v_sync_width        => 2,
    v_back_porch        => 33,
    v_blanking_total    => 45,
    v_total_pixels      => 525,
    v_sync_polarity     => neg
);

constant VESA_640x480_75Hz : t_RESOLUTION := (
    -- horizontal timings
    h_active_pixels     => 640,
    h_front_porch       => 16,
    h_sync_width        => 64,
    h_back_porch        => 120,
    h_blanking_total    => 200,
    h_total_pixels      => 840,
    h_sync_polarity     => neg,
    -- vertical timings
    v_active_pixels     => 480,
    v_front_porch       => 1,
    v_sync_width        => 3,
    v_back_porch        => 16,
    v_blanking_total    => 20,
    v_total_pixels      => 500,
    v_sync_polarity     => neg
);

constant WAVESHARE_1024x600 : t_RESOLUTION := (
    -- horizontal timings
    h_active_pixels     => 1024,
    h_front_porch       => 5,
    h_sync_width        => 13,
    h_back_porch        => 270, -- other name blanking
    h_blanking_total    => 288,
    h_total_pixels      => 1312,
    h_sync_polarity     => neg,
    -- vertical timings
    v_active_pixels     => 600,
    v_front_porch       => 2,
    v_sync_width        => 3,
    v_back_porch        => 17,
    v_blanking_total    => 22,
    v_total_pixels      => 622,
    v_sync_polarity     => neg
);

constant SVGA : t_RESOLUTION := (
--    name                => "SVGA",
    -- horizontal timings
    h_active_pixels     => 800,
    h_front_porch       => 40,
    h_sync_width        => 128,
    h_back_porch        => 88,
    h_blanking_total    => 256,
    h_total_pixels      => 1056,
    h_sync_polarity     => pos,
    -- vertical timings
    v_active_pixels     => 600,
    v_front_porch       => 1,
    v_sync_width        => 4,
    v_back_porch        => 23,
    v_blanking_total    => 28,
    v_total_pixels      => 628,
    v_sync_polarity     => pos
);

constant HD720P : t_RESOLUTION := (
--    name                => "HD720P",
    -- horizontal timings
    h_active_pixels     => 1280,
    h_front_porch       => 110,
    h_sync_width        => 40,
    h_back_porch        => 220,
    h_blanking_total    => 370,
    h_total_pixels      => 1650,
    h_sync_polarity     => pos,
    -- vertical timings
    v_active_pixels     => 720,
    v_front_porch       => 5,
    v_sync_width        => 5,
    v_back_porch        => 20,
    v_blanking_total    => 30,
    v_total_pixels      => 750,
    v_sync_polarity     => pos
);

constant HD1080P : t_RESOLUTION := (
--    name                => "HD1080P",
    -- horizontal timings
    h_active_pixels     => 1920,
    h_front_porch       => 88,
    h_sync_width        => 44,
    h_back_porch        => 148,
    h_blanking_total    => 280,
    h_total_pixels      => 2200,
    h_sync_polarity     => pos,
    -- vertical timings
    v_active_pixels     => 1080,
    v_front_porch       => 4,
    v_sync_width        => 5,
    v_back_porch        => 36,
    v_blanking_total    => 45,
    v_total_pixels      => 1125,
    v_sync_polarity     => pos
);

end package;

-- here we define functions declared in "header" (it's something like .cpp file in c++)
package body resolutions is

----------------------------------------------------------------------------------------------------------------------------------------------------
-- WIDTH AND HEIGHT GETTERS
----------------------------------------------------------------------------------------------------------------------------------------------------

function RES_getTotalWidht(res: t_RESOLUTION) return natural is begin return res.h_total_pixels; end function;  
function RES_getTotalHeight(res: t_RESOLUTION) return natural is begin return res.v_total_pixels; end function;

function RES_getDrawingWidth(res: t_RESOLUTION) return natural is begin return res.h_active_pixels; end function;
function RES_getDrawingHeight(res: t_RESOLUTION) return natural is begin return res.v_active_pixels; end function;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- "ITERATORS"
----------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------
-- HORIZONTAL
----------------------------------------------------------------------------------------------------------------------------------------------------

-- beginning and end of the horizontal line
function RES_HBegin(res: t_RESOLUTION) return natural is begin return 0; end function;
function RES_HEnd(res: t_RESOLUTION) return natural is begin return res.h_total_pixels - 1; end function;

-- beginning and end of the back porch
function RES_HBackPorchBegin(res: t_RESOLUTION) return natural is 
begin 
    return RES_HBegin(res); -- begin
end function;

function RES_HBackPorchEnd(res: t_RESOLUTION) return natural is 
begin 
    return RES_HBackPorchBegin(res) + res.h_back_porch - 1; -- move to HBP - 1
end function;

-- beginning and end of active pixels
function RES_HDrawingBegin(res: t_RESOLUTION) return natural is
begin
    return RES_HBackPorchEnd(res) + 1; -- move to HBP
end function;
function RES_HDrawingEnd(res: t_RESOLUTION) return natural is
begin
    return RES_HDrawingBegin(res) + res.h_active_pixels - 1; --  move to HBP+AP - 1
end function;

-- beginning and end of front porch
function RES_HFrontPorchBegin(res: t_RESOLUTION) return natural is
begin
    return RES_HDrawingEnd(res) + 1; --  move to HBP+AP
end function;
function RES_HFrontPorchEnd(res: t_RESOLUTION) return natural is
begin
    return RES_HFrontPorchBegin(res) + res.h_front_porch - 1; --  move to HBP+AP+HFP-1
end function;

-- beggining and end of hsync
function RES_HSyncBegin(res: t_RESOLUTION) return natural is
begin
    return RES_HFrontPorchEnd(res) + 1; -- move to HBP+AP+HFP
end function;
function RES_HSyncEnd(res: t_RESOLUTION) return natural is 
begin
    return RES_HSyncBegin(res) + res.h_sync_width - 1; -- move to HBP+AP+HFP+HSync - 1;
end function;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- VERTICAL
----------------------------------------------------------------------------------------------------------------------------------------------------

-- beginning and end of the vertical line
function RES_VBegin(res: t_RESOLUTION) return natural is begin return 0; end function;
function RES_VEnd(res: t_RESOLUTION) return natural is begin return res.v_total_pixels - 1; end function;

-- beginning and end of the back porch
function RES_VBackPorchBegin(res: t_RESOLUTION) return natural is 
begin 
    return RES_VBegin(res); -- begin
end function;
function RES_VBackPorchEnd(res: t_RESOLUTION) return natural is 
begin 
    return RES_VBackPorchBegin(res) + res.v_back_porch - 1; -- move to VBP - 1
end function;

-- beginning and end of active pixels
function RES_VDrawingBegin(res: t_RESOLUTION) return natural is
begin
    return RES_VBackPorchEnd(res) + 1; -- move to VBP
end function;
function RES_VDrawingEnd(res: t_RESOLUTION) return natural is
begin
    return RES_VDrawingBegin(res) + res.v_active_pixels - 1; --  move to VBP+AP - 1
end function;

-- beginning and end of front porch
function RES_VFrontPorchBegin(res: t_RESOLUTION) return natural is
begin
    return RES_VDrawingEnd(res) + 1; --  move to VBP+AP
end function;
function RES_VFrontPorchEnd(res: t_RESOLUTION) return natural is
begin
    return RES_VFrontPorchBegin(res) + res.v_front_porch - 1; --  move to VBP+AP+VFP-1
end function;

-- beggining and end of vsync
function RES_VSyncBegin(res: t_RESOLUTION) return natural is
begin
    return RES_VFrontPorchEnd(res) + 1; -- move to VBP+AP+VFP
end function;
function RES_VSyncEnd(res: t_RESOLUTION) return natural is 
begin
    return RES_VSyncBegin(res) + res.v_sync_width - 1; -- move to VBP+AP+VFP+VSync - 1;
end function;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECKING CURRENT AREA
----------------------------------------------------------------------------------------------------------------------------------------------------

function RES_isInDrawArea(res: t_RESOLUTION; h_idx: natural; v_idx: natural) return STD_LOGIC is
begin
    if (h_idx >= RES_HDrawingBegin(res) and h_idx <= RES_HDrawingEnd(res)) and (v_idx >= RES_VDrawingBegin(res) and v_idx <= RES_VDrawingEnd(res)) then
        return '1';
    else
        return '0';
    end if;
end function;
 
function RES_isInHSync(res: t_RESOLUTION; h_idx: natural) return STD_LOGIC is
begin
    if (h_idx >= RES_HSyncBegin(res) and h_idx <= RES_HSyncEnd(res)) then
        if res.h_sync_polarity = pos then
            return '1';
        else
            return '0';
        end if;
    else
        if res.h_sync_polarity = pos then
            return '0';
        else
            return '1';
        end if;
    end if;  
end function;

function RES_isInVSync(res: t_RESOLUTION; v_idx: natural) return STD_LOGIC is
begin
    if (v_idx >= RES_VSyncBegin(res) and v_idx <= RES_VSyncEnd(res)) then
        if res.h_sync_polarity = pos then
            return '1';
        else
            return '0';
        end if;
    else
        if res.v_sync_polarity = pos then
            return '0';
        else
            return '1';
        end if;
    end if;
end function;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------------------------------------------------------------------

end package body;