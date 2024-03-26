----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 14:44:56
-- Design Name: 
-- Module Name: oscilloscope - Behavioral
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

use work.image_generation_pkg.all;  -- color settings
use work.resolutions.all;           -- resolution settings
use work.font_pkg.all;              -- font and background maps

entity oscilloscope is
    Port (
    
        -- XADC
--        ja      : in std_logic_vector(7 downto 0);
    
        -- system clock and reset
        sysclk  : in STD_LOGIC;
        rst     : in STD_LOGIC;
        
        -- I2C 
        sda     : INOUT STD_LOGIC;
        scl     : OUT STD_LOGIC;
        
        -- switches
        sw      : in std_logic_vector(3 downto 0);
        -- leds
        led     : out std_logic_vector(3 downto 0) := (others => '0');
        led6_r  : out std_logic;
        -- TMDS clock output 
        clk_p   : out std_logic;
        clk_n   : out std_logic;
        -- TMDS data output
        dataR_p : out std_logic;
        dataR_n : out std_logic;
        dataG_p : out std_logic;
        dataG_n : out std_logic;
        dataB_p : out std_logic;
        dataB_n : out std_logic
        
        );
end oscilloscope;

architecture Behavioral of oscilloscope is

constant DIN_WIDTH          : natural := DATA_IN_WIDTH;
constant ARRAY_WIDTH        : natural := PLOT_WIDTH;
constant NUMBER_OF_SIGNALS  : natural := 1;
constant RES                : t_RESOLUTION := SVGA;

-- CLOCKS
component clock_gen_wrapper is
  port (
    clk_in : in STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    pixel_clk : out STD_LOGIC;
    tmds_clk : out STD_LOGIC;
    pll_en : out STD_LOGIC;
    clk : out STD_LOGIC;
    rst_clk2 : in STD_LOGIC;
    clk_en : out STD_LOGIC
  );
end component;

-- I2C

component i2c_communication IS
  GENERIC(
    sys_clk_freq : INTEGER := 50_000_000);                --input clock speed from user logic in Hz
  PORT(
    clk          : IN    STD_LOGIC;                       --system clock
    reset_n      : IN    STD_LOGIC;                       --asynchronous active-low reset
    scl          : OUT STD_LOGIC;                       --I2C serial clock
    sda          : INOUT STD_LOGIC;                       --I2C serial data
    i2c_ack_err  : BUFFER   STD_LOGIC;                       --I2C slave acknowledge error flag
    adc_ch0_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);   --ADC Channel 0 data obtained
    adc_ch1_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);   --ADC Channel 1 data obtained
    adc_ch2_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);   --ADC Channel 2 data obtained
    adc_ch3_data : OUT   STD_LOGIC_VECTOR(11 DOWNTO 0));  --ADC Channel 3 data obtained
end component;

-- prescaler
component prescaler is
    Generic (
        COUNT_WIDTH : natural := 50_000_000/400_000*36
    );
    Port ( clk_in : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_out : out STD_LOGIC);

end component;

-- signal memory
component signal_register is
    Generic(
    DIN_WIDTH : natural := DIN_WIDTH;
    ARRAY_WIDTH : natural := ARRAY_WIDTH
    -- data out width should be taken from image_generation_pkg
    );
    Port ( 
        clk_fifo  : in STD_LOGIC;
        clk_reg   : in STD_LOGIC;
        rst       : in STD_LOGIC;
        din       : in STD_LOGIC_VECTOR (DIN_WIDTH - 1 downto 0);
--        valid_in  : in STD_LOGIC;
        dout      : out t_data(0 to ARRAY_WIDTH - 1)
--        valid_out : out STD_LOGIC_VECTOR(ARRAY_WIDTH - 1 downto 0)
        );
end component;

-- screen generation
component screenGeneration is
    Generic(
        res : t_RESOLUTION := RES
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
end component;

-- HDMI
component video_generator is
    Generic (
        res : t_RESOLUTION := RES
    );
    port(
        -- rst and clocks
--        sysclk      : in std_logic;
        pixel_clk   : in std_logic;
        tmds_clk    : in std_logic;
        -- signal informing that clocks are enable
        clk_en      : in std_logic; 
        
        rst         : in std_logic;
        -- RGB input
        data_r      : in std_logic_vector(7 downto 0);
        data_g      : in std_logic_vector(7 downto 0);
        data_b      : in std_logic_vector(7 downto 0);
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
end component;

-- XADC
component xadc_wrapper is
  port (
    Vaux14_0_v_n : in STD_LOGIC;
    Vaux14_0_v_p : in STD_LOGIC;
    Vaux15_0_v_n : in STD_LOGIC;
    Vaux15_0_v_p : in STD_LOGIC;
    Vaux6_0_v_n : in STD_LOGIC;
    Vaux6_0_v_p : in STD_LOGIC;
    Vaux7_0_v_n : in STD_LOGIC;
    Vaux7_0_v_p : in STD_LOGIC;
    Vp_Vn_0_v_n : in STD_LOGIC;
    Vp_Vn_0_v_p : in STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    daddr_in_0 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    den_in_0 : in STD_LOGIC;
    di_in_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    do_out_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy_out_0 : out STD_LOGIC;
    dwe_in_0 : in STD_LOGIC;
    eoc_out_0 : out STD_LOGIC;
    reset_in_0 : in STD_LOGIC
  );
end component;

component sw_debouncer is
    generic ( delay: integer  := 1_250_000); --10 ms opoznienia
    Port ( clk      : in std_logic;
           btn_in   : in std_logic;
           btn_out  : out std_logic);
end component;

-----------------------------------------------------------------------------------------
-- signals
-----------------------------------------------------------------------------------------

-- clock signals
signal reset_rtl : STD_LOGIC;
signal pixel_clk : STD_LOGIC;
signal tmds_clk : STD_LOGIC;
signal pll_en : STD_LOGIC;
signal clk : STD_LOGIC;
signal rst_clk2 : STD_LOGIC;
signal clk_en : STD_LOGIC;

-- "memory" signals inputs
signal clk_fifo  : STD_LOGIC; -- based on sampling clokc
signal clk_reg   : STD_LOGIC; -- based on sending image

-- ADC to memory signals
signal din       : t_data_in_array;
signal valid_in  : t_valid_in_array;
-- "memory" to image generator signals
signal dout      : t_data_out_array;
--signal valid_out : t_valid_out_array;

-- image generator signals
signal h_idx : natural;
signal v_idx : natural;

-- image generator to video signals
signal r : STD_LOGIC_VECTOR (7 downto 0);
signal g : STD_LOGIC_VECTOR (7 downto 0);
signal b : STD_LOGIC_VECTOR (7 downto 0);

signal i2c_ack_err : STD_LOGIC;
signal rst_n       : STD_LOGIC;

signal sw_out      : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');

--signal eoc      : STD_LOGIC;
--signal daddr    : STD_LOGIC_VECTOR ( 6 downto 0 );
--signal do_out   : STD_LOGIC_VECTOR ( 15 downto 0 );
--signal drdy_out : STD_LOGIC;

--signal channel_idx : natural range 0 to 3 := 0;

begin

rst_clk2 <= not clk_en;

clk_gen: clock_gen_wrapper port map (
      clk_in => sysclk,
      clk => clk,
      clk_en => clk_en,
      pixel_clk => pixel_clk,
      pll_en => pll_en,
      reset_rtl => rst,
      rst_clk2 => rst_clk2,
      tmds_clk => tmds_clk
);

-- XADC 
--adc: xadc_wrapper port map (
--    Vaux14_0_v_n => ja(4),
--    Vaux14_0_v_p => ja(0),
--    Vaux15_0_v_n => ja(6),
--    Vaux15_0_v_p => ja(2),
--    Vaux6_0_v_n  => ja(7),
--    Vaux6_0_v_p  => ja(3),
--    Vaux7_0_v_n  => ja(5),
--    Vaux7_0_v_p  => ja(1),
--    Vp_Vn_0_v_n  => '0',
--    Vp_Vn_0_v_p  => '0',
--    clk_100MHz   => clk,
--    daddr_in_0   => daddr,
--    den_in_0     => eoc,
--    di_in_0      => (others =>'0'),
--    do_out_0     => do_out,
--    drdy_out_0   => drdy_out,
--    dwe_in_0     => '0',
--    eoc_out_0    => eoc,
--    reset_in_0   => rst
--);

--process(drdy_out)
--begin

--    if falling_edge(drdy_out) then
--        channel_idx <= channel_idx + 1;
--        case (channel_idx) is
--            when 0 => din(0) <= do_out( 15 downto 15-DATA_IN_WIDTH+1);
--            when 1 => din(1) <= do_out( 15 downto 15-DATA_IN_WIDTH+1);
--            when 2 => din(2) <= do_out( 15 downto 15-DATA_IN_WIDTH+1);
--            when 3 => din(3) <= do_out( 15 downto 15-DATA_IN_WIDTH+1);
--        end case;
--    end if;

--end process;

--process(channel_idx)
--begin

--    case (channel_idx) is
--        when 0 => daddr <= "0011110";
--        when 1 => daddr <= "0010111";
--        when 2 => daddr <= "0011111";
--        when 3 => daddr <= "0010110";
--        when others => daddr <= "0011110";
--    end case;
    
--    if channel_idx = 0 then
--       clk_fifo <= '1';      
--    else
--        clk_fifo <= '0';
--    end if;

--end process;

-- ADC I2C and switches

i2c: i2c_communication port map (
    clk          => clk,               
    reset_n      => rst_n,
    scl          => scl,
    sda          => sda,
    i2c_ack_err  => i2c_ack_err,
    -- miejsce podatne na zmiane liczby kanalow
    adc_ch0_data => din(0),
    adc_ch1_data => din(1),
    adc_ch2_data => din(2),
    adc_ch3_data => din(3)
--    sw           => sw,
--    sw_out       => sw_out
);

led6_r <= i2c_ack_err;

sw_deb: for i in sw'range generate

    deb: sw_debouncer port map (
           clk      => clk,
           btn_in   => sw(i),
           btn_out  => sw_out(i)
   );

end generate;

-- swapped from scl to clk
fifo_clk_gen: prescaler port map (clk_in=>clk, rst=>rst, clk_out=>clk_fifo);

rst_n <= not rst;

memory: for i in 0 to NUMBER_OF_SIGNALS-1 generate

    valid_in(i) <= sw_out(i);
--    valid_in(i) <= '1';

    led(i) <= valid_in(i);

    mem: signal_register port map (
        clk_fifo  => clk_fifo,
        clk_reg   => clk_reg,
        rst       => rst,
        din       => din(i),
--        valid_in  => valid_in(i),
        dout      => dout(i)
--        valid_out => valid_out(i)
    );

end generate;

-- image generator
image: screenGeneration port map (
clk_reg=>clk_reg,
h_idx => h_idx,
v_idx => v_idx,
-------------------------------------------------
-- SIGNALS INPUT
-- probably would be better if made as an array
data  => dout,
valid => valid_in,
-------------------------------------------------
-- RGB OUTPUT
r     => r,
g     => g,
b     => b
);

-- HDMI management
hdmi: video_generator port map (
-- rst and clocks
pixel_clk => pixel_clk,
tmds_clk => tmds_clk,
clk_en => clk_en,

rst        => rst,
-- RGB input
data_r     => r,
data_g     => g,
data_b     => b,
-- TMDS clock output 
clk_p      => clk_p,
clk_n      => clk_n,
-- TMDS data output
dataR_p    => dataR_p,   
dataR_n    => dataR_n,   
dataG_p    => dataG_p,   
dataG_n    => dataG_n,   
dataB_p    => dataB_p,   
dataB_n    => dataB_n,   
-- current pixel location for screen generation
h_idx      => h_idx,
v_idx      => v_idx,  
screen_clk => clk_reg -- clock signal for screen memeory
);

end Behavioral;
