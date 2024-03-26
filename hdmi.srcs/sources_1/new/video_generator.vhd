----------------------------------------------------------------------------------
-- Company: PW - WEITI
-- Engineer: Krzysztof Lada
-- 
-- Create Date: 31.10.2023 14:51:22
-- Design Name: 
-- Module Name: video_generator 
-- Project Name: Oscilloscope with HDMI
-- Target Devices: 
-- Tool Versions: 
-- Description: package defining constant and types for HDMI resolutions
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
library UNISIM;
use UNISIM.VComponents.all;

use work.resolutions.all;

entity video_generator is
    Generic (
        res : t_RESOLUTION := VESA_640x480_75Hz
    );
    port(
        -- rst and clocks
--        sysclk      : in std_logic; -- slow pixel clock
        -- sysclk changed to pixel_clk and tmds_clk as it is 
        pixel_clk   : in std_logic;
        tmds_clk    : in std_logic;
        -- signal informing that clocks are enable
        clk_en      : in std_logic; 
        
        rst         : in std_logic;
        -- RGB input
        data_r      : in std_logic_vector(7 downto 0);
        data_g      : in std_logic_vector(7 downto 0);
        data_b      : in std_logic_vector(7 downto 0);
--         data input (instead of RGB input)
--        data        : in std_logic_vector(23 downto 0);
        -- TMDS clock output 
        clk_p       : out std_logic;
        clk_n       : out std_logic;
        -- TMDS data output
        dataR_p      : out std_logic;
        dataR_n      : out std_logic;
        dataG_p      : out std_logic;
        dataG_n      : out std_logic;
        dataB_p      : out std_logic;
        dataB_n      : out std_logic;
        
        -- current pixel location for screen generation
        h_idx        : out natural;
        v_idx        : out natural;
        screen_clk   : out std_logic -- clock signal for screen memeory
    );
end video_generator;

architecture Behavioral of video_generator is

-- selected resolution
--constant res : t_RESOLUTION := VESA_640x480_75Hz;
constant TMDS_WIDHT : integer := 10;

-- clock signals
-- moved to main part as generator changed
--signal pixel_clk : std_logic;
--signal tmds_clk : std_logic;

-- current pixel location
signal counter_h : natural := 0;  -- horizontal counter
signal counter_v : natural := 0;  -- vertical counter

-- sync and draw paramater
signal sync     : std_logic_vector(1 downto 0) := "00";
signal draw_en  : STD_LOGIC := '0';

-- current tmds values
signal tmds_r   : std_logic_vector(9 downto 0) := (others=>'0');
signal tmds_g   : std_logic_vector(9 downto 0) := (others=>'0');
signal tmds_b   : std_logic_vector(9 downto 0) := (others=>'0');

-- current serialized tmds values
signal r_diff : std_logic := '0';
signal g_diff : std_logic := '0';
signal b_diff : std_logic := '0';

-- enable signal activating blocks
--signal clk_en       : std_logic := '0';
signal encoder_en   : std_logic := '0';
signal serial_en    : std_logic := '0';

signal clk_out      : std_logic := '0';

----------------------------------------------------------------------------------------------------------------------------
-- COMPONENTS
----------------------------------------------------------------------------------------------------------------------------

--component clock_gen_wrapper
--  Port (
--    clk_in : in STD_LOGIC;
--    pixel_clk : out STD_LOGIC;
--    reset_rtl : in STD_LOGIC;
--    pll_en : out STD_LOGIC;
--    tmds_clk : out STD_LOGIC
--  );
--end component;

component counter
    Generic ( res : t_RESOLUTION := res); -- should it be a signal so that it can be changed on the fly?
    Port ( pix_clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           sync : out STD_LOGIC_VECTOR (1 downto 0);
           count_h : out natural;
           count_v : out natural;
           draw_en : out STD_LOGIC);
end component;

component encoder_wrapper is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ctrl : in STD_LOGIC_VECTOR ( 1 downto 0 );
    d_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    d_out : out STD_LOGIC_VECTOR ( 9 downto 0 );
    draw_en : in STD_LOGIC
  );
end component;

component serializer is
    Generic (
        DIN_WIDTH : integer := 10
    );
    Port ( 
        rst : STD_LOGIC;
        en  : in STD_LOGIC;
        pix_clk : in STD_LOGIC;
        tmds_clk : in STD_LOGIC;
        din : in STD_LOGIC_VECTOR (DIN_WIDTH-1 downto 0);
        dout : out STD_LOGIC);
end component;

component tmds_encoder is
    Generic (
            DIN_WIDTH : natural := 8;
            DOUT_WIDTH : natural := 10
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en  : in STD_LOGIC;
           draw_en : in STD_LOGIC;
           ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           din : in STD_LOGIC_VECTOR (DIN_WIDTH-1 downto 0);
           dout : out STD_LOGIC_VECTOR (DOUT_WIDTH-1 downto 0));
end component;

begin

    -- enable signal encoding
    process(clk_en, pixel_clk)
    begin
        if clk_en = '0' then
            encoder_en <= '0';
        elsif clk_en = '1' and rising_edge(pixel_clk) then
            encoder_en <= '1';
        end if;
    end process;
  
    -- enable serial output
    process(encoder_en, pixel_clk)
    begin
        if encoder_en = '0' then
            serial_en <= '0';
        elsif encoder_en = '1' and rising_edge(pixel_clk) then
            serial_en <= '1';
        end if;
    end process;
    
    -- 
    process(counter_h, counter_v, clk_en)
    begin
        if counter_h = 0 and counter_v = 0 and clk_en = '1' then
            screen_clk <= '1';
        else 
            screen_clk <= '0';
         end if;    
    end process;
    
    h_idx <= counter_h;
    v_idx <= counter_v;
    
    -- generate pixel and tmds clock using FPGA clock
--    clk_gen: clock_gen_wrapper port map(clk_in=>sysclk, pll_en=>clk_en, pixel_clk=>pixel_clk, tmds_clk=>tmds_clk, reset_rtl=>rst);
    
    -- count pixel horizontal and vertical location
    cnt: counter generic map(res=>res) port map(pix_clk=>pixel_clk, en=>encoder_en, rst=>rst, sync=>sync, count_h=>counter_h, count_v=>counter_v, draw_en=>draw_en);

    -- Encode RGB to TDMS
    -- sync is only send by blue line both Red and Green must be held to logic low. 
    enc_r: tmds_encoder port map(clk=>pixel_clk, en=>encoder_en, rst=>rst, ctrl=>"00", din=>data_r, dout=>tmds_r, draw_en=>draw_en);
    enc_g: tmds_encoder port map(clk=>pixel_clk, en=>encoder_en, rst=>rst, ctrl=>"00", din=>data_g, dout=>tmds_g, draw_en=>draw_en);
    enc_b: tmds_encoder port map(clk=>pixel_clk, en=>encoder_en, rst=>rst, ctrl=>sync, din=>data_b, dout=>tmds_b, draw_en=>draw_en);
    
    -- Serialize TMDS data
    serial_r: serializer generic map(DIN_WIDTH=>TMDS_WIDHT)port map(rst=>rst, en=>serial_en, pix_clk=>pixel_clk, tmds_clk=>tmds_clk, din=>tmds_r, dout=>r_diff);
    serial_g: serializer generic map(DIN_WIDTH=>TMDS_WIDHT)port map(rst=>rst, en=>serial_en, pix_clk=>pixel_clk, tmds_clk=>tmds_clk, din=>tmds_g, dout=>g_diff);
    serial_b: serializer generic map(DIN_WIDTH=>TMDS_WIDHT)port map(rst=>rst, en=>serial_en, pix_clk=>pixel_clk, tmds_clk=>tmds_clk, din=>tmds_b, dout=>b_diff);
    
--    serial_clk: serializer generic map(DIN_WIDTH=>TMDS_WIDHT)port map(rst=>rst, en=>serial_en, pix_clk=>pixel_clk, tmds_clk=>tmds_clk, din=>"0000011111", dout=>clk_out);
    
    -- Send data and tmds clock with differential output
    
    -- OBUFDS is differential buffer from Xilinx UNISIM library
    -- more about OBUFDS but documentation says about UltraScale and UltraScale+ family
    -- so maybe it's better to just wire signals 
    -- https://docs.xilinx.com/r/2022.2-English/ug974-vivado-ultrascale-libraries/OBUFDS
    r_diff_pair: OBUFDS generic map (IOSTANDARD=>"TMDS_33", SLEW => "FAST") port map(O => dataR_p, OB=>dataR_n, I=>r_diff);
    g_diff_pair: OBUFDS generic map (IOSTANDARD=>"TMDS_33", SLEW => "FAST") port map(O => dataG_p, OB=>dataG_n, I=>g_diff);
    b_diff_pair: OBUFDS generic map (IOSTANDARD=>"TMDS_33", SLEW => "FAST") port map(O => dataB_p, OB=>dataB_n, I=>b_diff);
    
    c_diff_pair: OBUFDS generic map (IOSTANDARD=>"TMDS_33", SLEW => "FAST") port map(O => clk_p, OB=>clk_n, I=>clk_out);

    -- sended clock is said to be pixel clock instead of tmds_clk
    serial_clk: process(tmds_clk)
    begin 
    
--        if rising_edge(tmds_clk) or falling_edge(tmds_clk) then
        if rising_edge(tmds_clk) then
            if serial_en = '1' then
                clk_out <= pixel_clk;
    --            clk_n <= not tmds_clk;
            else 
                clk_out <= '0';
    --            clk_n <= '1';
            end if;
        end if;
    end process serial_clk;
    
--        clk_p <= clk_out;
--        clk_n <= not clk_out;
        
--        dataR_p <= r_diff;
--        dataR_n <= not r_diff;
        
--        dataG_p <= g_diff;
--        dataG_n <= not g_diff;
        
--        dataB_p <= b_diff;
--        dataB_n <= not b_diff;
        
end Behavioral;