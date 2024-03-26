-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Thu Dec 21 15:18:18 2023
-- Host        : kris running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/kris/Vivado/zamfp-project/hdmi.sim/sim_1/impl/func/xsim/oscilloscope_tb_full_func_impl.vhd
-- Design      : oscilloscope
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_gen_clk_wiz_0_0_clk_wiz is
  port (
    pix_clk : out STD_LOGIC;
    tmds_clk : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    lopt : in STD_LOGIC
  );
end clock_gen_clk_wiz_0_0_clk_wiz;

architecture STRUCTURE of clock_gen_clk_wiz_0_0_clk_wiz is
  signal clkfbout_buf_clock_gen_clk_wiz_0_0 : STD_LOGIC;
  signal clkfbout_clock_gen_clk_wiz_0_0 : STD_LOGIC;
  signal mmcm_adv_inst_n_16 : STD_LOGIC;
  signal pix_clk_clock_gen_clk_wiz_0_0 : STD_LOGIC;
  signal pix_clk_clock_gen_clk_wiz_0_0_en_clk : STD_LOGIC;
  signal seq_reg1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of seq_reg1 : signal is "true";
  attribute async_reg : string;
  attribute async_reg of seq_reg1 : signal is "true";
  signal seq_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP of seq_reg2 : signal is "true";
  attribute async_reg of seq_reg2 : signal is "true";
  signal tmds_clk_clock_gen_clk_wiz_0_0 : STD_LOGIC;
  signal tmds_clk_clock_gen_clk_wiz_0_0_en_clk : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of clkout1_buf : label is "BUFG_OPT";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of clkout1_buf : label is "BUFGCE";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of clkout1_buf : label is "CE:CE0 I:I0 GND:S1,IGNORE0,CE1 VCC:S0,IGNORE1,I1";
  attribute BOX_TYPE of clkout1_buf_en : label is "PRIMITIVE";
  attribute OPT_MODIFIED of clkout1_buf_en : label is "BUFG_OPT";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute OPT_MODIFIED of clkout2_buf : label is "BUFG_OPT";
  attribute XILINX_LEGACY_PRIM of clkout2_buf : label is "BUFGCE";
  attribute XILINX_TRANSFORM_PINMAP of clkout2_buf : label is "CE:CE0 I:I0 GND:S1,IGNORE0,CE1 VCC:S0,IGNORE1,I1";
  attribute BOX_TYPE of clkout2_buf_en : label is "PRIMITIVE";
  attribute OPT_MODIFIED of clkout2_buf_en : label is "BUFG_OPT";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
  attribute OPT_MODIFIED of mmcm_adv_inst : label is "MLO RETARGET BUFG_OPT";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \seq_reg1_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \seq_reg1_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg1_reg[1]\ : label is std.standard.true;
  attribute KEEP of \seq_reg1_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg1_reg[2]\ : label is std.standard.true;
  attribute KEEP of \seq_reg1_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg1_reg[3]\ : label is std.standard.true;
  attribute KEEP of \seq_reg1_reg[3]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg1_reg[4]\ : label is std.standard.true;
  attribute KEEP of \seq_reg1_reg[4]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg1_reg[5]\ : label is std.standard.true;
  attribute KEEP of \seq_reg1_reg[5]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg1_reg[6]\ : label is std.standard.true;
  attribute KEEP of \seq_reg1_reg[6]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg1_reg[7]\ : label is std.standard.true;
  attribute KEEP of \seq_reg1_reg[7]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[0]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[0]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[1]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[1]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[2]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[2]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[3]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[3]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[4]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[4]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[5]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[5]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[6]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[6]\ : label is "yes";
  attribute ASYNC_REG_boolean of \seq_reg2_reg[7]\ : label is std.standard.true;
  attribute KEEP of \seq_reg2_reg[7]\ : label is "yes";
begin
  locked <= 'Z';
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clock_gen_clk_wiz_0_0,
      O => clkfbout_buf_clock_gen_clk_wiz_0_0
    );
clkout1_buf: unisim.vcomponents.BUFGCTRL
    generic map(
      CE_TYPE_CE0 => "SYNC",
      CE_TYPE_CE1 => "SYNC",
      INIT_OUT => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false,
      SIM_DEVICE => "7SERIES",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      CE0 => seq_reg1(7),
      CE1 => '0',
      I0 => pix_clk_clock_gen_clk_wiz_0_0,
      I1 => '1',
      IGNORE0 => '0',
      IGNORE1 => '1',
      O => pix_clk,
      S0 => '1',
      S1 => '0'
    );
clkout1_buf_en: unisim.vcomponents.BUFH
     port map (
      I => pix_clk_clock_gen_clk_wiz_0_0,
      O => pix_clk_clock_gen_clk_wiz_0_0_en_clk
    );
clkout2_buf: unisim.vcomponents.BUFGCTRL
    generic map(
      CE_TYPE_CE0 => "SYNC",
      CE_TYPE_CE1 => "SYNC",
      INIT_OUT => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false,
      SIM_DEVICE => "7SERIES",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      CE0 => seq_reg2(7),
      CE1 => '0',
      I0 => tmds_clk_clock_gen_clk_wiz_0_0,
      I1 => '1',
      IGNORE0 => '0',
      IGNORE1 => '1',
      O => tmds_clk,
      S0 => '1',
      S1 => '0'
    );
clkout2_buf_en: unisim.vcomponents.BUFH
     port map (
      I => tmds_clk_clock_gen_clk_wiz_0_0,
      O => tmds_clk_clock_gen_clk_wiz_0_0_en_clk
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 18.125000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 8.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 30.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 3,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "BUF_IN",
      DIVCLK_DIVIDE => 3,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '1',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_clock_gen_clk_wiz_0_0,
      CLKFBOUT => clkfbout_clock_gen_clk_wiz_0_0,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => pix_clk_clock_gen_clk_wiz_0_0,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => tmds_clk_clock_gen_clk_wiz_0_0,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => mmcm_adv_inst_n_16,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => lopt
    );
\seq_reg1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => mmcm_adv_inst_n_16,
      Q => seq_reg1(0)
    );
\seq_reg1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg1(0),
      Q => seq_reg1(1)
    );
\seq_reg1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg1(1),
      Q => seq_reg1(2)
    );
\seq_reg1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg1(2),
      Q => seq_reg1(3)
    );
\seq_reg1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg1(3),
      Q => seq_reg1(4)
    );
\seq_reg1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg1(4),
      Q => seq_reg1(5)
    );
\seq_reg1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg1(5),
      Q => seq_reg1(6)
    );
\seq_reg1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => pix_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg1(6),
      Q => seq_reg1(7)
    );
\seq_reg2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => mmcm_adv_inst_n_16,
      Q => seq_reg2(0)
    );
\seq_reg2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg2(0),
      Q => seq_reg2(1)
    );
\seq_reg2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg2(1),
      Q => seq_reg2(2)
    );
\seq_reg2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg2(2),
      Q => seq_reg2(3)
    );
\seq_reg2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg2(3),
      Q => seq_reg2(4)
    );
\seq_reg2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg2(4),
      Q => seq_reg2(5)
    );
\seq_reg2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg2(5),
      Q => seq_reg2(6)
    );
\seq_reg2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => tmds_clk_clock_gen_clk_wiz_0_0_en_clk,
      CE => '1',
      CLR => reset,
      D => seq_reg2(6),
      Q => seq_reg2(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_gen_clk_wiz_1_0_clk_wiz is
  port (
    clk_hdmi : out STD_LOGIC;
    clk_out : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
end clock_gen_clk_wiz_1_0_clk_wiz;

architecture STRUCTURE of clock_gen_clk_wiz_1_0_clk_wiz is
  signal clk_hdmi_clock_gen_clk_wiz_1_0 : STD_LOGIC;
  signal clk_in1_clock_gen_clk_wiz_1_0 : STD_LOGIC;
  signal clk_out_clock_gen_clk_wiz_1_0 : STD_LOGIC;
  signal clkfbout_buf_clock_gen_clk_wiz_1_0 : STD_LOGIC;
  signal clkfbout_clock_gen_clk_wiz_1_0 : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_clock_gen_clk_wiz_1_0,
      O => clkfbout_buf_clock_gen_clk_wiz_1_0
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE",
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1,
      O => clk_in1_clock_gen_clk_wiz_1_0
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_hdmi_clock_gen_clk_wiz_1_0,
      O => clk_hdmi
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out_clock_gen_clk_wiz_1_0,
      O => clk_out
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 8.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 8.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 8.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 8,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_clock_gen_clk_wiz_1_0,
      CLKFBOUT => clkfbout_clock_gen_clk_wiz_1_0,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1_clock_gen_clk_wiz_1_0,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_hdmi_clock_gen_clk_wiz_1_0,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_out_clock_gen_clk_wiz_1_0,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity counter is
  port (
    \counter_v_reg[27]_0\ : out STD_LOGIC;
    \counter_h_reg[8]_0\ : out STD_LOGIC;
    \counter_v_reg[27]_1\ : out STD_LOGIC;
    \counter_v_reg[27]_2\ : out STD_LOGIC;
    \counter_v_reg[27]_3\ : out STD_LOGIC;
    \counter_v_reg[27]_4\ : out STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    en : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
end counter;

architecture STRUCTURE of counter is
  signal counter_h : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \counter_h[30]_i_10_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_11_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_2_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_3_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_4_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_5_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_6_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_7_n_0\ : STD_LOGIC;
  signal \counter_h[30]_i_9_n_0\ : STD_LOGIC;
  signal \counter_h_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter_h_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter_h_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \counter_h_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \counter_h_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \counter_h_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \^counter_h_reg[8]_0\ : STD_LOGIC;
  signal \counter_h_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal counter_v : STD_LOGIC;
  signal \counter_v0_carry__0_n_0\ : STD_LOGIC;
  signal \counter_v0_carry__0_n_4\ : STD_LOGIC;
  signal \counter_v0_carry__0_n_5\ : STD_LOGIC;
  signal \counter_v0_carry__0_n_6\ : STD_LOGIC;
  signal \counter_v0_carry__0_n_7\ : STD_LOGIC;
  signal \counter_v0_carry__1_n_0\ : STD_LOGIC;
  signal \counter_v0_carry__1_n_4\ : STD_LOGIC;
  signal \counter_v0_carry__1_n_5\ : STD_LOGIC;
  signal \counter_v0_carry__1_n_6\ : STD_LOGIC;
  signal \counter_v0_carry__1_n_7\ : STD_LOGIC;
  signal \counter_v0_carry__2_n_0\ : STD_LOGIC;
  signal \counter_v0_carry__2_n_4\ : STD_LOGIC;
  signal \counter_v0_carry__2_n_5\ : STD_LOGIC;
  signal \counter_v0_carry__2_n_6\ : STD_LOGIC;
  signal \counter_v0_carry__2_n_7\ : STD_LOGIC;
  signal \counter_v0_carry__3_n_0\ : STD_LOGIC;
  signal \counter_v0_carry__3_n_4\ : STD_LOGIC;
  signal \counter_v0_carry__3_n_5\ : STD_LOGIC;
  signal \counter_v0_carry__3_n_6\ : STD_LOGIC;
  signal \counter_v0_carry__3_n_7\ : STD_LOGIC;
  signal \counter_v0_carry__4_n_0\ : STD_LOGIC;
  signal \counter_v0_carry__4_n_4\ : STD_LOGIC;
  signal \counter_v0_carry__4_n_5\ : STD_LOGIC;
  signal \counter_v0_carry__4_n_6\ : STD_LOGIC;
  signal \counter_v0_carry__4_n_7\ : STD_LOGIC;
  signal \counter_v0_carry__5_n_0\ : STD_LOGIC;
  signal \counter_v0_carry__5_n_4\ : STD_LOGIC;
  signal \counter_v0_carry__5_n_5\ : STD_LOGIC;
  signal \counter_v0_carry__5_n_6\ : STD_LOGIC;
  signal \counter_v0_carry__5_n_7\ : STD_LOGIC;
  signal \counter_v0_carry__6_n_6\ : STD_LOGIC;
  signal \counter_v0_carry__6_n_7\ : STD_LOGIC;
  signal counter_v0_carry_n_0 : STD_LOGIC;
  signal counter_v0_carry_n_4 : STD_LOGIC;
  signal counter_v0_carry_n_5 : STD_LOGIC;
  signal counter_v0_carry_n_6 : STD_LOGIC;
  signal counter_v0_carry_n_7 : STD_LOGIC;
  signal \counter_v[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[10]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[11]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[13]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[14]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[15]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[17]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[18]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[19]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[21]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[22]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[23]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[25]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[26]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[27]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[28]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[29]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[2]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_10_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_11_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_12_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_13_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_14_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_2_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_3_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_4_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_5_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_6_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_7_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_8_n_0\ : STD_LOGIC;
  signal \counter_v[30]_i_9_n_0\ : STD_LOGIC;
  signal \counter_v[3]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[5]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[6]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[7]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_v[9]_i_1_n_0\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 30 downto 1 );
  signal \dout[2]_i_10_n_0\ : STD_LOGIC;
  signal \dout[2]_i_11_n_0\ : STD_LOGIC;
  signal \dout[2]_i_12_n_0\ : STD_LOGIC;
  signal \dout[2]_i_2_n_0\ : STD_LOGIC;
  signal \dout[2]_i_3_n_0\ : STD_LOGIC;
  signal \dout[2]_i_4_n_0\ : STD_LOGIC;
  signal \dout[2]_i_5_n_0\ : STD_LOGIC;
  signal \dout[2]_i_6_n_0\ : STD_LOGIC;
  signal \dout[2]_i_7_n_0\ : STD_LOGIC;
  signal \dout[2]_i_8_n_0\ : STD_LOGIC;
  signal \dout[2]_i_9_n_0\ : STD_LOGIC;
  signal \dout[8]_i_2_n_0\ : STD_LOGIC;
  signal \dout[9]_i_3_n_0\ : STD_LOGIC;
  signal \dout[9]_i_4_n_0\ : STD_LOGIC;
  signal h_idx : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal v_idx : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \NLW_counter_h_reg[12]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_h_reg[16]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_h_reg[20]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_h_reg[24]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_h_reg[28]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_h_reg[30]_i_8_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_h_reg[30]_i_8_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_h_reg[4]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_h_reg[8]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_counter_v0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_v0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_v0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_v0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_v0_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_v0_carry__4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_v0_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_v0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_v0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_h_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_h_reg[16]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_h_reg[20]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_h_reg[24]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_h_reg[28]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_h_reg[30]_i_8\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_h_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_h_reg[8]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of counter_v0_carry : label is 35;
  attribute ADDER_THRESHOLD of \counter_v0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_v0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_v0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_v0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_v0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_v0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \counter_v0_carry__6\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dout[2]_i_1__0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \dout[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \dout[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \dout[8]_i_1__1\ : label is "soft_lutpair1";
begin
  \counter_h_reg[8]_0\ <= \^counter_h_reg[8]_0\;
\counter_h[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => h_idx(0),
      O => counter_h(0)
    );
\counter_h[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(10),
      O => counter_h(10)
    );
\counter_h[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(11),
      O => counter_h(11)
    );
\counter_h[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(12),
      O => counter_h(12)
    );
\counter_h[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(13),
      O => counter_h(13)
    );
\counter_h[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(14),
      O => counter_h(14)
    );
\counter_h[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(15),
      O => counter_h(15)
    );
\counter_h[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(16),
      O => counter_h(16)
    );
\counter_h[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(17),
      O => counter_h(17)
    );
\counter_h[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(18),
      O => counter_h(18)
    );
\counter_h[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(19),
      O => counter_h(19)
    );
\counter_h[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(1),
      O => counter_h(1)
    );
\counter_h[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(20),
      O => counter_h(20)
    );
\counter_h[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(21),
      O => counter_h(21)
    );
\counter_h[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(22),
      O => counter_h(22)
    );
\counter_h[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(23),
      O => counter_h(23)
    );
\counter_h[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(24),
      O => counter_h(24)
    );
\counter_h[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(25),
      O => counter_h(25)
    );
\counter_h[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(26),
      O => counter_h(26)
    );
\counter_h[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(27),
      O => counter_h(27)
    );
\counter_h[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(28),
      O => counter_h(28)
    );
\counter_h[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(29),
      O => counter_h(29)
    );
\counter_h[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(2),
      O => counter_h(2)
    );
\counter_h[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(30),
      O => counter_h(30)
    );
\counter_h[30]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => h_idx(9),
      I1 => h_idx(25),
      I2 => h_idx(2),
      I3 => h_idx(8),
      O => \counter_h[30]_i_10_n_0\
    );
\counter_h[30]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => h_idx(26),
      I1 => h_idx(27),
      O => \counter_h[30]_i_11_n_0\
    );
\counter_h[30]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rst_IBUF,
      I1 => en,
      O => \counter_h[30]_i_2_n_0\
    );
\counter_h[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => h_idx(15),
      I1 => h_idx(11),
      I2 => h_idx(10),
      I3 => h_idx(14),
      I4 => h_idx(12),
      I5 => h_idx(13),
      O => \counter_h[30]_i_3_n_0\
    );
\counter_h[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \counter_h[30]_i_9_n_0\,
      I1 => \counter_h[30]_i_10_n_0\,
      I2 => h_idx(21),
      I3 => h_idx(20),
      I4 => h_idx(24),
      I5 => h_idx(23),
      O => \counter_h[30]_i_4_n_0\
    );
\counter_h[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => \counter_h[30]_i_11_n_0\,
      I1 => h_idx(28),
      I2 => h_idx(30),
      I3 => h_idx(0),
      I4 => h_idx(29),
      I5 => h_idx(1),
      O => \counter_h[30]_i_5_n_0\
    );
\counter_h[30]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => h_idx(3),
      I1 => h_idx(22),
      I2 => h_idx(4),
      O => \counter_h[30]_i_6_n_0\
    );
\counter_h[30]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => h_idx(5),
      I1 => h_idx(6),
      I2 => h_idx(7),
      O => \counter_h[30]_i_7_n_0\
    );
\counter_h[30]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => h_idx(16),
      I1 => h_idx(17),
      I2 => h_idx(18),
      I3 => h_idx(19),
      O => \counter_h[30]_i_9_n_0\
    );
\counter_h[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(3),
      O => counter_h(3)
    );
\counter_h[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(4),
      O => counter_h(4)
    );
\counter_h[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(5),
      O => counter_h(5)
    );
\counter_h[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(6),
      O => counter_h(6)
    );
\counter_h[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(7),
      O => counter_h(7)
    );
\counter_h[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(8),
      O => counter_h(8)
    );
\counter_h[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00000000"
    )
        port map (
      I0 => \counter_h[30]_i_3_n_0\,
      I1 => \counter_h[30]_i_4_n_0\,
      I2 => \counter_h[30]_i_5_n_0\,
      I3 => \counter_h[30]_i_6_n_0\,
      I4 => \counter_h[30]_i_7_n_0\,
      I5 => data0(9),
      O => counter_h(9)
    );
\counter_h_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(0),
      Q => h_idx(0)
    );
\counter_h_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(10),
      Q => h_idx(10)
    );
\counter_h_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(11),
      Q => h_idx(11)
    );
\counter_h_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(12),
      Q => h_idx(12)
    );
\counter_h_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_h_reg[8]_i_2_n_0\,
      CO(3) => \counter_h_reg[12]_i_2_n_0\,
      CO(2 downto 0) => \NLW_counter_h_reg[12]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => h_idx(12 downto 9)
    );
\counter_h_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(13),
      Q => h_idx(13)
    );
\counter_h_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(14),
      Q => h_idx(14)
    );
\counter_h_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(15),
      Q => h_idx(15)
    );
\counter_h_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(16),
      Q => h_idx(16)
    );
\counter_h_reg[16]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_h_reg[12]_i_2_n_0\,
      CO(3) => \counter_h_reg[16]_i_2_n_0\,
      CO(2 downto 0) => \NLW_counter_h_reg[16]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => h_idx(16 downto 13)
    );
\counter_h_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(17),
      Q => h_idx(17)
    );
\counter_h_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(18),
      Q => h_idx(18)
    );
\counter_h_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(19),
      Q => h_idx(19)
    );
\counter_h_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(1),
      Q => h_idx(1)
    );
\counter_h_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(20),
      Q => h_idx(20)
    );
\counter_h_reg[20]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_h_reg[16]_i_2_n_0\,
      CO(3) => \counter_h_reg[20]_i_2_n_0\,
      CO(2 downto 0) => \NLW_counter_h_reg[20]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => h_idx(20 downto 17)
    );
\counter_h_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(21),
      Q => h_idx(21)
    );
\counter_h_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(22),
      Q => h_idx(22)
    );
\counter_h_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(23),
      Q => h_idx(23)
    );
\counter_h_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(24),
      Q => h_idx(24)
    );
\counter_h_reg[24]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_h_reg[20]_i_2_n_0\,
      CO(3) => \counter_h_reg[24]_i_2_n_0\,
      CO(2 downto 0) => \NLW_counter_h_reg[24]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => h_idx(24 downto 21)
    );
\counter_h_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(25),
      Q => h_idx(25)
    );
\counter_h_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(26),
      Q => h_idx(26)
    );
\counter_h_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(27),
      Q => h_idx(27)
    );
\counter_h_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(28),
      Q => h_idx(28)
    );
\counter_h_reg[28]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_h_reg[24]_i_2_n_0\,
      CO(3) => \counter_h_reg[28]_i_2_n_0\,
      CO(2 downto 0) => \NLW_counter_h_reg[28]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => h_idx(28 downto 25)
    );
\counter_h_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(29),
      Q => h_idx(29)
    );
\counter_h_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(2),
      Q => h_idx(2)
    );
\counter_h_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(30),
      Q => h_idx(30)
    );
\counter_h_reg[30]_i_8\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_h_reg[28]_i_2_n_0\,
      CO(3 downto 0) => \NLW_counter_h_reg[30]_i_8_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counter_h_reg[30]_i_8_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => data0(30 downto 29),
      S(3 downto 2) => B"00",
      S(1 downto 0) => h_idx(30 downto 29)
    );
\counter_h_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(3),
      Q => h_idx(3)
    );
\counter_h_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(4),
      Q => h_idx(4)
    );
\counter_h_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_h_reg[4]_i_2_n_0\,
      CO(2 downto 0) => \NLW_counter_h_reg[4]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => h_idx(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => h_idx(4 downto 1)
    );
\counter_h_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(5),
      Q => h_idx(5)
    );
\counter_h_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(6),
      Q => h_idx(6)
    );
\counter_h_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(7),
      Q => h_idx(7)
    );
\counter_h_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(8),
      Q => h_idx(8)
    );
\counter_h_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_h_reg[4]_i_2_n_0\,
      CO(3) => \counter_h_reg[8]_i_2_n_0\,
      CO(2 downto 0) => \NLW_counter_h_reg[8]_i_2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => h_idx(8 downto 5)
    );
\counter_h_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => \counter_h[30]_i_2_n_0\,
      D => counter_h(9),
      Q => h_idx(9)
    );
counter_v0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => counter_v0_carry_n_0,
      CO(2 downto 0) => NLW_counter_v0_carry_CO_UNCONNECTED(2 downto 0),
      CYINIT => v_idx(0),
      DI(3 downto 0) => B"0000",
      O(3) => counter_v0_carry_n_4,
      O(2) => counter_v0_carry_n_5,
      O(1) => counter_v0_carry_n_6,
      O(0) => counter_v0_carry_n_7,
      S(3 downto 0) => v_idx(4 downto 1)
    );
\counter_v0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => counter_v0_carry_n_0,
      CO(3) => \counter_v0_carry__0_n_0\,
      CO(2 downto 0) => \NLW_counter_v0_carry__0_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_v0_carry__0_n_4\,
      O(2) => \counter_v0_carry__0_n_5\,
      O(1) => \counter_v0_carry__0_n_6\,
      O(0) => \counter_v0_carry__0_n_7\,
      S(3 downto 0) => v_idx(8 downto 5)
    );
\counter_v0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_v0_carry__0_n_0\,
      CO(3) => \counter_v0_carry__1_n_0\,
      CO(2 downto 0) => \NLW_counter_v0_carry__1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_v0_carry__1_n_4\,
      O(2) => \counter_v0_carry__1_n_5\,
      O(1) => \counter_v0_carry__1_n_6\,
      O(0) => \counter_v0_carry__1_n_7\,
      S(3 downto 0) => v_idx(12 downto 9)
    );
\counter_v0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_v0_carry__1_n_0\,
      CO(3) => \counter_v0_carry__2_n_0\,
      CO(2 downto 0) => \NLW_counter_v0_carry__2_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_v0_carry__2_n_4\,
      O(2) => \counter_v0_carry__2_n_5\,
      O(1) => \counter_v0_carry__2_n_6\,
      O(0) => \counter_v0_carry__2_n_7\,
      S(3 downto 0) => v_idx(16 downto 13)
    );
\counter_v0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_v0_carry__2_n_0\,
      CO(3) => \counter_v0_carry__3_n_0\,
      CO(2 downto 0) => \NLW_counter_v0_carry__3_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_v0_carry__3_n_4\,
      O(2) => \counter_v0_carry__3_n_5\,
      O(1) => \counter_v0_carry__3_n_6\,
      O(0) => \counter_v0_carry__3_n_7\,
      S(3 downto 0) => v_idx(20 downto 17)
    );
\counter_v0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_v0_carry__3_n_0\,
      CO(3) => \counter_v0_carry__4_n_0\,
      CO(2 downto 0) => \NLW_counter_v0_carry__4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_v0_carry__4_n_4\,
      O(2) => \counter_v0_carry__4_n_5\,
      O(1) => \counter_v0_carry__4_n_6\,
      O(0) => \counter_v0_carry__4_n_7\,
      S(3 downto 0) => v_idx(24 downto 21)
    );
\counter_v0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_v0_carry__4_n_0\,
      CO(3) => \counter_v0_carry__5_n_0\,
      CO(2 downto 0) => \NLW_counter_v0_carry__5_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_v0_carry__5_n_4\,
      O(2) => \counter_v0_carry__5_n_5\,
      O(1) => \counter_v0_carry__5_n_6\,
      O(0) => \counter_v0_carry__5_n_7\,
      S(3 downto 0) => v_idx(28 downto 25)
    );
\counter_v0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_v0_carry__5_n_0\,
      CO(3 downto 0) => \NLW_counter_v0_carry__6_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counter_v0_carry__6_O_UNCONNECTED\(3 downto 2),
      O(1) => \counter_v0_carry__6_n_6\,
      O(0) => \counter_v0_carry__6_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => v_idx(30 downto 29)
    );
\counter_v[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFB"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => v_idx(0),
      O => \counter_v[0]_i_1_n_0\
    );
\counter_v[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__1_n_6\,
      O => \counter_v[10]_i_1_n_0\
    );
\counter_v[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__1_n_5\,
      O => \counter_v[11]_i_1_n_0\
    );
\counter_v[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__1_n_4\,
      O => \counter_v[12]_i_1_n_0\
    );
\counter_v[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__2_n_7\,
      O => \counter_v[13]_i_1_n_0\
    );
\counter_v[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__2_n_6\,
      O => \counter_v[14]_i_1_n_0\
    );
\counter_v[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__2_n_5\,
      O => \counter_v[15]_i_1_n_0\
    );
\counter_v[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__2_n_4\,
      O => \counter_v[16]_i_1_n_0\
    );
\counter_v[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__3_n_7\,
      O => \counter_v[17]_i_1_n_0\
    );
\counter_v[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__3_n_6\,
      O => \counter_v[18]_i_1_n_0\
    );
\counter_v[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__3_n_5\,
      O => \counter_v[19]_i_1_n_0\
    );
\counter_v[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => counter_v0_carry_n_7,
      O => \counter_v[1]_i_1_n_0\
    );
\counter_v[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__3_n_4\,
      O => \counter_v[20]_i_1_n_0\
    );
\counter_v[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__4_n_7\,
      O => \counter_v[21]_i_1_n_0\
    );
\counter_v[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__4_n_6\,
      O => \counter_v[22]_i_1_n_0\
    );
\counter_v[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__4_n_5\,
      O => \counter_v[23]_i_1_n_0\
    );
\counter_v[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__4_n_4\,
      O => \counter_v[24]_i_1_n_0\
    );
\counter_v[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__5_n_7\,
      O => \counter_v[25]_i_1_n_0\
    );
\counter_v[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__5_n_6\,
      O => \counter_v[26]_i_1_n_0\
    );
\counter_v[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__5_n_5\,
      O => \counter_v[27]_i_1_n_0\
    );
\counter_v[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__5_n_4\,
      O => \counter_v[28]_i_1_n_0\
    );
\counter_v[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__6_n_7\,
      O => \counter_v[29]_i_1_n_0\
    );
\counter_v[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => counter_v0_carry_n_6,
      O => \counter_v[2]_i_1_n_0\
    );
\counter_v[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004000000"
    )
        port map (
      I0 => \counter_v[30]_i_3_n_0\,
      I1 => h_idx(4),
      I2 => h_idx(22),
      I3 => h_idx(3),
      I4 => \counter_h[30]_i_5_n_0\,
      I5 => \counter_v[30]_i_4_n_0\,
      O => counter_v
    );
\counter_v[30]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => h_idx(5),
      I1 => h_idx(15),
      I2 => h_idx(9),
      I3 => h_idx(23),
      O => \counter_v[30]_i_10_n_0\
    );
\counter_v[30]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => h_idx(7),
      I1 => h_idx(6),
      O => \counter_v[30]_i_11_n_0\
    );
\counter_v[30]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => h_idx(13),
      I1 => h_idx(12),
      I2 => h_idx(14),
      I3 => h_idx(10),
      I4 => h_idx(11),
      O => \counter_v[30]_i_12_n_0\
    );
\counter_v[30]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => v_idx(0),
      I1 => v_idx(1),
      O => \counter_v[30]_i_13_n_0\
    );
\counter_v[30]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => v_idx(21),
      I1 => v_idx(22),
      I2 => v_idx(16),
      I3 => v_idx(17),
      O => \counter_v[30]_i_14_n_0\
    );
\counter_v[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__6_n_6\,
      O => \counter_v[30]_i_2_n_0\
    );
\counter_v[30]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => h_idx(21),
      I1 => h_idx(20),
      I2 => h_idx(24),
      I3 => h_idx(25),
      O => \counter_v[30]_i_3_n_0\
    );
\counter_v[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFF"
    )
        port map (
      I0 => \counter_h[30]_i_9_n_0\,
      I1 => \counter_v[30]_i_10_n_0\,
      I2 => h_idx(8),
      I3 => h_idx(2),
      I4 => \counter_v[30]_i_11_n_0\,
      I5 => \counter_v[30]_i_12_n_0\,
      O => \counter_v[30]_i_4_n_0\
    );
\counter_v[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => v_idx(9),
      I1 => v_idx(3),
      I2 => v_idx(2),
      I3 => \counter_v[30]_i_13_n_0\,
      I4 => v_idx(27),
      I5 => v_idx(26),
      O => \counter_v[30]_i_5_n_0\
    );
\counter_v[30]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => v_idx(8),
      I1 => v_idx(5),
      I2 => v_idx(4),
      I3 => v_idx(7),
      I4 => v_idx(6),
      O => \counter_v[30]_i_6_n_0\
    );
\counter_v[30]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => v_idx(28),
      I1 => v_idx(30),
      I2 => v_idx(25),
      I3 => v_idx(24),
      I4 => v_idx(29),
      O => \counter_v[30]_i_7_n_0\
    );
\counter_v[30]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => v_idx(23),
      I1 => v_idx(18),
      I2 => v_idx(20),
      I3 => v_idx(19),
      I4 => \counter_v[30]_i_14_n_0\,
      O => \counter_v[30]_i_8_n_0\
    );
\counter_v[30]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => v_idx(10),
      I1 => v_idx(11),
      I2 => v_idx(15),
      I3 => v_idx(14),
      I4 => v_idx(13),
      I5 => v_idx(12),
      O => \counter_v[30]_i_9_n_0\
    );
\counter_v[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => counter_v0_carry_n_5,
      O => \counter_v[3]_i_1_n_0\
    );
\counter_v[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => counter_v0_carry_n_4,
      O => \counter_v[4]_i_1_n_0\
    );
\counter_v[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__0_n_7\,
      O => \counter_v[5]_i_1_n_0\
    );
\counter_v[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__0_n_6\,
      O => \counter_v[6]_i_1_n_0\
    );
\counter_v[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__0_n_5\,
      O => \counter_v[7]_i_1_n_0\
    );
\counter_v[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__0_n_4\,
      O => \counter_v[8]_i_1_n_0\
    );
\counter_v[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000000"
    )
        port map (
      I0 => \counter_v[30]_i_5_n_0\,
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => \counter_v[30]_i_7_n_0\,
      I3 => \counter_v[30]_i_8_n_0\,
      I4 => \counter_v[30]_i_9_n_0\,
      I5 => \counter_v0_carry__1_n_7\,
      O => \counter_v[9]_i_1_n_0\
    );
\counter_v_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[0]_i_1_n_0\,
      Q => v_idx(0)
    );
\counter_v_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[10]_i_1_n_0\,
      Q => v_idx(10)
    );
\counter_v_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[11]_i_1_n_0\,
      Q => v_idx(11)
    );
\counter_v_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[12]_i_1_n_0\,
      Q => v_idx(12)
    );
\counter_v_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[13]_i_1_n_0\,
      Q => v_idx(13)
    );
\counter_v_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[14]_i_1_n_0\,
      Q => v_idx(14)
    );
\counter_v_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[15]_i_1_n_0\,
      Q => v_idx(15)
    );
\counter_v_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[16]_i_1_n_0\,
      Q => v_idx(16)
    );
\counter_v_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[17]_i_1_n_0\,
      Q => v_idx(17)
    );
\counter_v_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[18]_i_1_n_0\,
      Q => v_idx(18)
    );
\counter_v_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[19]_i_1_n_0\,
      Q => v_idx(19)
    );
\counter_v_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[1]_i_1_n_0\,
      Q => v_idx(1)
    );
\counter_v_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[20]_i_1_n_0\,
      Q => v_idx(20)
    );
\counter_v_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[21]_i_1_n_0\,
      Q => v_idx(21)
    );
\counter_v_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[22]_i_1_n_0\,
      Q => v_idx(22)
    );
\counter_v_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[23]_i_1_n_0\,
      Q => v_idx(23)
    );
\counter_v_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[24]_i_1_n_0\,
      Q => v_idx(24)
    );
\counter_v_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[25]_i_1_n_0\,
      Q => v_idx(25)
    );
\counter_v_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[26]_i_1_n_0\,
      Q => v_idx(26)
    );
\counter_v_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[27]_i_1_n_0\,
      Q => v_idx(27)
    );
\counter_v_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[28]_i_1_n_0\,
      Q => v_idx(28)
    );
\counter_v_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[29]_i_1_n_0\,
      Q => v_idx(29)
    );
\counter_v_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[2]_i_1_n_0\,
      Q => v_idx(2)
    );
\counter_v_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[30]_i_2_n_0\,
      Q => v_idx(30)
    );
\counter_v_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[3]_i_1_n_0\,
      Q => v_idx(3)
    );
\counter_v_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[4]_i_1_n_0\,
      Q => v_idx(4)
    );
\counter_v_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[5]_i_1_n_0\,
      Q => v_idx(5)
    );
\counter_v_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[6]_i_1_n_0\,
      Q => v_idx(6)
    );
\counter_v_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[7]_i_1_n_0\,
      Q => v_idx(7)
    );
\counter_v_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[8]_i_1_n_0\,
      Q => v_idx(8)
    );
\counter_v_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => counter_v,
      CLR => \counter_h[30]_i_2_n_0\,
      D => \counter_v[9]_i_1_n_0\,
      Q => v_idx(9)
    );
\dout[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF4"
    )
        port map (
      I0 => \dout[2]_i_2_n_0\,
      I1 => \dout[2]_i_3_n_0\,
      I2 => \dout[2]_i_4_n_0\,
      I3 => \dout[2]_i_5_n_0\,
      I4 => \dout[2]_i_6_n_0\,
      I5 => \dout[2]_i_7_n_0\,
      O => \^counter_h_reg[8]_0\
    );
\dout[2]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => v_idx(1),
      I1 => v_idx(0),
      I2 => v_idx(2),
      I3 => v_idx(3),
      O => \dout[2]_i_10_n_0\
    );
\dout[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF00F8000000"
    )
        port map (
      I0 => h_idx(4),
      I1 => h_idx(5),
      I2 => h_idx(6),
      I3 => h_idx(9),
      I4 => h_idx(7),
      I5 => h_idx(8),
      O => \dout[2]_i_11_n_0\
    );
\dout[2]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => h_idx(27),
      I1 => h_idx(26),
      I2 => h_idx(22),
      I3 => h_idx(23),
      O => \dout[2]_i_12_n_0\
    );
\dout[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \dout[2]_i_6_n_0\,
      I1 => \counter_v[30]_i_9_n_0\,
      I2 => \counter_v[30]_i_6_n_0\,
      I3 => \dout[8]_i_2_n_0\,
      I4 => \^counter_h_reg[8]_0\,
      O => \counter_v_reg[27]_4\
    );
\dout[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => \dout[2]_i_8_n_0\,
      I1 => h_idx(8),
      I2 => h_idx(9),
      I3 => \counter_h[30]_i_3_n_0\,
      O => \dout[2]_i_2_n_0\
    );
\dout[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => h_idx(5),
      I1 => h_idx(4),
      I2 => h_idx(6),
      I3 => h_idx(7),
      O => \dout[2]_i_3_n_0\
    );
\dout[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF1055"
    )
        port map (
      I0 => \dout[2]_i_9_n_0\,
      I1 => v_idx(4),
      I2 => \dout[2]_i_10_n_0\,
      I3 => v_idx(5),
      I4 => \dout[2]_i_11_n_0\,
      I5 => \counter_v[30]_i_9_n_0\,
      O => \dout[2]_i_4_n_0\
    );
\dout[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA2"
    )
        port map (
      I0 => v_idx(9),
      I1 => \counter_v[30]_i_6_n_0\,
      I2 => v_idx(1),
      I3 => v_idx(0),
      I4 => v_idx(2),
      I5 => v_idx(3),
      O => \dout[2]_i_5_n_0\
    );
\dout[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \counter_v[30]_i_8_n_0\,
      I1 => v_idx(27),
      I2 => v_idx(26),
      I3 => \counter_v[30]_i_7_n_0\,
      O => \dout[2]_i_6_n_0\
    );
\dout[2]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \dout[2]_i_8_n_0\,
      I1 => \counter_h[30]_i_3_n_0\,
      O => \dout[2]_i_7_n_0\
    );
\dout[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => h_idx(29),
      I1 => h_idx(30),
      I2 => h_idx(28),
      I3 => \dout[2]_i_12_n_0\,
      I4 => \counter_v[30]_i_3_n_0\,
      I5 => \counter_h[30]_i_9_n_0\,
      O => \dout[2]_i_8_n_0\
    );
\dout[2]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => v_idx(6),
      I1 => v_idx(7),
      I2 => v_idx(9),
      I3 => v_idx(8),
      O => \dout[2]_i_9_n_0\
    );
\dout[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0000"
    )
        port map (
      I0 => \dout[2]_i_6_n_0\,
      I1 => \counter_v[30]_i_9_n_0\,
      I2 => \counter_v[30]_i_6_n_0\,
      I3 => \dout[8]_i_2_n_0\,
      I4 => \^counter_h_reg[8]_0\,
      O => \counter_v_reg[27]_3\
    );
\dout[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \dout[2]_i_6_n_0\,
      I1 => \counter_v[30]_i_9_n_0\,
      I2 => \counter_v[30]_i_6_n_0\,
      I3 => \dout[8]_i_2_n_0\,
      O => \counter_v_reg[27]_0\
    );
\dout[8]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0010FFFF"
    )
        port map (
      I0 => \dout[2]_i_6_n_0\,
      I1 => \counter_v[30]_i_9_n_0\,
      I2 => \counter_v[30]_i_6_n_0\,
      I3 => \dout[8]_i_2_n_0\,
      I4 => \^counter_h_reg[8]_0\,
      O => \counter_v_reg[27]_2\
    );
\dout[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF77FFF"
    )
        port map (
      I0 => v_idx(3),
      I1 => v_idx(9),
      I2 => v_idx(1),
      I3 => v_idx(0),
      I4 => v_idx(2),
      O => \dout[8]_i_2_n_0\
    );
\dout[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEF000000100000"
    )
        port map (
      I0 => \dout[2]_i_6_n_0\,
      I1 => \counter_v[30]_i_9_n_0\,
      I2 => \counter_v[30]_i_6_n_0\,
      I3 => \dout[8]_i_2_n_0\,
      I4 => \^counter_h_reg[8]_0\,
      I5 => \dout[9]_i_3_n_0\,
      O => \counter_v_reg[27]_1\
    );
\dout[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55D5FFFFFFFFFFFF"
    )
        port map (
      I0 => \dout[9]_i_4_n_0\,
      I1 => h_idx(9),
      I2 => h_idx(8),
      I3 => \counter_h[30]_i_7_n_0\,
      I4 => \dout[2]_i_8_n_0\,
      I5 => \counter_h[30]_i_3_n_0\,
      O => \dout[9]_i_3_n_0\
    );
\dout[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0A0"
    )
        port map (
      I0 => h_idx(8),
      I1 => h_idx(7),
      I2 => h_idx(9),
      I3 => h_idx(6),
      O => \dout[9]_i_4_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_master is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    scl_OBUF : out STD_LOGIC;
    busy_reg_0 : out STD_LOGIC;
    \FSM_onehot_state_reg[1]_0\ : out STD_LOGIC;
    \counter_reg[20]\ : out STD_LOGIC;
    \counter_reg[20]_0\ : out STD_LOGIC;
    \counter_reg[20]_1\ : out STD_LOGIC;
    sda_OBUF : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    ena : in STD_LOGIC;
    busy_prev_reg : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    stretch : in STD_LOGIC;
    busy_prev : in STD_LOGIC;
    counter_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_state_reg[2]_0\ : in STD_LOGIC;
    counter : in STD_LOGIC;
    \FSM_onehot_state_reg[2]_1\ : in STD_LOGIC
  );
end i2c_master;

architecture STRUCTURE of i2c_master is
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[6]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[6]\ : STD_LOGIC;
  signal \bit_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \bit_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal busy1 : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_i_2_n_0 : STD_LOGIC;
  signal busy_i_3_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count[2]_i_2_n_0\ : STD_LOGIC;
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal \count[5]_i_2_n_0\ : STD_LOGIC;
  signal \count[5]_i_3_n_0\ : STD_LOGIC;
  signal \count[6]_i_2_n_0\ : STD_LOGIC;
  signal \count[7]_i_2_n_0\ : STD_LOGIC;
  signal \count[8]_i_2_n_0\ : STD_LOGIC;
  signal \count[8]_i_3_n_0\ : STD_LOGIC;
  signal \count[8]_i_4_n_0\ : STD_LOGIC;
  signal count_0 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal \count__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_clk_i_1_n_0 : STD_LOGIC;
  signal data_clk_i_2_n_0 : STD_LOGIC;
  signal data_clk_i_3_n_0 : STD_LOGIC;
  signal data_clk_prev : STD_LOGIC;
  signal data_clk_prev_i_1_n_0 : STD_LOGIC;
  signal data_clk_reg_n_0 : STD_LOGIC;
  signal i2c_busy : STD_LOGIC;
  signal i2c_ena_i_2_n_0 : STD_LOGIC;
  signal i2c_ena_i_3_n_0 : STD_LOGIC;
  signal scl_clk_i_1_n_0 : STD_LOGIC;
  signal scl_clk_i_2_n_0 : STD_LOGIC;
  signal scl_clk_i_3_n_0 : STD_LOGIC;
  signal scl_clk_i_4_n_0 : STD_LOGIC;
  signal scl_clk_reg_n_0 : STD_LOGIC;
  signal scl_ena_i_1_n_0 : STD_LOGIC;
  signal scl_ena_reg_n_0 : STD_LOGIC;
  signal sda_int_i_1_n_0 : STD_LOGIC;
  signal sda_int_i_2_n_0 : STD_LOGIC;
  signal sda_int_i_3_n_0 : STD_LOGIC;
  signal sda_int_i_4_n_0 : STD_LOGIC;
  signal sda_int_i_5_n_0 : STD_LOGIC;
  signal sda_int_reg_n_0 : STD_LOGIC;
  signal stretch_0 : STD_LOGIC;
  signal stretch_i_1_n_0 : STD_LOGIC;
  signal stretch_i_3_n_0 : STD_LOGIC;
  signal stretch_i_4_n_0 : STD_LOGIC;
  signal stretch_i_5_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \FSM_onehot_state[6]_i_2\ : label is "soft_lutpair16";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[6]\ : label is "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000";
  attribute SOFT_HLUTNM of \busy_cnt[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \busy_cnt[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of data_clk_i_1 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of data_clk_prev_i_1 : label is "soft_lutpair26";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of stretch_i_1 : label is "RETARGET";
begin
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[6]\,
      I1 => ena,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000D0D0D0"
    )
        port map (
      I0 => counter_reg(0),
      I1 => \FSM_onehot_state_reg[2]_0\,
      I2 => counter,
      I3 => busy_prev,
      I4 => \FSM_onehot_state[2]_i_3_n_0\,
      I5 => \FSM_onehot_state_reg[2]_1\,
      O => \counter_reg[20]_1\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ena,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF020FF20"
    )
        port map (
      I0 => counter_reg(0),
      I1 => \FSM_onehot_state_reg[2]_0\,
      I2 => counter,
      I3 => busy_prev,
      I4 => \FSM_onehot_state[2]_i_3_n_0\,
      I5 => \FSM_onehot_state_reg[2]_1\,
      O => \counter_reg[20]_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEAAAA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \bit_cnt_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF00FF002000"
    )
        port map (
      I0 => counter_reg(0),
      I1 => \FSM_onehot_state_reg[2]_0\,
      I2 => counter,
      I3 => busy_prev,
      I4 => \FSM_onehot_state[2]_i_3_n_0\,
      I5 => \FSM_onehot_state_reg[2]_1\,
      O => \counter_reg[20]\
    );
\FSM_onehot_state[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(0),
      I4 => i2c_busy,
      O => \FSM_onehot_state[2]_i_3_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \bit_cnt_reg_n_0_[2]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \bit_cnt_reg_n_0_[0]\,
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF444"
    )
        port map (
      I0 => \FSM_onehot_state[4]_i_2_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[4]\,
      I2 => ena,
      I3 => \FSM_onehot_state_reg_n_0_[5]\,
      I4 => \FSM_onehot_state_reg_n_0_[3]\,
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => \bit_cnt_reg_n_0_[1]\,
      I2 => \bit_cnt_reg_n_0_[2]\,
      O => \FSM_onehot_state[4]_i_2_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[4]\,
      I1 => \bit_cnt_reg_n_0_[2]\,
      I2 => \bit_cnt_reg_n_0_[1]\,
      I3 => \bit_cnt_reg_n_0_[0]\,
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_onehot_state[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data_clk_reg_n_0,
      I1 => data_clk_prev,
      O => busy1
    );
\FSM_onehot_state[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[5]\,
      I1 => ena,
      O => \FSM_onehot_state[6]_i_2_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => busy1,
      D => \FSM_onehot_state[0]_i_1_n_0\,
      PRE => rst_IBUF,
      Q => \FSM_onehot_state_reg_n_0_[0]\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy1,
      CLR => rst_IBUF,
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[1]\
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy1,
      CLR => rst_IBUF,
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[2]\
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy1,
      CLR => rst_IBUF,
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[3]\
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy1,
      CLR => rst_IBUF,
      D => \FSM_onehot_state[4]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[4]\
    );
\FSM_onehot_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy1,
      CLR => rst_IBUF,
      D => \FSM_onehot_state[5]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[5]\
    );
\FSM_onehot_state_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy1,
      CLR => rst_IBUF,
      D => \FSM_onehot_state[6]_i_2_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[6]\
    );
\bit_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBF4440"
    )
        port map (
      I0 => data_clk_prev,
      I1 => data_clk_reg_n_0,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_state_reg_n_0_[4]\,
      I4 => \bit_cnt_reg_n_0_[0]\,
      O => \bit_cnt[0]_i_1_n_0\
    );
\bit_cnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFFF10101000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[0]\,
      I1 => data_clk_prev,
      I2 => data_clk_reg_n_0,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      I5 => \bit_cnt_reg_n_0_[1]\,
      O => \bit_cnt[1]_i_1_n_0\
    );
\bit_cnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFEFEFFF10101000"
    )
        port map (
      I0 => \bit_cnt_reg_n_0_[1]\,
      I1 => \bit_cnt_reg_n_0_[0]\,
      I2 => busy1,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_state_reg_n_0_[4]\,
      I5 => \bit_cnt_reg_n_0_[2]\,
      O => \bit_cnt[2]_i_1_n_0\
    );
\bit_cnt_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \bit_cnt[0]_i_1_n_0\,
      PRE => rst_IBUF,
      Q => \bit_cnt_reg_n_0_[0]\
    );
\bit_cnt_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \bit_cnt[1]_i_1_n_0\,
      PRE => rst_IBUF,
      Q => \bit_cnt_reg_n_0_[1]\
    );
\bit_cnt_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => \bit_cnt[2]_i_1_n_0\,
      PRE => rst_IBUF,
      Q => \bit_cnt_reg_n_0_[2]\
    );
\busy_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => Q(0),
      I1 => busy_prev_reg,
      I2 => i2c_busy,
      O => D(0)
    );
\busy_cnt[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA6A"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => i2c_busy,
      I3 => busy_prev_reg,
      O => D(1)
    );
\busy_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AAAAAAA"
    )
        port map (
      I0 => Q(2),
      I1 => busy_prev_reg,
      I2 => i2c_busy,
      I3 => Q(0),
      I4 => Q(1),
      O => D(2)
    );
\busy_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFC40000000"
    )
        port map (
      I0 => busy_prev_reg,
      I1 => i2c_busy,
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      I5 => Q(3),
      O => D(3)
    );
busy_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0020"
    )
        port map (
      I0 => busy_i_2_n_0,
      I1 => data_clk_prev,
      I2 => data_clk_reg_n_0,
      I3 => busy_i_3_n_0,
      I4 => i2c_busy,
      O => busy_i_1_n_0
    );
busy_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_state_reg_n_0_[4]\,
      I2 => ena,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_state_reg_n_0_[2]\,
      I5 => \FSM_onehot_state_reg_n_0_[3]\,
      O => busy_i_2_n_0
    );
busy_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000007"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[5]\,
      I1 => ena,
      I2 => \FSM_onehot_state_reg_n_0_[4]\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      I5 => \FSM_onehot_state_reg_n_0_[6]\,
      O => busy_i_3_n_0
    );
busy_prev_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => i2c_busy,
      I1 => busy_prev,
      I2 => rst_IBUF,
      I3 => busy_prev_reg,
      O => busy_reg_0
    );
busy_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => busy_i_1_n_0,
      PRE => rst_IBUF,
      Q => i2c_busy
    );
\count[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE0000FF"
    )
        port map (
      I0 => count(2),
      I1 => \count[0]_i_2_n_0\,
      I2 => \count[7]_i_2_n_0\,
      I3 => stretch_0,
      I4 => count(0),
      O => \count__0\(0)
    );
\count[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => count(7),
      I1 => count(6),
      I2 => count(8),
      O => \count[0]_i_2_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FD0055AA"
    )
        port map (
      I0 => count(0),
      I1 => count(2),
      I2 => \count[2]_i_2_n_0\,
      I3 => count(1),
      I4 => stretch_0,
      O => \count__0\(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F3FF0800"
    )
        port map (
      I0 => \count[2]_i_2_n_0\,
      I1 => count(1),
      I2 => stretch_0,
      I3 => count(0),
      I4 => count(2),
      O => \count__0\(2)
    );
\count[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFFFFFFFF"
    )
        port map (
      I0 => count(8),
      I1 => count(6),
      I2 => count(7),
      I3 => count(5),
      I4 => count(3),
      I5 => count(4),
      O => \count[2]_i_2_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF2222000F2222"
    )
        port map (
      I0 => count(1),
      I1 => \count[6]_i_2_n_0\,
      I2 => count(4),
      I3 => count(2),
      I4 => count(3),
      I5 => \count[4]_i_2_n_0\,
      O => \count__0\(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF085508"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => \count[6]_i_2_n_0\,
      I3 => count(4),
      I4 => \count[4]_i_2_n_0\,
      O => \count__0\(4)
    );
\count[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFFFC5FFFFFFFFFF"
    )
        port map (
      I0 => count(5),
      I1 => stretch_0,
      I2 => count(2),
      I3 => count(0),
      I4 => \count[0]_i_2_n_0\,
      I5 => count(1),
      O => \count[4]_i_2_n_0\
    );
\count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF22220FFF2222"
    )
        port map (
      I0 => count(1),
      I1 => \count[5]_i_2_n_0\,
      I2 => count(4),
      I3 => count(3),
      I4 => count(5),
      I5 => \count[5]_i_3_n_0\,
      O => \count__0\(5)
    );
\count[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
        port map (
      I0 => count(2),
      I1 => stretch_0,
      I2 => count(0),
      I3 => count(4),
      I4 => count(3),
      O => \count[5]_i_2_n_0\
    );
\count[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFDF5FDF"
    )
        port map (
      I0 => count(1),
      I1 => \count[0]_i_2_n_0\,
      I2 => count(0),
      I3 => count(2),
      I4 => stretch_0,
      O => \count[5]_i_3_n_0\
    );
\count[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF40000000"
    )
        port map (
      I0 => \count[6]_i_2_n_0\,
      I1 => count(5),
      I2 => count(3),
      I3 => count(4),
      I4 => count(1),
      I5 => count(6),
      O => \count__0\(6)
    );
\count[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => count(0),
      I1 => stretch_0,
      I2 => count(2),
      O => \count[6]_i_2_n_0\
    );
\count[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFF00200000"
    )
        port map (
      I0 => count(6),
      I1 => \count[7]_i_2_n_0\,
      I2 => count(2),
      I3 => stretch_0,
      I4 => count(0),
      I5 => count(7),
      O => \count__0\(7)
    );
\count[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count(5),
      I1 => count(3),
      I2 => count(4),
      I3 => count(1),
      O => \count[7]_i_2_n_0\
    );
\count[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFBBBAAAA"
    )
        port map (
      I0 => \count[8]_i_2_n_0\,
      I1 => count(0),
      I2 => count(2),
      I3 => stretch_0,
      I4 => count(8),
      I5 => \count[8]_i_3_n_0\,
      O => count_0(8)
    );
\count[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55FF55AA03000000"
    )
        port map (
      I0 => count(2),
      I1 => \count[6]_i_2_n_0\,
      I2 => \count[7]_i_2_n_0\,
      I3 => count(6),
      I4 => count(7),
      I5 => count(8),
      O => \count[8]_i_2_n_0\
    );
\count[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFDFFFDF00000000"
    )
        port map (
      I0 => count(5),
      I1 => \count[8]_i_4_n_0\,
      I2 => count(1),
      I3 => count(2),
      I4 => count(7),
      I5 => count(8),
      O => \count[8]_i_3_n_0\
    );
\count[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => count(3),
      I1 => count(4),
      O => \count[8]_i_4_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(0),
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(1),
      Q => count(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(2),
      Q => count(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(3),
      Q => count(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(4),
      Q => count(4)
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(5),
      Q => count(5)
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(6),
      Q => count(6)
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => \count__0\(7),
      Q => count(7)
    );
\count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => count_0(8),
      Q => count(8)
    );
data_clk_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => data_clk_i_2_n_0,
      I1 => rst_IBUF,
      I2 => data_clk_reg_n_0,
      O => data_clk_i_1_n_0
    );
data_clk_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555444015154440"
    )
        port map (
      I0 => count(8),
      I1 => count(6),
      I2 => count(5),
      I3 => data_clk_i_3_n_0,
      I4 => count(7),
      I5 => stretch_i_4_n_0,
      O => data_clk_i_2_n_0
    );
data_clk_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFB0000000"
    )
        port map (
      I0 => count(0),
      I1 => stretch_0,
      I2 => count(1),
      I3 => count(3),
      I4 => count(2),
      I5 => count(4),
      O => data_clk_i_3_n_0
    );
data_clk_prev_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => data_clk_reg_n_0,
      I1 => rst_IBUF,
      I2 => data_clk_prev,
      O => data_clk_prev_i_1_n_0
    );
data_clk_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data_clk_prev_i_1_n_0,
      Q => data_clk_prev,
      R => '0'
    );
data_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => data_clk_i_1_n_0,
      Q => data_clk_reg_n_0,
      R => '0'
    );
i2c_ena_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF40"
    )
        port map (
      I0 => i2c_ena_i_2_n_0,
      I1 => busy_prev,
      I2 => i2c_ena_i_3_n_0,
      I3 => ena,
      O => \FSM_onehot_state_reg[1]_0\
    );
i2c_ena_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA6AAAAAAA"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(0),
      I4 => i2c_busy,
      I5 => busy_prev_reg,
      O => i2c_ena_i_2_n_0
    );
i2c_ena_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00801101"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => i2c_busy,
      I3 => busy_prev_reg,
      I4 => Q(0),
      O => i2c_ena_i_3_n_0
    );
scl_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => scl_clk_reg_n_0,
      I1 => scl_ena_reg_n_0,
      O => scl_OBUF
    );
scl_clk_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE0E"
    )
        port map (
      I0 => scl_clk_i_2_n_0,
      I1 => scl_clk_i_3_n_0,
      I2 => rst_IBUF,
      I3 => scl_clk_reg_n_0,
      O => scl_clk_i_1_n_0
    );
scl_clk_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF04AE"
    )
        port map (
      I0 => count(8),
      I1 => count(7),
      I2 => \count[5]_i_2_n_0\,
      I3 => count(0),
      I4 => scl_clk_i_4_n_0,
      I5 => \count[8]_i_3_n_0\,
      O => scl_clk_i_2_n_0
    );
scl_clk_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4FFF40F44004400"
    )
        port map (
      I0 => count(2),
      I1 => count(8),
      I2 => \count[5]_i_2_n_0\,
      I3 => count(6),
      I4 => count(5),
      I5 => count(7),
      O => scl_clk_i_3_n_0
    );
scl_clk_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4500000000000000"
    )
        port map (
      I0 => \count[8]_i_4_n_0\,
      I1 => stretch_0,
      I2 => count(0),
      I3 => count(1),
      I4 => count(2),
      I5 => count(7),
      O => scl_clk_i_4_n_0
    );
scl_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => scl_clk_i_1_n_0,
      Q => scl_clk_reg_n_0,
      R => '0'
    );
scl_ena_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF44BF00"
    )
        port map (
      I0 => data_clk_reg_n_0,
      I1 => data_clk_prev,
      I2 => \FSM_onehot_state_reg_n_0_[6]\,
      I3 => scl_ena_reg_n_0,
      I4 => \FSM_onehot_state_reg_n_0_[1]\,
      O => scl_ena_i_1_n_0
    );
scl_ena_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => scl_ena_i_1_n_0,
      Q => scl_ena_reg_n_0
    );
sda_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F2CE"
    )
        port map (
      I0 => sda_int_reg_n_0,
      I1 => \FSM_onehot_state_reg_n_0_[6]\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => data_clk_prev,
      O => sda_OBUF
    );
sda_int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBABB88888A88"
    )
        port map (
      I0 => sda_int_i_2_n_0,
      I1 => sda_int_i_3_n_0,
      I2 => sda_int_i_4_n_0,
      I3 => data_clk_reg_n_0,
      I4 => data_clk_prev,
      I5 => sda_int_reg_n_0,
      O => sda_int_i_1_n_0
    );
sda_int_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC808FB0A"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \bit_cnt_reg_n_0_[2]\,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \FSM_onehot_state_reg_n_0_[2]\,
      I4 => \bit_cnt_reg_n_0_[1]\,
      I5 => sda_int_i_5_n_0,
      O => sda_int_i_2_n_0
    );
sda_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => data_clk_prev,
      I1 => data_clk_reg_n_0,
      I2 => \bit_cnt_reg_n_0_[0]\,
      I3 => \bit_cnt_reg_n_0_[1]\,
      I4 => \bit_cnt_reg_n_0_[2]\,
      I5 => \FSM_onehot_state_reg_n_0_[4]\,
      O => sda_int_i_3_n_0
    );
sda_int_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000007"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[5]\,
      I1 => ena,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_state_reg_n_0_[3]\,
      I4 => \FSM_onehot_state_reg_n_0_[1]\,
      O => sda_int_i_4_n_0
    );
sda_int_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF4"
    )
        port map (
      I0 => ena,
      I1 => \FSM_onehot_state_reg_n_0_[4]\,
      I2 => \FSM_onehot_state_reg_n_0_[5]\,
      I3 => \FSM_onehot_state_reg_n_0_[3]\,
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      O => sda_int_i_5_n_0
    );
sda_int_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => sda_int_i_1_n_0,
      PRE => rst_IBUF,
      Q => sda_int_reg_n_0
    );
stretch_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => stretch,
      I1 => stretch_i_3_n_0,
      I2 => stretch_0,
      O => stretch_i_1_n_0
    );
stretch_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00BB000000F00000"
    )
        port map (
      I0 => stretch_i_4_n_0,
      I1 => count(6),
      I2 => stretch_i_5_n_0,
      I3 => count(8),
      I4 => count(7),
      I5 => count(5),
      O => stretch_i_3_n_0
    );
stretch_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000077777F77"
    )
        port map (
      I0 => count(2),
      I1 => count(3),
      I2 => count(1),
      I3 => stretch_0,
      I4 => count(0),
      I5 => count(4),
      O => stretch_i_4_n_0
    );
stretch_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAFFFFFFFF"
    )
        port map (
      I0 => count(6),
      I1 => count(2),
      I2 => count(1),
      I3 => count(4),
      I4 => count(3),
      I5 => \count[5]_i_2_n_0\,
      O => stretch_i_5_n_0
    );
stretch_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => stretch_i_1_n_0,
      Q => stretch_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity serializer is
  port (
    dataB_p_OBUF : out STD_LOGIC;
    dataB_n_OBUF : out STD_LOGIC;
    \send_data.idx_reg[3]_0\ : in STD_LOGIC;
    \send_data.idx_reg[3]_1\ : in STD_LOGIC;
    Q : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 4 downto 0 );
    CLK : in STD_LOGIC;
    lopt : out STD_LOGIC
  );
end serializer;

architecture STRUCTURE of serializer is
  signal \d_tmp_reg_n_0_[2]\ : STD_LOGIC;
  signal \d_tmp_reg_n_0_[3]\ : STD_LOGIC;
  signal \d_tmp_reg_n_0_[6]\ : STD_LOGIC;
  signal \d_tmp_reg_n_0_[8]\ : STD_LOGIC;
  signal \d_tmp_reg_n_0_[9]\ : STD_LOGIC;
  signal \^datab_p_obuf\ : STD_LOGIC;
  signal \dout_i_1__1_n_0\ : STD_LOGIC;
  signal dout_i_3_n_0 : STD_LOGIC;
  signal \dout_i_4__0_n_0\ : STD_LOGIC;
  signal dout_reg_i_2_n_0 : STD_LOGIC;
  signal dout_reg_lopt_replica_1 : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \send_data.idx_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute \PinAttr:D:HOLD_DETOUR\ : integer;
  attribute \PinAttr:D:HOLD_DETOUR\ of \d_tmp_reg[3]\ : label is 198;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of dout_i_3 : label is "RETARGET";
  attribute OPT_MODIFIED of \dout_i_4__0\ : label is "RETARGET";
  attribute OPT_MODIFIED of dout_reg_i_2 : label is "RETARGET";
  attribute OPT_INSERTED_REPDRIVER : boolean;
  attribute OPT_INSERTED_REPDRIVER of dout_reg_lopt_replica : label is std.standard.true;
  attribute OPT_MODIFIED of dout_reg_lopt_replica : label is "SWEEP";
  attribute \PinAttr:I2:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I2:HOLD_DETOUR\ of \send_data.idx[1]_i_1__1\ : label is 194;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \send_data.idx[1]_i_1__1\ : label is "soft_lutpair11";
  attribute \PinAttr:I2:HOLD_DETOUR\ of \send_data.idx[3]_i_1__1\ : label is 194;
  attribute SOFT_HLUTNM of \send_data.idx[3]_i_1__1\ : label is "soft_lutpair11";
begin
  dataB_p_OBUF <= \^datab_p_obuf\;
  lopt <= dout_reg_lopt_replica_1;
\d_tmp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(0),
      Q => \d_tmp_reg_n_0_[2]\,
      R => '0'
    );
\d_tmp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(1),
      Q => \d_tmp_reg_n_0_[3]\,
      R => '0'
    );
\d_tmp_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(2),
      Q => \d_tmp_reg_n_0_[6]\,
      R => '0'
    );
\d_tmp_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(3),
      Q => \d_tmp_reg_n_0_[8]\,
      R => '0'
    );
\d_tmp_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(4),
      Q => \d_tmp_reg_n_0_[9]\,
      R => '0'
    );
dataB_n_OBUF_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^datab_p_obuf\,
      O => dataB_n_OBUF
    );
\dout_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \d_tmp_reg_n_0_[9]\,
      I1 => \send_data.idx_reg\(0),
      I2 => \d_tmp_reg_n_0_[8]\,
      I3 => \send_data.idx_reg\(3),
      I4 => dout_reg_i_2_n_0,
      O => \dout_i_1__1_n_0\
    );
dout_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AACA"
    )
        port map (
      I0 => \d_tmp_reg_n_0_[3]\,
      I1 => \d_tmp_reg_n_0_[2]\,
      I2 => \send_data.idx_reg\(1),
      I3 => \send_data.idx_reg\(0),
      O => dout_i_3_n_0
    );
\dout_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \d_tmp_reg_n_0_[3]\,
      I1 => \d_tmp_reg_n_0_[6]\,
      I2 => \send_data.idx_reg\(0),
      O => \dout_i_4__0_n_0\
    );
dout_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_1\,
      D => \dout_i_1__1_n_0\,
      Q => \^datab_p_obuf\
    );
dout_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => dout_i_3_n_0,
      I1 => \dout_i_4__0_n_0\,
      I2 => \send_data.idx_reg\(2),
      O => dout_reg_i_2_n_0
    );
dout_reg_lopt_replica: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_1\,
      D => \dout_i_1__1_n_0\,
      Q => dout_reg_lopt_replica_1
    );
\send_data.idx[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \send_data.idx_reg\(0),
      O => \p_0_in__1\(0)
    );
\send_data.idx[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => \send_data.idx_reg\(2),
      I1 => \send_data.idx_reg\(3),
      I2 => \send_data.idx_reg\(0),
      I3 => \send_data.idx_reg\(1),
      O => \p_0_in__1\(1)
    );
\send_data.idx[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \send_data.idx_reg\(2),
      I1 => \send_data.idx_reg\(1),
      I2 => \send_data.idx_reg\(0),
      O => \p_0_in__1\(2)
    );
\send_data.idx[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6C8C"
    )
        port map (
      I0 => \send_data.idx_reg\(2),
      I1 => \send_data.idx_reg\(3),
      I2 => \send_data.idx_reg\(0),
      I3 => \send_data.idx_reg\(1),
      O => \p_0_in__1\(3)
    );
\send_data.idx_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_1\,
      D => \p_0_in__1\(0),
      Q => \send_data.idx_reg\(0)
    );
\send_data.idx_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_1\,
      D => \p_0_in__1\(1),
      Q => \send_data.idx_reg\(1)
    );
\send_data.idx_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_1\,
      D => \p_0_in__1\(2),
      Q => \send_data.idx_reg\(2)
    );
\send_data.idx_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_1\,
      D => \p_0_in__1\(3),
      Q => \send_data.idx_reg\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity serializer_2 is
  port (
    dataG_p_OBUF : out STD_LOGIC;
    dataG_n_OBUF : out STD_LOGIC;
    \send_data.idx_reg[0]_0\ : in STD_LOGIC;
    \send_data.idx_reg[3]_0\ : in STD_LOGIC;
    Q : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CLK : in STD_LOGIC;
    lopt : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of serializer_2 : entity is "serializer";
end serializer_2;

architecture STRUCTURE of serializer_2 is
  signal \d_tmp_reg_n_0_[2]\ : STD_LOGIC;
  signal \d_tmp_reg_n_0_[8]\ : STD_LOGIC;
  signal \d_tmp_reg_n_0_[9]\ : STD_LOGIC;
  signal \^datag_p_obuf\ : STD_LOGIC;
  signal dout_i_1_n_0 : STD_LOGIC;
  signal \dout_i_2__0_n_0\ : STD_LOGIC;
  signal dout_reg_lopt_replica_1 : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \send_data.idx_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute \PinAttr:I1:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I1:HOLD_DETOUR\ of \dout_i_2__0\ : label is 190;
  attribute OPT_INSERTED_REPDRIVER : boolean;
  attribute OPT_INSERTED_REPDRIVER of dout_reg_lopt_replica : label is std.standard.true;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of dout_reg_lopt_replica : label is "SWEEP";
  attribute \PinAttr:I3:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I3:HOLD_DETOUR\ of \send_data.idx[1]_i_1__0\ : label is 190;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \send_data.idx[1]_i_1__0\ : label is "soft_lutpair12";
  attribute \PinAttr:I0:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I0:HOLD_DETOUR\ of \send_data.idx[2]_i_1__0\ : label is 190;
  attribute \PinAttr:I3:HOLD_DETOUR\ of \send_data.idx[3]_i_1__0\ : label is 190;
  attribute SOFT_HLUTNM of \send_data.idx[3]_i_1__0\ : label is "soft_lutpair12";
begin
  dataG_p_OBUF <= \^datag_p_obuf\;
  lopt <= dout_reg_lopt_replica_1;
\d_tmp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(0),
      Q => \d_tmp_reg_n_0_[2]\,
      R => '0'
    );
\d_tmp_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(1),
      Q => \d_tmp_reg_n_0_[8]\,
      R => '0'
    );
\d_tmp_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(2),
      Q => \d_tmp_reg_n_0_[9]\,
      R => '0'
    );
dataG_n_OBUF_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^datag_p_obuf\,
      O => dataG_n_OBUF
    );
dout_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFF00088888888"
    )
        port map (
      I0 => \d_tmp_reg_n_0_[2]\,
      I1 => \dout_i_2__0_n_0\,
      I2 => \d_tmp_reg_n_0_[9]\,
      I3 => \send_data.idx_reg\(0),
      I4 => \d_tmp_reg_n_0_[8]\,
      I5 => \send_data.idx_reg\(3),
      O => dout_i_1_n_0
    );
\dout_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => \send_data.idx_reg\(0),
      I1 => \send_data.idx_reg\(2),
      I2 => \send_data.idx_reg\(1),
      O => \dout_i_2__0_n_0\
    );
dout_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[0]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_0\,
      D => dout_i_1_n_0,
      Q => \^datag_p_obuf\
    );
dout_reg_lopt_replica: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[0]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_0\,
      D => dout_i_1_n_0,
      Q => dout_reg_lopt_replica_1
    );
\send_data.idx[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \send_data.idx_reg\(0),
      O => \p_0_in__0\(0)
    );
\send_data.idx[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5A52"
    )
        port map (
      I0 => \send_data.idx_reg\(0),
      I1 => \send_data.idx_reg\(3),
      I2 => \send_data.idx_reg\(1),
      I3 => \send_data.idx_reg\(2),
      O => \p_0_in__0\(1)
    );
\send_data.idx[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \send_data.idx_reg\(2),
      I1 => \send_data.idx_reg\(1),
      I2 => \send_data.idx_reg\(0),
      O => \p_0_in__0\(2)
    );
\send_data.idx[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6CC4"
    )
        port map (
      I0 => \send_data.idx_reg\(0),
      I1 => \send_data.idx_reg\(3),
      I2 => \send_data.idx_reg\(1),
      I3 => \send_data.idx_reg\(2),
      O => \p_0_in__0\(3)
    );
\send_data.idx_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[0]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_0\,
      D => \p_0_in__0\(0),
      Q => \send_data.idx_reg\(0)
    );
\send_data.idx_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[0]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_0\,
      D => \p_0_in__0\(1),
      Q => \send_data.idx_reg\(1)
    );
\send_data.idx_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[0]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_0\,
      D => \p_0_in__0\(2),
      Q => \send_data.idx_reg\(2)
    );
\send_data.idx_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[0]_0\,
      CE => '1',
      CLR => \send_data.idx_reg[3]_0\,
      D => \p_0_in__0\(3),
      Q => \send_data.idx_reg\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity serializer_3 is
  port (
    dataR_p_OBUF : out STD_LOGIC;
    serial_en_reg : out STD_LOGIC;
    dataR_n_OBUF : out STD_LOGIC;
    \send_data.idx_reg[3]_0\ : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 2 downto 0 );
    CLK : in STD_LOGIC;
    lopt : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of serializer_3 : entity is "serializer";
end serializer_3;

architecture STRUCTURE of serializer_3 is
  signal d_tmp : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal \^datar_p_obuf\ : STD_LOGIC;
  signal \dout_i_1__0_n_0\ : STD_LOGIC;
  signal dout_i_4_n_0 : STD_LOGIC;
  signal dout_i_5_n_0 : STD_LOGIC;
  signal dout_reg_i_3_n_0 : STD_LOGIC;
  signal dout_reg_lopt_replica_1 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \send_data.idx_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^serial_en_reg\ : STD_LOGIC;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of dout_i_4 : label is "RETARGET";
  attribute OPT_MODIFIED of dout_i_5 : label is "RETARGET";
  attribute OPT_MODIFIED of dout_reg_i_3 : label is "RETARGET";
  attribute OPT_INSERTED_REPDRIVER : boolean;
  attribute OPT_INSERTED_REPDRIVER of dout_reg_lopt_replica : label is std.standard.true;
  attribute OPT_MODIFIED of dout_reg_lopt_replica : label is "SWEEP";
  attribute \PinAttr:I0:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I0:HOLD_DETOUR\ of \send_data.idx[1]_i_1\ : label is 155;
  attribute \PinAttr:I3:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I3:HOLD_DETOUR\ of \send_data.idx[1]_i_1\ : label is 190;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \send_data.idx[1]_i_1\ : label is "soft_lutpair15";
  attribute \PinAttr:I0:HOLD_DETOUR\ of \send_data.idx[3]_i_1\ : label is 155;
  attribute \PinAttr:I3:HOLD_DETOUR\ of \send_data.idx[3]_i_1\ : label is 190;
  attribute SOFT_HLUTNM of \send_data.idx[3]_i_1\ : label is "soft_lutpair15";
begin
  dataR_p_OBUF <= \^datar_p_obuf\;
  lopt <= dout_reg_lopt_replica_1;
  serial_en_reg <= \^serial_en_reg\;
\d_tmp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(0),
      Q => d_tmp(2),
      R => '0'
    );
\d_tmp_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(1),
      Q => d_tmp(8),
      R => '0'
    );
\d_tmp_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => Q,
      D => D(2),
      Q => d_tmp(9),
      R => '0'
    );
dataR_n_OBUF_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^datar_p_obuf\,
      O => dataR_n_OBUF
    );
\dout_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => d_tmp(9),
      I1 => \send_data.idx_reg\(0),
      I2 => d_tmp(8),
      I3 => \send_data.idx_reg\(3),
      I4 => dout_reg_i_3_n_0,
      O => \dout_i_1__0_n_0\
    );
dout_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rst_IBUF,
      I1 => Q,
      O => \^serial_en_reg\
    );
dout_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => d_tmp(2),
      I1 => \send_data.idx_reg\(1),
      I2 => \send_data.idx_reg\(0),
      O => dout_i_4_n_0
    );
dout_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => d_tmp(2),
      I1 => \send_data.idx_reg\(0),
      O => dout_i_5_n_0
    );
dout_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \^serial_en_reg\,
      D => \dout_i_1__0_n_0\,
      Q => \^datar_p_obuf\
    );
dout_reg_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => dout_i_4_n_0,
      I1 => dout_i_5_n_0,
      I2 => \send_data.idx_reg\(2),
      O => dout_reg_i_3_n_0
    );
dout_reg_lopt_replica: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \^serial_en_reg\,
      D => \dout_i_1__0_n_0\,
      Q => dout_reg_lopt_replica_1
    );
\send_data.idx[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \send_data.idx_reg\(0),
      O => p_0_in(0)
    );
\send_data.idx[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => \send_data.idx_reg\(2),
      I1 => \send_data.idx_reg\(3),
      I2 => \send_data.idx_reg\(0),
      I3 => \send_data.idx_reg\(1),
      O => p_0_in(1)
    );
\send_data.idx[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \send_data.idx_reg\(2),
      I1 => \send_data.idx_reg\(1),
      I2 => \send_data.idx_reg\(0),
      O => p_0_in(2)
    );
\send_data.idx[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6C8C"
    )
        port map (
      I0 => \send_data.idx_reg\(2),
      I1 => \send_data.idx_reg\(3),
      I2 => \send_data.idx_reg\(0),
      I3 => \send_data.idx_reg\(1),
      O => p_0_in(3)
    );
\send_data.idx_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \^serial_en_reg\,
      D => p_0_in(0),
      Q => \send_data.idx_reg\(0)
    );
\send_data.idx_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \^serial_en_reg\,
      D => p_0_in(1),
      Q => \send_data.idx_reg\(1)
    );
\send_data.idx_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \^serial_en_reg\,
      D => p_0_in(2),
      Q => \send_data.idx_reg\(2)
    );
\send_data.idx_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \send_data.idx_reg[3]_0\,
      CE => '1',
      CLR => \^serial_en_reg\,
      D => p_0_in(3),
      Q => \send_data.idx_reg\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tmds_encoder is
  port (
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    \dout_reg[8]_0\ : in STD_LOGIC;
    CLK : in STD_LOGIC;
    \dout_reg[6]_0\ : in STD_LOGIC;
    \dout_reg[3]_0\ : in STD_LOGIC;
    \dout_reg[2]_0\ : in STD_LOGIC;
    \dout_reg[9]_0\ : in STD_LOGIC;
    \count_reg[1]_0\ : in STD_LOGIC
  );
end tmds_encoder;

architecture STRUCTURE of tmds_encoder is
  signal \^d\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \count[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count[3]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \dout[9]_i_1__1_n_0\ : STD_LOGIC;
  attribute \PinAttr:I1:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I1:HOLD_DETOUR\ of \count[2]_i_1__0\ : label is 194;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[2]_i_1__0\ : label is "soft_lutpair6";
  attribute \PinAttr:I2:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I2:HOLD_DETOUR\ of \count[3]_i_1__0\ : label is 194;
  attribute SOFT_HLUTNM of \count[3]_i_1__0\ : label is "soft_lutpair6";
begin
  D(4 downto 0) <= \^d\(4 downto 0);
\count[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"14"
    )
        port map (
      I0 => \count_reg[1]_0\,
      I1 => \count[3]_i_2_n_0\,
      I2 => \count_reg_n_0_[1]\,
      O => \count[1]_i_1__0_n_0\
    );
\count[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4151"
    )
        port map (
      I0 => \count_reg[1]_0\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count[3]_i_2_n_0\,
      I3 => \count_reg_n_0_[1]\,
      O => \count[2]_i_1__0_n_0\
    );
\count[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11141414"
    )
        port map (
      I0 => \count_reg[1]_0\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[1]\,
      I4 => \count[3]_i_2_n_0\,
      O => \count[3]_i_1__0_n_0\
    );
\count[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[2]\,
      I2 => \count_reg_n_0_[1]\,
      O => \count[3]_i_2_n_0\
    );
\count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \count[1]_i_1__0_n_0\,
      Q => \count_reg_n_0_[1]\,
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \count[2]_i_1__0_n_0\,
      Q => \count_reg_n_0_[2]\,
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \count[3]_i_1__0_n_0\,
      Q => \count_reg_n_0_[3]\,
      R => '0'
    );
\dout[9]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CACACA0A"
    )
        port map (
      I0 => \^d\(4),
      I1 => \dout_reg[9]_0\,
      I2 => en,
      I3 => \count_reg[1]_0\,
      I4 => \count[3]_i_2_n_0\,
      O => \dout[9]_i_1__1_n_0\
    );
\dout_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \dout_reg[2]_0\,
      Q => \^d\(0),
      R => '0'
    );
\dout_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \dout_reg[3]_0\,
      Q => \^d\(1),
      R => '0'
    );
\dout_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \dout_reg[6]_0\,
      Q => \^d\(2),
      R => '0'
    );
\dout_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \dout_reg[8]_0\,
      Q => \^d\(3),
      R => '0'
    );
\dout_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \dout[9]_i_1__1_n_0\,
      Q => \^d\(4),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tmds_encoder_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    en : in STD_LOGIC;
    \dout_reg[2]_0\ : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tmds_encoder_0 : entity is "tmds_encoder";
end tmds_encoder_0;

architecture STRUCTURE of tmds_encoder_0 is
  signal \^d\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \dout[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \dout[9]_i_1__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dout[8]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \dout[9]_i_1__0\ : label is "soft_lutpair8";
begin
  D(2 downto 0) <= \^d\(2 downto 0);
\dout[8]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^d\(1),
      I1 => en,
      O => \dout[8]_i_1__0_n_0\
    );
\dout[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \^d\(2),
      I1 => en,
      I2 => \dout_reg[2]_0\,
      O => \dout[9]_i_1__0_n_0\
    );
\dout_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \dout_reg[2]_0\,
      Q => \^d\(0),
      R => '0'
    );
\dout_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \dout[8]_i_1__0_n_0\,
      Q => \^d\(1),
      R => '0'
    );
\dout_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \dout[9]_i_1__0_n_0\,
      Q => \^d\(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tmds_encoder_1 is
  port (
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    en : in STD_LOGIC;
    \dout_reg[2]_0\ : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tmds_encoder_1 : entity is "tmds_encoder";
end tmds_encoder_1;

architecture STRUCTURE of tmds_encoder_1 is
  signal \^d\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \dout[8]_i_1_n_0\ : STD_LOGIC;
  signal \dout[9]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \dout[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \dout[9]_i_1\ : label is "soft_lutpair9";
begin
  D(2 downto 0) <= \^d\(2 downto 0);
\dout[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^d\(1),
      I1 => en,
      O => \dout[8]_i_1_n_0\
    );
\dout[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => \^d\(2),
      I1 => en,
      I2 => \dout_reg[2]_0\,
      O => \dout[9]_i_1_n_0\
    );
\dout_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => en,
      D => \dout_reg[2]_0\,
      Q => \^d\(0),
      R => '0'
    );
\dout_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \dout[8]_i_1_n_0\,
      Q => \^d\(1),
      R => '0'
    );
\dout_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \dout[9]_i_1_n_0\,
      Q => \^d\(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_gen_clk_wiz_0_0 is
  port (
    pix_clk : out STD_LOGIC;
    tmds_clk : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    lopt : in STD_LOGIC
  );
end clock_gen_clk_wiz_0_0;

architecture STRUCTURE of clock_gen_clk_wiz_0_0 is
  signal NLW_inst_locked_UNCONNECTED : STD_LOGIC;
begin
  locked <= 'Z';
inst: entity work.clock_gen_clk_wiz_0_0_clk_wiz
     port map (
      clk_in1 => clk_in1,
      locked => NLW_inst_locked_UNCONNECTED,
      lopt => lopt,
      pix_clk => pix_clk,
      reset => reset,
      tmds_clk => tmds_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_gen_clk_wiz_1_0 is
  port (
    clk_hdmi : out STD_LOGIC;
    clk_out : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
end clock_gen_clk_wiz_1_0;

architecture STRUCTURE of clock_gen_clk_wiz_1_0 is
  signal NLW_inst_reset_UNCONNECTED : STD_LOGIC;
begin
inst: entity work.clock_gen_clk_wiz_1_0_clk_wiz
     port map (
      clk_hdmi => clk_hdmi,
      clk_in1 => clk_in1,
      clk_out => clk_out,
      locked => locked,
      reset => NLW_inst_reset_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_communication is
  port (
    scl_OBUF : out STD_LOGIC;
    sda_OBUF : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    stretch : in STD_LOGIC
  );
end i2c_communication;

architecture STRUCTURE of i2c_communication is
  signal \FSM_onehot_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal busy_cnt : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal busy_prev : STD_LOGIC;
  signal busy_prev_reg_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC;
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter[12]_i_3_n_0\ : STD_LOGIC;
  signal \counter[12]_i_4_n_0\ : STD_LOGIC;
  signal \counter[12]_i_5_n_0\ : STD_LOGIC;
  signal \counter[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter[16]_i_3_n_0\ : STD_LOGIC;
  signal \counter[16]_i_4_n_0\ : STD_LOGIC;
  signal \counter[16]_i_5_n_0\ : STD_LOGIC;
  signal \counter[20]_i_2_n_0\ : STD_LOGIC;
  signal \counter[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter[4]_i_3_n_0\ : STD_LOGIC;
  signal \counter[4]_i_4_n_0\ : STD_LOGIC;
  signal \counter[4]_i_5_n_0\ : STD_LOGIC;
  signal \counter[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter[8]_i_4_n_0\ : STD_LOGIC;
  signal \counter[8]_i_5_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 20 downto 4 );
  signal \counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal ena : STD_LOGIC;
  signal i2c_master_0_n_0 : STD_LOGIC;
  signal i2c_master_0_n_1 : STD_LOGIC;
  signal i2c_master_0_n_2 : STD_LOGIC;
  signal i2c_master_0_n_3 : STD_LOGIC;
  signal i2c_master_0_n_5 : STD_LOGIC;
  signal i2c_master_0_n_6 : STD_LOGIC;
  signal i2c_master_0_n_7 : STD_LOGIC;
  signal i2c_master_0_n_8 : STD_LOGIC;
  signal i2c_master_0_n_9 : STD_LOGIC;
  signal \NLW_counter_reg[0]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counter_reg[4]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_counter_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "start:001,read_data:010,output_result:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "start:001,read_data:010,output_result:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "start:001,read_data:010,output_result:100,";
  attribute \PinAttr:I2:HOLD_DETOUR\ : integer;
  attribute \PinAttr:I2:HOLD_DETOUR\ of \counter[0]_i_2\ : label is 188;
  attribute \PinAttr:I2:HOLD_DETOUR\ of \counter[0]_i_6\ : label is 188;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
begin
\FSM_onehot_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000007F"
    )
        port map (
      I0 => counter_reg(16),
      I1 => counter_reg(17),
      I2 => \FSM_onehot_state[2]_i_4_n_0\,
      I3 => counter_reg(19),
      I4 => counter_reg(18),
      O => \FSM_onehot_state[2]_i_2_n_0\
    );
\FSM_onehot_state[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFD00"
    )
        port map (
      I0 => \FSM_onehot_state[2]_i_5_n_0\,
      I1 => counter_reg(11),
      I2 => counter_reg(10),
      I3 => counter_reg(12),
      I4 => \FSM_onehot_state[2]_i_6_n_0\,
      O => \FSM_onehot_state[2]_i_4_n_0\
    );
\FSM_onehot_state[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555557FFFFFF"
    )
        port map (
      I0 => counter_reg(9),
      I1 => counter_reg(5),
      I2 => counter_reg(4),
      I3 => counter_reg(7),
      I4 => counter_reg(6),
      I5 => counter_reg(8),
      O => \FSM_onehot_state[2]_i_5_n_0\
    );
\FSM_onehot_state[2]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => counter_reg(13),
      I1 => counter_reg(15),
      I2 => counter_reg(14),
      O => \FSM_onehot_state[2]_i_6_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => i2c_master_0_n_9,
      PRE => rst_IBUF,
      Q => counter
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => i2c_master_0_n_8,
      Q => busy_prev
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => i2c_master_0_n_7,
      Q => \FSM_onehot_state_reg_n_0_[2]\
    );
\busy_cnt_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy_prev,
      CLR => rst_IBUF,
      D => i2c_master_0_n_3,
      Q => busy_cnt(0)
    );
\busy_cnt_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy_prev,
      CLR => rst_IBUF,
      D => i2c_master_0_n_2,
      Q => busy_cnt(1)
    );
\busy_cnt_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy_prev,
      CLR => rst_IBUF,
      D => i2c_master_0_n_1,
      Q => busy_cnt(2)
    );
\busy_cnt_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => busy_prev,
      CLR => rst_IBUF,
      D => i2c_master_0_n_0,
      Q => busy_cnt(3)
    );
busy_prev_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => i2c_master_0_n_5,
      Q => busy_prev_reg_n_0,
      R => '0'
    );
\counter[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \counter_reg_n_0_[0]\,
      O => \counter[0]_i_2_n_0\
    );
\counter[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \counter_reg_n_0_[3]\,
      O => \counter[0]_i_3_n_0\
    );
\counter[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \counter_reg_n_0_[2]\,
      O => \counter[0]_i_4_n_0\
    );
\counter[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \counter_reg_n_0_[1]\,
      O => \counter[0]_i_5_n_0\
    );
\counter[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \counter_reg_n_0_[0]\,
      O => \counter[0]_i_6_n_0\
    );
\counter[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(15),
      O => \counter[12]_i_2_n_0\
    );
\counter[12]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(14),
      O => \counter[12]_i_3_n_0\
    );
\counter[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(13),
      O => \counter[12]_i_4_n_0\
    );
\counter[12]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(12),
      O => \counter[12]_i_5_n_0\
    );
\counter[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(19),
      O => \counter[16]_i_2_n_0\
    );
\counter[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(18),
      O => \counter[16]_i_3_n_0\
    );
\counter[16]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(17),
      O => \counter[16]_i_4_n_0\
    );
\counter[16]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(16),
      O => \counter[16]_i_5_n_0\
    );
\counter[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      O => \counter[20]_i_2_n_0\
    );
\counter[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(7),
      O => \counter[4]_i_2_n_0\
    );
\counter[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(6),
      O => \counter[4]_i_3_n_0\
    );
\counter[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(5),
      O => \counter[4]_i_4_n_0\
    );
\counter[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(4),
      O => \counter[4]_i_5_n_0\
    );
\counter[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(11),
      O => \counter[8]_i_2_n_0\
    );
\counter[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(10),
      O => \counter[8]_i_3_n_0\
    );
\counter[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(9),
      O => \counter[8]_i_4_n_0\
    );
\counter[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => counter_reg(20),
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => counter_reg(8),
      O => \counter[8]_i_5_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[0]_i_1_n_7\,
      Q => \counter_reg_n_0_[0]\
    );
\counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_1_n_0\,
      CO(2 downto 0) => \NLW_counter_reg[0]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \counter[0]_i_2_n_0\,
      O(3) => \counter_reg[0]_i_1_n_4\,
      O(2) => \counter_reg[0]_i_1_n_5\,
      O(1) => \counter_reg[0]_i_1_n_6\,
      O(0) => \counter_reg[0]_i_1_n_7\,
      S(3) => \counter[0]_i_3_n_0\,
      S(2) => \counter[0]_i_4_n_0\,
      S(1) => \counter[0]_i_5_n_0\,
      S(0) => \counter[0]_i_6_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10)
    );
\counter_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11)
    );
\counter_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12)
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2 downto 0) => \NLW_counter_reg[12]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3) => \counter[12]_i_2_n_0\,
      S(2) => \counter[12]_i_3_n_0\,
      S(1) => \counter[12]_i_4_n_0\,
      S(0) => \counter[12]_i_5_n_0\
    );
\counter_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13)
    );
\counter_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14)
    );
\counter_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15)
    );
\counter_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16)
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2 downto 0) => \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3) => \counter[16]_i_2_n_0\,
      S(2) => \counter[16]_i_3_n_0\,
      S(1) => \counter[16]_i_4_n_0\,
      S(0) => \counter[16]_i_5_n_0\
    );
\counter_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17)
    );
\counter_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18)
    );
\counter_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19)
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[0]_i_1_n_6\,
      Q => \counter_reg_n_0_[1]\
    );
\counter_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20)
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3 downto 0) => \NLW_counter_reg[20]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_counter_reg[20]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \counter[20]_i_2_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[0]_i_1_n_5\,
      Q => \counter_reg_n_0_[2]\
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[0]_i_1_n_4\,
      Q => \counter_reg_n_0_[3]\
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4)
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_1_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2 downto 0) => \NLW_counter_reg[4]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3) => \counter[4]_i_2_n_0\,
      S(2) => \counter[4]_i_3_n_0\,
      S(1) => \counter[4]_i_4_n_0\,
      S(0) => \counter[4]_i_5_n_0\
    );
\counter_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5)
    );
\counter_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6)
    );
\counter_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7)
    );
\counter_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8)
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2 downto 0) => \NLW_counter_reg[8]_i_1_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3) => \counter[8]_i_2_n_0\,
      S(2) => \counter[8]_i_3_n_0\,
      S(1) => \counter[8]_i_4_n_0\,
      S(0) => \counter[8]_i_5_n_0\
    );
\counter_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => counter,
      CLR => rst_IBUF,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9)
    );
i2c_ena_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst_IBUF,
      D => i2c_master_0_n_6,
      Q => ena
    );
i2c_master_0: entity work.i2c_master
     port map (
      D(3) => i2c_master_0_n_0,
      D(2) => i2c_master_0_n_1,
      D(1) => i2c_master_0_n_2,
      D(0) => i2c_master_0_n_3,
      \FSM_onehot_state_reg[1]_0\ => i2c_master_0_n_6,
      \FSM_onehot_state_reg[2]_0\ => \FSM_onehot_state[2]_i_2_n_0\,
      \FSM_onehot_state_reg[2]_1\ => \FSM_onehot_state_reg_n_0_[2]\,
      Q(3 downto 0) => busy_cnt(3 downto 0),
      busy_prev => busy_prev,
      busy_prev_reg => busy_prev_reg_n_0,
      busy_reg_0 => i2c_master_0_n_5,
      clk => clk,
      counter => counter,
      counter_reg(0) => counter_reg(20),
      \counter_reg[20]\ => i2c_master_0_n_7,
      \counter_reg[20]_0\ => i2c_master_0_n_8,
      \counter_reg[20]_1\ => i2c_master_0_n_9,
      ena => ena,
      rst_IBUF => rst_IBUF,
      scl_OBUF => scl_OBUF,
      sda_OBUF => sda_OBUF,
      stretch => stretch
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity video_generator is
  port (
    dataR_p_OBUF : out STD_LOGIC;
    dataG_p_OBUF : out STD_LOGIC;
    dataB_p_OBUF : out STD_LOGIC;
    Q : out STD_LOGIC;
    clk_p_OBUF : out STD_LOGIC;
    dataR_n_OBUF : out STD_LOGIC;
    dataG_n_OBUF : out STD_LOGIC;
    dataB_n_OBUF : out STD_LOGIC;
    CLK : in STD_LOGIC;
    rst_clk2 : in STD_LOGIC;
    \send_data.idx_reg[3]\ : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    lopt : out STD_LOGIC;
    lopt_1 : out STD_LOGIC;
    lopt_2 : out STD_LOGIC
  );
end video_generator;

architecture STRUCTURE of video_generator is
  signal \^q\ : STD_LOGIC;
  signal cnt_n_0 : STD_LOGIC;
  signal cnt_n_1 : STD_LOGIC;
  signal cnt_n_2 : STD_LOGIC;
  signal cnt_n_3 : STD_LOGIC;
  signal cnt_n_4 : STD_LOGIC;
  signal cnt_n_5 : STD_LOGIC;
  signal dout : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal en : STD_LOGIC;
  signal enc_b_n_0 : STD_LOGIC;
  signal enc_b_n_1 : STD_LOGIC;
  signal enc_b_n_2 : STD_LOGIC;
  signal enc_b_n_3 : STD_LOGIC;
  signal enc_b_n_4 : STD_LOGIC;
  signal enc_g_n_0 : STD_LOGIC;
  signal enc_g_n_1 : STD_LOGIC;
  signal enc_g_n_2 : STD_LOGIC;
  signal serial_en_i_1_n_0 : STD_LOGIC;
  signal serial_r_n_1 : STD_LOGIC;
begin
  Q <= \^q\;
clk_p_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^q\,
      I1 => \send_data.idx_reg[3]\,
      O => clk_p_OBUF
    );
cnt: entity work.counter
     port map (
      CLK => CLK,
      \counter_h_reg[8]_0\ => cnt_n_1,
      \counter_v_reg[27]_0\ => cnt_n_0,
      \counter_v_reg[27]_1\ => cnt_n_2,
      \counter_v_reg[27]_2\ => cnt_n_3,
      \counter_v_reg[27]_3\ => cnt_n_4,
      \counter_v_reg[27]_4\ => cnt_n_5,
      en => en,
      rst_IBUF => rst_IBUF
    );
enc_b: entity work.tmds_encoder
     port map (
      CLK => CLK,
      D(4) => enc_b_n_0,
      D(3) => enc_b_n_1,
      D(2) => enc_b_n_2,
      D(1) => enc_b_n_3,
      D(0) => enc_b_n_4,
      \count_reg[1]_0\ => cnt_n_1,
      \dout_reg[2]_0\ => cnt_n_5,
      \dout_reg[3]_0\ => cnt_n_4,
      \dout_reg[6]_0\ => cnt_n_0,
      \dout_reg[8]_0\ => cnt_n_3,
      \dout_reg[9]_0\ => cnt_n_2,
      en => en
    );
enc_g: entity work.tmds_encoder_0
     port map (
      CLK => CLK,
      D(2) => enc_g_n_0,
      D(1) => enc_g_n_1,
      D(0) => enc_g_n_2,
      \dout_reg[2]_0\ => cnt_n_1,
      en => en
    );
enc_r: entity work.tmds_encoder_1
     port map (
      CLK => CLK,
      D(2 downto 1) => dout(9 downto 8),
      D(0) => dout(2),
      \dout_reg[2]_0\ => cnt_n_1,
      en => en
    );
encoder_en_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => rst_clk2,
      D => '1',
      Q => en
    );
serial_b: entity work.serializer
     port map (
      CLK => CLK,
      D(4) => enc_b_n_0,
      D(3) => enc_b_n_1,
      D(2) => enc_b_n_2,
      D(1) => enc_b_n_3,
      D(0) => enc_b_n_4,
      Q => \^q\,
      dataB_n_OBUF => dataB_n_OBUF,
      dataB_p_OBUF => dataB_p_OBUF,
      lopt => lopt,
      \send_data.idx_reg[3]_0\ => \send_data.idx_reg[3]\,
      \send_data.idx_reg[3]_1\ => serial_r_n_1
    );
serial_en_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => en,
      O => serial_en_i_1_n_0
    );
serial_en_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => serial_en_i_1_n_0,
      D => '1',
      Q => \^q\
    );
serial_g: entity work.serializer_2
     port map (
      CLK => CLK,
      D(2) => enc_g_n_0,
      D(1) => enc_g_n_1,
      D(0) => enc_g_n_2,
      Q => \^q\,
      dataG_n_OBUF => dataG_n_OBUF,
      dataG_p_OBUF => dataG_p_OBUF,
      lopt => lopt_1,
      \send_data.idx_reg[0]_0\ => \send_data.idx_reg[3]\,
      \send_data.idx_reg[3]_0\ => serial_r_n_1
    );
serial_r: entity work.serializer_3
     port map (
      CLK => CLK,
      D(2 downto 1) => dout(9 downto 8),
      D(0) => dout(2),
      Q => \^q\,
      dataR_n_OBUF => dataR_n_OBUF,
      dataR_p_OBUF => dataR_p_OBUF,
      lopt => lopt_2,
      rst_IBUF => rst_IBUF,
      \send_data.idx_reg[3]_0\ => \send_data.idx_reg[3]\,
      serial_en_reg => serial_r_n_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_gen is
  port (
    clk : out STD_LOGIC;
    clk_en : out STD_LOGIC;
    clk_in : in STD_LOGIC;
    pixel_clk : out STD_LOGIC;
    pll_en : out STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    rst_clk2 : in STD_LOGIC;
    tmds_clk : out STD_LOGIC;
    lopt : in STD_LOGIC
  );
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of clock_gen : entity is "clock_gen.hwdef";
end clock_gen;

architecture STRUCTURE of clock_gen is
  signal clk_wiz_1_clk_hdmi : STD_LOGIC;
  signal NLW_clk_wiz_0_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_clk_wiz_1_reset_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_in : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_IN CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_in : signal is "XIL_INTERFACENAME CLK.CLK_IN, CLK_DOMAIN clock_gen_clk_in, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of pixel_clk : signal is "xilinx.com:signal:clock:1.0 CLK.PIXEL_CLK CLK";
  attribute X_INTERFACE_PARAMETER of pixel_clk : signal is "XIL_INTERFACENAME CLK.PIXEL_CLK, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 25173611, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of reset_rtl : signal is "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST";
  attribute X_INTERFACE_PARAMETER of reset_rtl : signal is "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of rst_clk2 : signal is "xilinx.com:signal:reset:1.0 RST.RST_CLK2 RST";
  attribute X_INTERFACE_PARAMETER of rst_clk2 : signal is "XIL_INTERFACENAME RST.RST_CLK2, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of tmds_clk : signal is "xilinx.com:signal:clock:1.0 CLK.TMDS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of tmds_clk : signal is "XIL_INTERFACENAME CLK.TMDS_CLK, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 251736111, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  pll_en <= 'Z';
clk_wiz_0: entity work.clock_gen_clk_wiz_0_0
     port map (
      clk_in1 => clk_wiz_1_clk_hdmi,
      locked => NLW_clk_wiz_0_locked_UNCONNECTED,
      lopt => lopt,
      pix_clk => pixel_clk,
      reset => rst_clk2,
      tmds_clk => tmds_clk
    );
clk_wiz_1: entity work.clock_gen_clk_wiz_1_0
     port map (
      clk_hdmi => clk_wiz_1_clk_hdmi,
      clk_in1 => clk_in,
      clk_out => clk,
      locked => clk_en,
      reset => NLW_clk_wiz_1_reset_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_gen_wrapper is
  port (
    \^clk\ : out STD_LOGIC;
    CLK : out STD_LOGIC;
    clkout2_buf : out STD_LOGIC;
    rst_clk2 : out STD_LOGIC;
    clk_n_OBUF : out STD_LOGIC;
    sysclk : in STD_LOGIC;
    Q : in STD_LOGIC
  );
end clock_gen_wrapper;

architecture STRUCTURE of clock_gen_wrapper is
  signal clk_en : STD_LOGIC;
  signal \^clkout2_buf\ : STD_LOGIC;
  signal \^rst_clk2\ : STD_LOGIC;
  signal NLW_clock_gen_i_pll_en_UNCONNECTED : STD_LOGIC;
  signal NLW_clock_gen_i_reset_rtl_UNCONNECTED : STD_LOGIC;
  attribute hw_handoff : string;
  attribute hw_handoff of clock_gen_i : label is "clock_gen.hwdef";
begin
  clkout2_buf <= \^clkout2_buf\;
  rst_clk2 <= \^rst_clk2\;
clk_n_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^clkout2_buf\,
      I1 => Q,
      O => clk_n_OBUF
    );
clock_gen_i: entity work.clock_gen
     port map (
      clk => \^clk\,
      clk_en => clk_en,
      clk_in => sysclk,
      lopt => clk_en,
      pixel_clk => CLK,
      pll_en => NLW_clock_gen_i_pll_en_UNCONNECTED,
      reset_rtl => NLW_clock_gen_i_reset_rtl_UNCONNECTED,
      rst_clk2 => \^rst_clk2\,
      tmds_clk => \^clkout2_buf\
    );
clock_gen_i_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clk_en,
      O => \^rst_clk2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity oscilloscope is
  port (
    sysclk : in STD_LOGIC;
    rst : in STD_LOGIC;
    sda : inout STD_LOGIC;
    scl : inout STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_p : out STD_LOGIC;
    clk_n : out STD_LOGIC;
    dataR_p : out STD_LOGIC;
    dataR_n : out STD_LOGIC;
    dataG_p : out STD_LOGIC;
    dataG_n : out STD_LOGIC;
    dataB_p : out STD_LOGIC;
    dataB_n : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of oscilloscope : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of oscilloscope : entity is "d8e0a2d0";
end oscilloscope;

architecture STRUCTURE of oscilloscope is
  signal clk : STD_LOGIC;
  signal clk_n_OBUF : STD_LOGIC;
  signal clk_p_OBUF : STD_LOGIC;
  signal dataB_n_OBUF : STD_LOGIC;
  signal dataG_n_OBUF : STD_LOGIC;
  signal dataR_n_OBUF : STD_LOGIC;
  signal hdmi_n_3 : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal lopt_2 : STD_LOGIC;
  signal pixel_clk : STD_LOGIC;
  signal rst_IBUF : STD_LOGIC;
  signal rst_clk2 : STD_LOGIC;
  signal scl_OBUF : STD_LOGIC;
  signal sda_OBUF : STD_LOGIC;
  signal tmds_clk : STD_LOGIC;
  signal NLW_hdmi_dataB_p_OBUF_UNCONNECTED : STD_LOGIC;
  signal NLW_hdmi_dataG_p_OBUF_UNCONNECTED : STD_LOGIC;
  signal NLW_hdmi_dataR_p_OBUF_UNCONNECTED : STD_LOGIC;
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of dataB_p_OBUF_inst : label is "SWEEP";
  attribute OPT_MODIFIED of dataG_p_OBUF_inst : label is "SWEEP";
  attribute OPT_MODIFIED of dataR_p_OBUF_inst : label is "SWEEP";
begin
pullup_sclinst: unisim.vcomponents.PULLUP
    port map (
      O => scl
    );
pullup_sdainst: unisim.vcomponents.PULLUP
    port map (
      O => sda
    );
clk_gen: entity work.clock_gen_wrapper
     port map (
      CLK => pixel_clk,
      Q => hdmi_n_3,
      \^clk\ => clk,
      clk_n_OBUF => clk_n_OBUF,
      clkout2_buf => tmds_clk,
      rst_clk2 => rst_clk2,
      sysclk => sysclk
    );
clk_n_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => clk_n_OBUF,
      O => clk_n
    );
clk_p_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => clk_p_OBUF,
      O => clk_p
    );
dataB_n_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => dataB_n_OBUF,
      O => dataB_n
    );
dataB_p_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => lopt,
      O => dataB_p
    );
dataG_n_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => dataG_n_OBUF,
      O => dataG_n
    );
dataG_p_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => lopt_1,
      O => dataG_p
    );
dataR_n_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => dataR_n_OBUF,
      O => dataR_n
    );
dataR_p_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => lopt_2,
      O => dataR_p
    );
hdmi: entity work.video_generator
     port map (
      CLK => pixel_clk,
      Q => hdmi_n_3,
      clk_p_OBUF => clk_p_OBUF,
      dataB_n_OBUF => dataB_n_OBUF,
      dataB_p_OBUF => NLW_hdmi_dataB_p_OBUF_UNCONNECTED,
      dataG_n_OBUF => dataG_n_OBUF,
      dataG_p_OBUF => NLW_hdmi_dataG_p_OBUF_UNCONNECTED,
      dataR_n_OBUF => dataR_n_OBUF,
      dataR_p_OBUF => NLW_hdmi_dataR_p_OBUF_UNCONNECTED,
      lopt => lopt,
      lopt_1 => lopt_1,
      lopt_2 => lopt_2,
      rst_IBUF => rst_IBUF,
      rst_clk2 => rst_clk2,
      \send_data.idx_reg[3]\ => tmds_clk
    );
i2c: entity work.i2c_communication
     port map (
      clk => clk,
      rst_IBUF => rst_IBUF,
      scl_OBUF => scl_OBUF,
      sda_OBUF => sda_OBUF,
      stretch => scl_OBUF
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => rst,
      O => rst_IBUF
    );
scl_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => scl_OBUF,
      O => scl
    );
sda_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => sda_OBUF,
      O => sda
    );
end STRUCTURE;
