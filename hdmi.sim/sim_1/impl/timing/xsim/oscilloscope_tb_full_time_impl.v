// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Dec 21 15:18:04 2023
// Host        : kris running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/kris/Vivado/zamfp-project/hdmi.sim/sim_1/impl/timing/xsim/oscilloscope_tb_full_time_impl.v
// Design      : oscilloscope
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* HW_HANDOFF = "clock_gen.hwdef" *) 
module clock_gen
   (clk,
    clk_en,
    clk_in,
    pixel_clk,
    pll_en,
    reset_rtl,
    rst_clk2,
    tmds_clk,
    lopt);
  output clk;
  output clk_en;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN, CLK_DOMAIN clock_gen_clk_in, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.PIXEL_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.PIXEL_CLK, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 25173611, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output pixel_clk;
  output pll_en;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_CLK2 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_CLK2, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst_clk2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TMDS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TMDS_CLK, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 251736111, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output tmds_clk;
  input lopt;

  wire clk;
  wire clk_en;
  wire clk_in;
  wire clk_wiz_1_clk_hdmi;
  wire lopt;
  wire pixel_clk;
  wire rst_clk2;
  wire tmds_clk;
  wire NLW_clk_wiz_0_locked_UNCONNECTED;
  wire NLW_clk_wiz_1_reset_UNCONNECTED;

  clock_gen_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_wiz_1_clk_hdmi),
        .locked(NLW_clk_wiz_0_locked_UNCONNECTED),
        .lopt(lopt),
        .pix_clk(pixel_clk),
        .reset(rst_clk2),
        .tmds_clk(tmds_clk));
  clock_gen_clk_wiz_1_0 clk_wiz_1
       (.clk_hdmi(clk_wiz_1_clk_hdmi),
        .clk_in1(clk_in),
        .clk_out(clk),
        .locked(clk_en),
        .reset(NLW_clk_wiz_1_reset_UNCONNECTED));
endmodule

module clock_gen_clk_wiz_0_0
   (pix_clk,
    tmds_clk,
    reset,
    locked,
    clk_in1,
    lopt);
  output pix_clk;
  output tmds_clk;
  input reset;
  output locked;
  input clk_in1;
  input lopt;

  wire clk_in1;
  wire lopt;
  wire pix_clk;
  wire reset;
  wire tmds_clk;
  wire NLW_inst_locked_UNCONNECTED;

  clock_gen_clk_wiz_0_0_clk_wiz inst
       (.clk_in1(clk_in1),
        .locked(NLW_inst_locked_UNCONNECTED),
        .lopt(lopt),
        .pix_clk(pix_clk),
        .reset(reset),
        .tmds_clk(tmds_clk));
endmodule

module clock_gen_clk_wiz_0_0_clk_wiz
   (pix_clk,
    tmds_clk,
    reset,
    locked,
    clk_in1,
    lopt);
  output pix_clk;
  output tmds_clk;
  input reset;
  output locked;
  input clk_in1;
  input lopt;

  wire clk_in1;
  wire clkfbout_buf_clock_gen_clk_wiz_0_0;
  wire clkfbout_clock_gen_clk_wiz_0_0;
  wire lopt;
  wire mmcm_adv_inst_n_16;
  wire pix_clk;
  wire pix_clk_clock_gen_clk_wiz_0_0;
  wire pix_clk_clock_gen_clk_wiz_0_0_en_clk;
  wire reset;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) wire [7:0]seq_reg1;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) wire [7:0]seq_reg2;
  wire tmds_clk;
  wire tmds_clk_clock_gen_clk_wiz_0_0;
  wire tmds_clk_clock_gen_clk_wiz_0_0_en_clk;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clock_gen_clk_wiz_0_0),
        .O(clkfbout_buf_clock_gen_clk_wiz_0_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0 GND:S1,IGNORE0,CE1 VCC:S0,IGNORE1,I1" *) 
  BUFGCTRL #(
    .CE_TYPE_CE0("SYNC"),
    .CE_TYPE_CE1("SYNC"),
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE"),
    .SIM_DEVICE("7SERIES"),
    .STARTUP_SYNC("FALSE")) 
    clkout1_buf
       (.CE0(seq_reg1[7]),
        .CE1(1'b0),
        .I0(pix_clk_clock_gen_clk_wiz_0_0),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(pix_clk),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  BUFH clkout1_buf_en
       (.I(pix_clk_clock_gen_clk_wiz_0_0),
        .O(pix_clk_clock_gen_clk_wiz_0_0_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0 GND:S1,IGNORE0,CE1 VCC:S0,IGNORE1,I1" *) 
  BUFGCTRL #(
    .CE_TYPE_CE0("SYNC"),
    .CE_TYPE_CE1("SYNC"),
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE"),
    .SIM_DEVICE("7SERIES"),
    .STARTUP_SYNC("FALSE")) 
    clkout2_buf
       (.CE0(seq_reg2[7]),
        .CE1(1'b0),
        .I0(tmds_clk_clock_gen_clk_wiz_0_0),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(tmds_clk),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  BUFH clkout2_buf_en
       (.I(tmds_clk_clock_gen_clk_wiz_0_0),
        .O(tmds_clk_clock_gen_clk_wiz_0_0_en_clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO RETARGET BUFG_OPT" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(18.125000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(8.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(30.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(3),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("BUF_IN"),
    .DIVCLK_DIVIDE(3),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b1),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_clock_gen_clk_wiz_0_0),
        .CLKFBOUT(clkfbout_clock_gen_clk_wiz_0_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(pix_clk_clock_gen_clk_wiz_0_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(tmds_clk_clock_gen_clk_wiz_0_0),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(mmcm_adv_inst_n_16),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(lopt));
  initial assign \seq_reg1_reg[0] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[0] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(mmcm_adv_inst_n_16),
        .Q(seq_reg1[0]));
  initial assign \seq_reg1_reg[1] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[1] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[0]),
        .Q(seq_reg1[1]));
  initial assign \seq_reg1_reg[2] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[2] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[1]),
        .Q(seq_reg1[2]));
  initial assign \seq_reg1_reg[3] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[3] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[2]),
        .Q(seq_reg1[3]));
  initial assign \seq_reg1_reg[4] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[4] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[3]),
        .Q(seq_reg1[4]));
  initial assign \seq_reg1_reg[5] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[5] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[4]),
        .Q(seq_reg1[5]));
  initial assign \seq_reg1_reg[6] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[6] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[5]),
        .Q(seq_reg1[6]));
  initial assign \seq_reg1_reg[7] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg1_reg[7] 
       (.C(pix_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg1[6]),
        .Q(seq_reg1[7]));
  initial assign \seq_reg2_reg[0] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[0] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(mmcm_adv_inst_n_16),
        .Q(seq_reg2[0]));
  initial assign \seq_reg2_reg[1] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[1] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[0]),
        .Q(seq_reg2[1]));
  initial assign \seq_reg2_reg[2] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[2] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[1]),
        .Q(seq_reg2[2]));
  initial assign \seq_reg2_reg[3] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[3] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[2]),
        .Q(seq_reg2[3]));
  initial assign \seq_reg2_reg[4] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[4] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[3]),
        .Q(seq_reg2[4]));
  initial assign \seq_reg2_reg[5] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[5] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[4]),
        .Q(seq_reg2[5]));
  initial assign \seq_reg2_reg[6] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[6] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[5]),
        .Q(seq_reg2[6]));
  initial assign \seq_reg2_reg[7] .notifier = 1'bx;
(* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \seq_reg2_reg[7] 
       (.C(tmds_clk_clock_gen_clk_wiz_0_0_en_clk),
        .CE(1'b1),
        .CLR(reset),
        .D(seq_reg2[6]),
        .Q(seq_reg2[7]));
endmodule

module clock_gen_clk_wiz_1_0
   (clk_hdmi,
    clk_out,
    reset,
    locked,
    clk_in1);
  output clk_hdmi;
  output clk_out;
  input reset;
  output locked;
  input clk_in1;

  wire clk_hdmi;
  wire clk_in1;
  wire clk_out;
  wire locked;
  wire NLW_inst_reset_UNCONNECTED;

  clock_gen_clk_wiz_1_0_clk_wiz inst
       (.clk_hdmi(clk_hdmi),
        .clk_in1(clk_in1),
        .clk_out(clk_out),
        .locked(locked),
        .reset(NLW_inst_reset_UNCONNECTED));
endmodule

module clock_gen_clk_wiz_1_0_clk_wiz
   (clk_hdmi,
    clk_out,
    reset,
    locked,
    clk_in1);
  output clk_hdmi;
  output clk_out;
  input reset;
  output locked;
  input clk_in1;

  wire clk_hdmi;
  wire clk_hdmi_clock_gen_clk_wiz_1_0;
  wire clk_in1;
  wire clk_in1_clock_gen_clk_wiz_1_0;
  wire clk_out;
  wire clk_out_clock_gen_clk_wiz_1_0;
  wire clkfbout_buf_clock_gen_clk_wiz_1_0;
  wire clkfbout_clock_gen_clk_wiz_1_0;
  wire locked;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clock_gen_clk_wiz_1_0),
        .O(clkfbout_buf_clock_gen_clk_wiz_1_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF #(
    .CCIO_EN("TRUE"),
    .IOSTANDARD("DEFAULT")) 
    clkin1_ibufg
       (.I(clk_in1),
        .O(clk_in1_clock_gen_clk_wiz_1_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkout1_buf
       (.I(clk_hdmi_clock_gen_clk_wiz_1_0),
        .O(clk_hdmi));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkout2_buf
       (.I(clk_out_clock_gen_clk_wiz_1_0),
        .O(clk_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(8.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(8.000000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(8.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(8),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_clock_gen_clk_wiz_1_0),
        .CLKFBOUT(clkfbout_clock_gen_clk_wiz_1_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1_clock_gen_clk_wiz_1_0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_hdmi_clock_gen_clk_wiz_1_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(clk_out_clock_gen_clk_wiz_1_0),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
endmodule

module clock_gen_wrapper
   (clk,
    CLK,
    clkout2_buf,
    rst_clk2,
    clk_n_OBUF,
    sysclk,
    Q);
  output clk;
  output CLK;
  output clkout2_buf;
  output rst_clk2;
  output clk_n_OBUF;
  input sysclk;
  input Q;

  wire CLK;
  wire Q;
  wire clk;
  wire clk_en;
  wire clk_n_OBUF;
  wire clkout2_buf;
  wire rst_clk2;
  wire sysclk;
  wire NLW_clock_gen_i_pll_en_UNCONNECTED;
  wire NLW_clock_gen_i_reset_rtl_UNCONNECTED;

  LUT2 #(
    .INIT(4'h7)) 
    clk_n_OBUF_inst_i_1
       (.I0(clkout2_buf),
        .I1(Q),
        .O(clk_n_OBUF));
  (* hw_handoff = "clock_gen.hwdef" *) 
  clock_gen clock_gen_i
       (.clk(clk),
        .clk_en(clk_en),
        .clk_in(sysclk),
        .lopt(clk_en),
        .pixel_clk(CLK),
        .pll_en(NLW_clock_gen_i_pll_en_UNCONNECTED),
        .reset_rtl(NLW_clock_gen_i_reset_rtl_UNCONNECTED),
        .rst_clk2(rst_clk2),
        .tmds_clk(clkout2_buf));
  LUT1 #(
    .INIT(2'h1)) 
    clock_gen_i_i_1
       (.I0(clk_en),
        .O(rst_clk2));
endmodule

module counter
   (\counter_v_reg[27]_0 ,
    \counter_h_reg[8]_0 ,
    \counter_v_reg[27]_1 ,
    \counter_v_reg[27]_2 ,
    \counter_v_reg[27]_3 ,
    \counter_v_reg[27]_4 ,
    rst_IBUF,
    en,
    CLK);
  output \counter_v_reg[27]_0 ;
  output \counter_h_reg[8]_0 ;
  output \counter_v_reg[27]_1 ;
  output \counter_v_reg[27]_2 ;
  output \counter_v_reg[27]_3 ;
  output \counter_v_reg[27]_4 ;
  input rst_IBUF;
  input en;
  input CLK;

  wire CLK;
  wire [30:0]counter_h;
  wire \counter_h[30]_i_10_n_0 ;
  wire \counter_h[30]_i_11_n_0 ;
  wire \counter_h[30]_i_2_n_0 ;
  wire \counter_h[30]_i_3_n_0 ;
  wire \counter_h[30]_i_4_n_0 ;
  wire \counter_h[30]_i_5_n_0 ;
  wire \counter_h[30]_i_6_n_0 ;
  wire \counter_h[30]_i_7_n_0 ;
  wire \counter_h[30]_i_9_n_0 ;
  wire \counter_h_reg[12]_i_2_n_0 ;
  wire \counter_h_reg[16]_i_2_n_0 ;
  wire \counter_h_reg[20]_i_2_n_0 ;
  wire \counter_h_reg[24]_i_2_n_0 ;
  wire \counter_h_reg[28]_i_2_n_0 ;
  wire \counter_h_reg[4]_i_2_n_0 ;
  wire \counter_h_reg[8]_0 ;
  wire \counter_h_reg[8]_i_2_n_0 ;
  wire counter_v;
  wire counter_v0_carry__0_n_0;
  wire counter_v0_carry__0_n_4;
  wire counter_v0_carry__0_n_5;
  wire counter_v0_carry__0_n_6;
  wire counter_v0_carry__0_n_7;
  wire counter_v0_carry__1_n_0;
  wire counter_v0_carry__1_n_4;
  wire counter_v0_carry__1_n_5;
  wire counter_v0_carry__1_n_6;
  wire counter_v0_carry__1_n_7;
  wire counter_v0_carry__2_n_0;
  wire counter_v0_carry__2_n_4;
  wire counter_v0_carry__2_n_5;
  wire counter_v0_carry__2_n_6;
  wire counter_v0_carry__2_n_7;
  wire counter_v0_carry__3_n_0;
  wire counter_v0_carry__3_n_4;
  wire counter_v0_carry__3_n_5;
  wire counter_v0_carry__3_n_6;
  wire counter_v0_carry__3_n_7;
  wire counter_v0_carry__4_n_0;
  wire counter_v0_carry__4_n_4;
  wire counter_v0_carry__4_n_5;
  wire counter_v0_carry__4_n_6;
  wire counter_v0_carry__4_n_7;
  wire counter_v0_carry__5_n_0;
  wire counter_v0_carry__5_n_4;
  wire counter_v0_carry__5_n_5;
  wire counter_v0_carry__5_n_6;
  wire counter_v0_carry__5_n_7;
  wire counter_v0_carry__6_n_6;
  wire counter_v0_carry__6_n_7;
  wire counter_v0_carry_n_0;
  wire counter_v0_carry_n_4;
  wire counter_v0_carry_n_5;
  wire counter_v0_carry_n_6;
  wire counter_v0_carry_n_7;
  wire \counter_v[0]_i_1_n_0 ;
  wire \counter_v[10]_i_1_n_0 ;
  wire \counter_v[11]_i_1_n_0 ;
  wire \counter_v[12]_i_1_n_0 ;
  wire \counter_v[13]_i_1_n_0 ;
  wire \counter_v[14]_i_1_n_0 ;
  wire \counter_v[15]_i_1_n_0 ;
  wire \counter_v[16]_i_1_n_0 ;
  wire \counter_v[17]_i_1_n_0 ;
  wire \counter_v[18]_i_1_n_0 ;
  wire \counter_v[19]_i_1_n_0 ;
  wire \counter_v[1]_i_1_n_0 ;
  wire \counter_v[20]_i_1_n_0 ;
  wire \counter_v[21]_i_1_n_0 ;
  wire \counter_v[22]_i_1_n_0 ;
  wire \counter_v[23]_i_1_n_0 ;
  wire \counter_v[24]_i_1_n_0 ;
  wire \counter_v[25]_i_1_n_0 ;
  wire \counter_v[26]_i_1_n_0 ;
  wire \counter_v[27]_i_1_n_0 ;
  wire \counter_v[28]_i_1_n_0 ;
  wire \counter_v[29]_i_1_n_0 ;
  wire \counter_v[2]_i_1_n_0 ;
  wire \counter_v[30]_i_10_n_0 ;
  wire \counter_v[30]_i_11_n_0 ;
  wire \counter_v[30]_i_12_n_0 ;
  wire \counter_v[30]_i_13_n_0 ;
  wire \counter_v[30]_i_14_n_0 ;
  wire \counter_v[30]_i_2_n_0 ;
  wire \counter_v[30]_i_3_n_0 ;
  wire \counter_v[30]_i_4_n_0 ;
  wire \counter_v[30]_i_5_n_0 ;
  wire \counter_v[30]_i_6_n_0 ;
  wire \counter_v[30]_i_7_n_0 ;
  wire \counter_v[30]_i_8_n_0 ;
  wire \counter_v[30]_i_9_n_0 ;
  wire \counter_v[3]_i_1_n_0 ;
  wire \counter_v[4]_i_1_n_0 ;
  wire \counter_v[5]_i_1_n_0 ;
  wire \counter_v[6]_i_1_n_0 ;
  wire \counter_v[7]_i_1_n_0 ;
  wire \counter_v[8]_i_1_n_0 ;
  wire \counter_v[9]_i_1_n_0 ;
  wire \counter_v_reg[27]_0 ;
  wire \counter_v_reg[27]_1 ;
  wire \counter_v_reg[27]_2 ;
  wire \counter_v_reg[27]_3 ;
  wire \counter_v_reg[27]_4 ;
  wire [30:1]data0;
  wire \dout[2]_i_10_n_0 ;
  wire \dout[2]_i_11_n_0 ;
  wire \dout[2]_i_12_n_0 ;
  wire \dout[2]_i_2_n_0 ;
  wire \dout[2]_i_3_n_0 ;
  wire \dout[2]_i_4_n_0 ;
  wire \dout[2]_i_5_n_0 ;
  wire \dout[2]_i_6_n_0 ;
  wire \dout[2]_i_7_n_0 ;
  wire \dout[2]_i_8_n_0 ;
  wire \dout[2]_i_9_n_0 ;
  wire \dout[8]_i_2_n_0 ;
  wire \dout[9]_i_3_n_0 ;
  wire \dout[9]_i_4_n_0 ;
  wire en;
  wire [30:0]h_idx;
  wire rst_IBUF;
  wire [30:0]v_idx;
  wire [2:0]\NLW_counter_h_reg[12]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_h_reg[16]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_h_reg[20]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_h_reg[24]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_h_reg[28]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_h_reg[30]_i_8_CO_UNCONNECTED ;
  wire [3:2]\NLW_counter_h_reg[30]_i_8_O_UNCONNECTED ;
  wire [2:0]\NLW_counter_h_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_h_reg[8]_i_2_CO_UNCONNECTED ;
  wire [2:0]NLW_counter_v0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_counter_v0_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_counter_v0_carry__1_CO_UNCONNECTED;
  wire [2:0]NLW_counter_v0_carry__2_CO_UNCONNECTED;
  wire [2:0]NLW_counter_v0_carry__3_CO_UNCONNECTED;
  wire [2:0]NLW_counter_v0_carry__4_CO_UNCONNECTED;
  wire [2:0]NLW_counter_v0_carry__5_CO_UNCONNECTED;
  wire [3:0]NLW_counter_v0_carry__6_CO_UNCONNECTED;
  wire [3:2]NLW_counter_v0_carry__6_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \counter_h[0]_i_1 
       (.I0(h_idx[0]),
        .O(counter_h[0]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[10]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[10]),
        .O(counter_h[10]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[11]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[11]),
        .O(counter_h[11]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[12]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[12]),
        .O(counter_h[12]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[13]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[13]),
        .O(counter_h[13]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[14]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[14]),
        .O(counter_h[14]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[15]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[15]),
        .O(counter_h[15]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[16]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[16]),
        .O(counter_h[16]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[17]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[17]),
        .O(counter_h[17]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[18]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[18]),
        .O(counter_h[18]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[19]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[19]),
        .O(counter_h[19]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[1]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[1]),
        .O(counter_h[1]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[20]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[20]),
        .O(counter_h[20]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[21]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[21]),
        .O(counter_h[21]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[22]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[22]),
        .O(counter_h[22]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[23]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[23]),
        .O(counter_h[23]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[24]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[24]),
        .O(counter_h[24]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[25]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[25]),
        .O(counter_h[25]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[26]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[26]),
        .O(counter_h[26]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[27]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[27]),
        .O(counter_h[27]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[28]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[28]),
        .O(counter_h[28]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[29]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[29]),
        .O(counter_h[29]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[2]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[2]),
        .O(counter_h[2]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[30]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[30]),
        .O(counter_h[30]));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \counter_h[30]_i_10 
       (.I0(h_idx[9]),
        .I1(h_idx[25]),
        .I2(h_idx[2]),
        .I3(h_idx[8]),
        .O(\counter_h[30]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \counter_h[30]_i_11 
       (.I0(h_idx[26]),
        .I1(h_idx[27]),
        .O(\counter_h[30]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \counter_h[30]_i_2 
       (.I0(rst_IBUF),
        .I1(en),
        .O(\counter_h[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \counter_h[30]_i_3 
       (.I0(h_idx[15]),
        .I1(h_idx[11]),
        .I2(h_idx[10]),
        .I3(h_idx[14]),
        .I4(h_idx[12]),
        .I5(h_idx[13]),
        .O(\counter_h[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \counter_h[30]_i_4 
       (.I0(\counter_h[30]_i_9_n_0 ),
        .I1(\counter_h[30]_i_10_n_0 ),
        .I2(h_idx[21]),
        .I3(h_idx[20]),
        .I4(h_idx[24]),
        .I5(h_idx[23]),
        .O(\counter_h[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    \counter_h[30]_i_5 
       (.I0(\counter_h[30]_i_11_n_0 ),
        .I1(h_idx[28]),
        .I2(h_idx[30]),
        .I3(h_idx[0]),
        .I4(h_idx[29]),
        .I5(h_idx[1]),
        .O(\counter_h[30]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \counter_h[30]_i_6 
       (.I0(h_idx[3]),
        .I1(h_idx[22]),
        .I2(h_idx[4]),
        .O(\counter_h[30]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \counter_h[30]_i_7 
       (.I0(h_idx[5]),
        .I1(h_idx[6]),
        .I2(h_idx[7]),
        .O(\counter_h[30]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter_h[30]_i_9 
       (.I0(h_idx[16]),
        .I1(h_idx[17]),
        .I2(h_idx[18]),
        .I3(h_idx[19]),
        .O(\counter_h[30]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[3]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[3]),
        .O(counter_h[3]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[4]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[4]),
        .O(counter_h[4]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[5]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[5]),
        .O(counter_h[5]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[6]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[6]),
        .O(counter_h[6]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[7]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[7]),
        .O(counter_h[7]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[8]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[8]),
        .O(counter_h[8]));
  LUT6 #(
    .INIT(64'hFFDFFFFF00000000)) 
    \counter_h[9]_i_1 
       (.I0(\counter_h[30]_i_3_n_0 ),
        .I1(\counter_h[30]_i_4_n_0 ),
        .I2(\counter_h[30]_i_5_n_0 ),
        .I3(\counter_h[30]_i_6_n_0 ),
        .I4(\counter_h[30]_i_7_n_0 ),
        .I5(data0[9]),
        .O(counter_h[9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[0]),
        .Q(h_idx[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[10]),
        .Q(h_idx[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[11]),
        .Q(h_idx[11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[12]),
        .Q(h_idx[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[12]_i_2 
       (.CI(\counter_h_reg[8]_i_2_n_0 ),
        .CO({\counter_h_reg[12]_i_2_n_0 ,\NLW_counter_h_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(h_idx[12:9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[13]),
        .Q(h_idx[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[14]),
        .Q(h_idx[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[15]),
        .Q(h_idx[15]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[16]),
        .Q(h_idx[16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[16]_i_2 
       (.CI(\counter_h_reg[12]_i_2_n_0 ),
        .CO({\counter_h_reg[16]_i_2_n_0 ,\NLW_counter_h_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(h_idx[16:13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[17]),
        .Q(h_idx[17]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[18]),
        .Q(h_idx[18]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[19]),
        .Q(h_idx[19]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[1]),
        .Q(h_idx[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[20]),
        .Q(h_idx[20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[20]_i_2 
       (.CI(\counter_h_reg[16]_i_2_n_0 ),
        .CO({\counter_h_reg[20]_i_2_n_0 ,\NLW_counter_h_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(h_idx[20:17]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[21]),
        .Q(h_idx[21]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[22]),
        .Q(h_idx[22]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[23]),
        .Q(h_idx[23]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[24]),
        .Q(h_idx[24]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[24]_i_2 
       (.CI(\counter_h_reg[20]_i_2_n_0 ),
        .CO({\counter_h_reg[24]_i_2_n_0 ,\NLW_counter_h_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(h_idx[24:21]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[25]),
        .Q(h_idx[25]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[26]),
        .Q(h_idx[26]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[27]),
        .Q(h_idx[27]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[28]),
        .Q(h_idx[28]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[28]_i_2 
       (.CI(\counter_h_reg[24]_i_2_n_0 ),
        .CO({\counter_h_reg[28]_i_2_n_0 ,\NLW_counter_h_reg[28]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S(h_idx[28:25]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[29]),
        .Q(h_idx[29]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[2]),
        .Q(h_idx[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[30]),
        .Q(h_idx[30]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[30]_i_8 
       (.CI(\counter_h_reg[28]_i_2_n_0 ),
        .CO(\NLW_counter_h_reg[30]_i_8_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_h_reg[30]_i_8_O_UNCONNECTED [3:2],data0[30:29]}),
        .S({1'b0,1'b0,h_idx[30:29]}));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[3]),
        .Q(h_idx[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[4]),
        .Q(h_idx[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\counter_h_reg[4]_i_2_n_0 ,\NLW_counter_h_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(h_idx[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(h_idx[4:1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[5]),
        .Q(h_idx[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[6]),
        .Q(h_idx[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[7]),
        .Q(h_idx[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[8]),
        .Q(h_idx[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_h_reg[8]_i_2 
       (.CI(\counter_h_reg[4]_i_2_n_0 ),
        .CO({\counter_h_reg[8]_i_2_n_0 ,\NLW_counter_h_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(h_idx[8:5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_h_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(counter_h[9]),
        .Q(h_idx[9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry
       (.CI(1'b0),
        .CO({counter_v0_carry_n_0,NLW_counter_v0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_idx[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter_v0_carry_n_4,counter_v0_carry_n_5,counter_v0_carry_n_6,counter_v0_carry_n_7}),
        .S(v_idx[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry__0
       (.CI(counter_v0_carry_n_0),
        .CO({counter_v0_carry__0_n_0,NLW_counter_v0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter_v0_carry__0_n_4,counter_v0_carry__0_n_5,counter_v0_carry__0_n_6,counter_v0_carry__0_n_7}),
        .S(v_idx[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry__1
       (.CI(counter_v0_carry__0_n_0),
        .CO({counter_v0_carry__1_n_0,NLW_counter_v0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter_v0_carry__1_n_4,counter_v0_carry__1_n_5,counter_v0_carry__1_n_6,counter_v0_carry__1_n_7}),
        .S(v_idx[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry__2
       (.CI(counter_v0_carry__1_n_0),
        .CO({counter_v0_carry__2_n_0,NLW_counter_v0_carry__2_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter_v0_carry__2_n_4,counter_v0_carry__2_n_5,counter_v0_carry__2_n_6,counter_v0_carry__2_n_7}),
        .S(v_idx[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry__3
       (.CI(counter_v0_carry__2_n_0),
        .CO({counter_v0_carry__3_n_0,NLW_counter_v0_carry__3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter_v0_carry__3_n_4,counter_v0_carry__3_n_5,counter_v0_carry__3_n_6,counter_v0_carry__3_n_7}),
        .S(v_idx[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry__4
       (.CI(counter_v0_carry__3_n_0),
        .CO({counter_v0_carry__4_n_0,NLW_counter_v0_carry__4_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter_v0_carry__4_n_4,counter_v0_carry__4_n_5,counter_v0_carry__4_n_6,counter_v0_carry__4_n_7}),
        .S(v_idx[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry__5
       (.CI(counter_v0_carry__4_n_0),
        .CO({counter_v0_carry__5_n_0,NLW_counter_v0_carry__5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter_v0_carry__5_n_4,counter_v0_carry__5_n_5,counter_v0_carry__5_n_6,counter_v0_carry__5_n_7}),
        .S(v_idx[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter_v0_carry__6
       (.CI(counter_v0_carry__5_n_0),
        .CO(NLW_counter_v0_carry__6_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter_v0_carry__6_O_UNCONNECTED[3:2],counter_v0_carry__6_n_6,counter_v0_carry__6_n_7}),
        .S({1'b0,1'b0,v_idx[30:29]}));
  LUT6 #(
    .INIT(64'h00000000FFFFFFFB)) 
    \counter_v[0]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(v_idx[0]),
        .O(\counter_v[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[10]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__1_n_6),
        .O(\counter_v[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[11]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__1_n_5),
        .O(\counter_v[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[12]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__1_n_4),
        .O(\counter_v[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[13]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__2_n_7),
        .O(\counter_v[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[14]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__2_n_6),
        .O(\counter_v[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[15]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__2_n_5),
        .O(\counter_v[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[16]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__2_n_4),
        .O(\counter_v[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[17]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__3_n_7),
        .O(\counter_v[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[18]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__3_n_6),
        .O(\counter_v[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[19]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__3_n_5),
        .O(\counter_v[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[1]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry_n_7),
        .O(\counter_v[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[20]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__3_n_4),
        .O(\counter_v[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[21]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__4_n_7),
        .O(\counter_v[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[22]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__4_n_6),
        .O(\counter_v[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[23]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__4_n_5),
        .O(\counter_v[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[24]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__4_n_4),
        .O(\counter_v[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[25]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__5_n_7),
        .O(\counter_v[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[26]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__5_n_6),
        .O(\counter_v[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[27]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__5_n_5),
        .O(\counter_v[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[28]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__5_n_4),
        .O(\counter_v[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[29]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__6_n_7),
        .O(\counter_v[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[2]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry_n_6),
        .O(\counter_v[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \counter_v[30]_i_1 
       (.I0(\counter_v[30]_i_3_n_0 ),
        .I1(h_idx[4]),
        .I2(h_idx[22]),
        .I3(h_idx[3]),
        .I4(\counter_h[30]_i_5_n_0 ),
        .I5(\counter_v[30]_i_4_n_0 ),
        .O(counter_v));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \counter_v[30]_i_10 
       (.I0(h_idx[5]),
        .I1(h_idx[15]),
        .I2(h_idx[9]),
        .I3(h_idx[23]),
        .O(\counter_v[30]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \counter_v[30]_i_11 
       (.I0(h_idx[7]),
        .I1(h_idx[6]),
        .O(\counter_v[30]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter_v[30]_i_12 
       (.I0(h_idx[13]),
        .I1(h_idx[12]),
        .I2(h_idx[14]),
        .I3(h_idx[10]),
        .I4(h_idx[11]),
        .O(\counter_v[30]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \counter_v[30]_i_13 
       (.I0(v_idx[0]),
        .I1(v_idx[1]),
        .O(\counter_v[30]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter_v[30]_i_14 
       (.I0(v_idx[21]),
        .I1(v_idx[22]),
        .I2(v_idx[16]),
        .I3(v_idx[17]),
        .O(\counter_v[30]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[30]_i_2 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__6_n_6),
        .O(\counter_v[30]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter_v[30]_i_3 
       (.I0(h_idx[21]),
        .I1(h_idx[20]),
        .I2(h_idx[24]),
        .I3(h_idx[25]),
        .O(\counter_v[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
    \counter_v[30]_i_4 
       (.I0(\counter_h[30]_i_9_n_0 ),
        .I1(\counter_v[30]_i_10_n_0 ),
        .I2(h_idx[8]),
        .I3(h_idx[2]),
        .I4(\counter_v[30]_i_11_n_0 ),
        .I5(\counter_v[30]_i_12_n_0 ),
        .O(\counter_v[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF7FFF)) 
    \counter_v[30]_i_5 
       (.I0(v_idx[9]),
        .I1(v_idx[3]),
        .I2(v_idx[2]),
        .I3(\counter_v[30]_i_13_n_0 ),
        .I4(v_idx[27]),
        .I5(v_idx[26]),
        .O(\counter_v[30]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \counter_v[30]_i_6 
       (.I0(v_idx[8]),
        .I1(v_idx[5]),
        .I2(v_idx[4]),
        .I3(v_idx[7]),
        .I4(v_idx[6]),
        .O(\counter_v[30]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter_v[30]_i_7 
       (.I0(v_idx[28]),
        .I1(v_idx[30]),
        .I2(v_idx[25]),
        .I3(v_idx[24]),
        .I4(v_idx[29]),
        .O(\counter_v[30]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter_v[30]_i_8 
       (.I0(v_idx[23]),
        .I1(v_idx[18]),
        .I2(v_idx[20]),
        .I3(v_idx[19]),
        .I4(\counter_v[30]_i_14_n_0 ),
        .O(\counter_v[30]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \counter_v[30]_i_9 
       (.I0(v_idx[10]),
        .I1(v_idx[11]),
        .I2(v_idx[15]),
        .I3(v_idx[14]),
        .I4(v_idx[13]),
        .I5(v_idx[12]),
        .O(\counter_v[30]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[3]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry_n_5),
        .O(\counter_v[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[4]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry_n_4),
        .O(\counter_v[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[5]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__0_n_7),
        .O(\counter_v[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[6]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__0_n_6),
        .O(\counter_v[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[7]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__0_n_5),
        .O(\counter_v[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[8]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__0_n_4),
        .O(\counter_v[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000000)) 
    \counter_v[9]_i_1 
       (.I0(\counter_v[30]_i_5_n_0 ),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(\counter_v[30]_i_7_n_0 ),
        .I3(\counter_v[30]_i_8_n_0 ),
        .I4(\counter_v[30]_i_9_n_0 ),
        .I5(counter_v0_carry__1_n_7),
        .O(\counter_v[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[0] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[0]_i_1_n_0 ),
        .Q(v_idx[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[10] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[10]_i_1_n_0 ),
        .Q(v_idx[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[11] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[11]_i_1_n_0 ),
        .Q(v_idx[11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[12] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[12]_i_1_n_0 ),
        .Q(v_idx[12]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[13] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[13]_i_1_n_0 ),
        .Q(v_idx[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[14] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[14]_i_1_n_0 ),
        .Q(v_idx[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[15] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[15]_i_1_n_0 ),
        .Q(v_idx[15]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[16] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[16]_i_1_n_0 ),
        .Q(v_idx[16]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[17] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[17]_i_1_n_0 ),
        .Q(v_idx[17]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[18] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[18]_i_1_n_0 ),
        .Q(v_idx[18]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[19] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[19]_i_1_n_0 ),
        .Q(v_idx[19]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[1] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[1]_i_1_n_0 ),
        .Q(v_idx[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[20] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[20]_i_1_n_0 ),
        .Q(v_idx[20]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[21] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[21]_i_1_n_0 ),
        .Q(v_idx[21]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[22] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[22]_i_1_n_0 ),
        .Q(v_idx[22]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[23] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[23]_i_1_n_0 ),
        .Q(v_idx[23]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[24] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[24]_i_1_n_0 ),
        .Q(v_idx[24]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[25] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[25]_i_1_n_0 ),
        .Q(v_idx[25]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[26] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[26]_i_1_n_0 ),
        .Q(v_idx[26]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[27] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[27]_i_1_n_0 ),
        .Q(v_idx[27]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[28] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[28]_i_1_n_0 ),
        .Q(v_idx[28]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[29] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[29]_i_1_n_0 ),
        .Q(v_idx[29]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[2] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[2]_i_1_n_0 ),
        .Q(v_idx[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[30] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[30]_i_2_n_0 ),
        .Q(v_idx[30]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[3] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[3]_i_1_n_0 ),
        .Q(v_idx[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[4] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[4]_i_1_n_0 ),
        .Q(v_idx[4]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[5] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[5]_i_1_n_0 ),
        .Q(v_idx[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[6] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[6]_i_1_n_0 ),
        .Q(v_idx[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[7] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[7]_i_1_n_0 ),
        .Q(v_idx[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[8] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[8]_i_1_n_0 ),
        .Q(v_idx[8]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_v_reg[9] 
       (.C(CLK),
        .CE(counter_v),
        .CLR(\counter_h[30]_i_2_n_0 ),
        .D(\counter_v[9]_i_1_n_0 ),
        .Q(v_idx[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF4)) 
    \dout[2]_i_1 
       (.I0(\dout[2]_i_2_n_0 ),
        .I1(\dout[2]_i_3_n_0 ),
        .I2(\dout[2]_i_4_n_0 ),
        .I3(\dout[2]_i_5_n_0 ),
        .I4(\dout[2]_i_6_n_0 ),
        .I5(\dout[2]_i_7_n_0 ),
        .O(\counter_h_reg[8]_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \dout[2]_i_10 
       (.I0(v_idx[1]),
        .I1(v_idx[0]),
        .I2(v_idx[2]),
        .I3(v_idx[3]),
        .O(\dout[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FF00F8000000)) 
    \dout[2]_i_11 
       (.I0(h_idx[4]),
        .I1(h_idx[5]),
        .I2(h_idx[6]),
        .I3(h_idx[9]),
        .I4(h_idx[7]),
        .I5(h_idx[8]),
        .O(\dout[2]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \dout[2]_i_12 
       (.I0(h_idx[27]),
        .I1(h_idx[26]),
        .I2(h_idx[22]),
        .I3(h_idx[23]),
        .O(\dout[2]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00100000)) 
    \dout[2]_i_1__0 
       (.I0(\dout[2]_i_6_n_0 ),
        .I1(\counter_v[30]_i_9_n_0 ),
        .I2(\counter_v[30]_i_6_n_0 ),
        .I3(\dout[8]_i_2_n_0 ),
        .I4(\counter_h_reg[8]_0 ),
        .O(\counter_v_reg[27]_4 ));
  LUT4 #(
    .INIT(16'hFDFF)) 
    \dout[2]_i_2 
       (.I0(\dout[2]_i_8_n_0 ),
        .I1(h_idx[8]),
        .I2(h_idx[9]),
        .I3(\counter_h[30]_i_3_n_0 ),
        .O(\dout[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0007)) 
    \dout[2]_i_3 
       (.I0(h_idx[5]),
        .I1(h_idx[4]),
        .I2(h_idx[6]),
        .I3(h_idx[7]),
        .O(\dout[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF1055)) 
    \dout[2]_i_4 
       (.I0(\dout[2]_i_9_n_0 ),
        .I1(v_idx[4]),
        .I2(\dout[2]_i_10_n_0 ),
        .I3(v_idx[5]),
        .I4(\dout[2]_i_11_n_0 ),
        .I5(\counter_v[30]_i_9_n_0 ),
        .O(\dout[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA2)) 
    \dout[2]_i_5 
       (.I0(v_idx[9]),
        .I1(\counter_v[30]_i_6_n_0 ),
        .I2(v_idx[1]),
        .I3(v_idx[0]),
        .I4(v_idx[2]),
        .I5(v_idx[3]),
        .O(\dout[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout[2]_i_6 
       (.I0(\counter_v[30]_i_8_n_0 ),
        .I1(v_idx[27]),
        .I2(v_idx[26]),
        .I3(\counter_v[30]_i_7_n_0 ),
        .O(\dout[2]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \dout[2]_i_7 
       (.I0(\dout[2]_i_8_n_0 ),
        .I1(\counter_h[30]_i_3_n_0 ),
        .O(\dout[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \dout[2]_i_8 
       (.I0(h_idx[29]),
        .I1(h_idx[30]),
        .I2(h_idx[28]),
        .I3(\dout[2]_i_12_n_0 ),
        .I4(\counter_v[30]_i_3_n_0 ),
        .I5(\counter_h[30]_i_9_n_0 ),
        .O(\dout[2]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout[2]_i_9 
       (.I0(v_idx[6]),
        .I1(v_idx[7]),
        .I2(v_idx[9]),
        .I3(v_idx[8]),
        .O(\dout[2]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFEF0000)) 
    \dout[3]_i_1 
       (.I0(\dout[2]_i_6_n_0 ),
        .I1(\counter_v[30]_i_9_n_0 ),
        .I2(\counter_v[30]_i_6_n_0 ),
        .I3(\dout[8]_i_2_n_0 ),
        .I4(\counter_h_reg[8]_0 ),
        .O(\counter_v_reg[27]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \dout[6]_i_1 
       (.I0(\dout[2]_i_6_n_0 ),
        .I1(\counter_v[30]_i_9_n_0 ),
        .I2(\counter_v[30]_i_6_n_0 ),
        .I3(\dout[8]_i_2_n_0 ),
        .O(\counter_v_reg[27]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0010FFFF)) 
    \dout[8]_i_1__1 
       (.I0(\dout[2]_i_6_n_0 ),
        .I1(\counter_v[30]_i_9_n_0 ),
        .I2(\counter_v[30]_i_6_n_0 ),
        .I3(\dout[8]_i_2_n_0 ),
        .I4(\counter_h_reg[8]_0 ),
        .O(\counter_v_reg[27]_2 ));
  LUT5 #(
    .INIT(32'hFFF77FFF)) 
    \dout[8]_i_2 
       (.I0(v_idx[3]),
        .I1(v_idx[9]),
        .I2(v_idx[1]),
        .I3(v_idx[0]),
        .I4(v_idx[2]),
        .O(\dout[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEF000000100000)) 
    \dout[9]_i_2 
       (.I0(\dout[2]_i_6_n_0 ),
        .I1(\counter_v[30]_i_9_n_0 ),
        .I2(\counter_v[30]_i_6_n_0 ),
        .I3(\dout[8]_i_2_n_0 ),
        .I4(\counter_h_reg[8]_0 ),
        .I5(\dout[9]_i_3_n_0 ),
        .O(\counter_v_reg[27]_1 ));
  LUT6 #(
    .INIT(64'h55D5FFFFFFFFFFFF)) 
    \dout[9]_i_3 
       (.I0(\dout[9]_i_4_n_0 ),
        .I1(h_idx[9]),
        .I2(h_idx[8]),
        .I3(\counter_h[30]_i_7_n_0 ),
        .I4(\dout[2]_i_8_n_0 ),
        .I5(\counter_h[30]_i_3_n_0 ),
        .O(\dout[9]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hE0A0)) 
    \dout[9]_i_4 
       (.I0(h_idx[8]),
        .I1(h_idx[7]),
        .I2(h_idx[9]),
        .I3(h_idx[6]),
        .O(\dout[9]_i_4_n_0 ));
endmodule

module i2c_communication
   (scl_OBUF,
    sda_OBUF,
    clk,
    rst_IBUF,
    stretch);
  output scl_OBUF;
  output sda_OBUF;
  input clk;
  input rst_IBUF;
  input stretch;

  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_4_n_0 ;
  wire \FSM_onehot_state[2]_i_5_n_0 ;
  wire \FSM_onehot_state[2]_i_6_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire [3:0]busy_cnt;
  wire busy_prev;
  wire busy_prev_reg_n_0;
  wire clk;
  wire counter;
  wire \counter[0]_i_2_n_0 ;
  wire \counter[0]_i_3_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire \counter[0]_i_5_n_0 ;
  wire \counter[0]_i_6_n_0 ;
  wire \counter[12]_i_2_n_0 ;
  wire \counter[12]_i_3_n_0 ;
  wire \counter[12]_i_4_n_0 ;
  wire \counter[12]_i_5_n_0 ;
  wire \counter[16]_i_2_n_0 ;
  wire \counter[16]_i_3_n_0 ;
  wire \counter[16]_i_4_n_0 ;
  wire \counter[16]_i_5_n_0 ;
  wire \counter[20]_i_2_n_0 ;
  wire \counter[4]_i_2_n_0 ;
  wire \counter[4]_i_3_n_0 ;
  wire \counter[4]_i_4_n_0 ;
  wire \counter[4]_i_5_n_0 ;
  wire \counter[8]_i_2_n_0 ;
  wire \counter[8]_i_3_n_0 ;
  wire \counter[8]_i_4_n_0 ;
  wire \counter[8]_i_5_n_0 ;
  wire [20:4]counter_reg;
  wire \counter_reg[0]_i_1_n_0 ;
  wire \counter_reg[0]_i_1_n_4 ;
  wire \counter_reg[0]_i_1_n_5 ;
  wire \counter_reg[0]_i_1_n_6 ;
  wire \counter_reg[0]_i_1_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire ena;
  wire i2c_master_0_n_0;
  wire i2c_master_0_n_1;
  wire i2c_master_0_n_2;
  wire i2c_master_0_n_3;
  wire i2c_master_0_n_5;
  wire i2c_master_0_n_6;
  wire i2c_master_0_n_7;
  wire i2c_master_0_n_8;
  wire i2c_master_0_n_9;
  wire rst_IBUF;
  wire scl_OBUF;
  wire sda_OBUF;
  wire stretch;
  wire [2:0]\NLW_counter_reg[0]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_counter_reg[20]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[8]_i_1_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h0000007F)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(counter_reg[16]),
        .I1(counter_reg[17]),
        .I2(\FSM_onehot_state[2]_i_4_n_0 ),
        .I3(counter_reg[19]),
        .I4(counter_reg[18]),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFD00)) 
    \FSM_onehot_state[2]_i_4 
       (.I0(\FSM_onehot_state[2]_i_5_n_0 ),
        .I1(counter_reg[11]),
        .I2(counter_reg[10]),
        .I3(counter_reg[12]),
        .I4(\FSM_onehot_state[2]_i_6_n_0 ),
        .O(\FSM_onehot_state[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h5555555557FFFFFF)) 
    \FSM_onehot_state[2]_i_5 
       (.I0(counter_reg[9]),
        .I1(counter_reg[5]),
        .I2(counter_reg[4]),
        .I3(counter_reg[7]),
        .I4(counter_reg[6]),
        .I5(counter_reg[8]),
        .O(\FSM_onehot_state[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_onehot_state[2]_i_6 
       (.I0(counter_reg[13]),
        .I1(counter_reg[15]),
        .I2(counter_reg[14]),
        .O(\FSM_onehot_state[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "start:001,read_data:010,output_result:100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(i2c_master_0_n_9),
        .PRE(rst_IBUF),
        .Q(counter));
  (* FSM_ENCODED_STATES = "start:001,read_data:010,output_result:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(i2c_master_0_n_8),
        .Q(busy_prev));
  (* FSM_ENCODED_STATES = "start:001,read_data:010,output_result:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(i2c_master_0_n_7),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \busy_cnt_reg[0] 
       (.C(clk),
        .CE(busy_prev),
        .CLR(rst_IBUF),
        .D(i2c_master_0_n_3),
        .Q(busy_cnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \busy_cnt_reg[1] 
       (.C(clk),
        .CE(busy_prev),
        .CLR(rst_IBUF),
        .D(i2c_master_0_n_2),
        .Q(busy_cnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \busy_cnt_reg[2] 
       (.C(clk),
        .CE(busy_prev),
        .CLR(rst_IBUF),
        .D(i2c_master_0_n_1),
        .Q(busy_cnt[2]));
  FDCE #(
    .INIT(1'b0)) 
    \busy_cnt_reg[3] 
       (.C(clk),
        .CE(busy_prev),
        .CLR(rst_IBUF),
        .D(i2c_master_0_n_0),
        .Q(busy_cnt[3]));
  FDRE #(
    .INIT(1'b0)) 
    busy_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(i2c_master_0_n_5),
        .Q(busy_prev_reg_n_0),
        .R(1'b0));
  (* \PinAttr:I2:HOLD_DETOUR  = "188" *) 
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[0]_i_2 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[0]_i_3 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[3] ),
        .O(\counter[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[0]_i_4 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[2] ),
        .O(\counter[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[0]_i_5 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[1] ),
        .O(\counter[0]_i_5_n_0 ));
  (* \PinAttr:I2:HOLD_DETOUR  = "188" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \counter[0]_i_6 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[12]_i_2 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[15]),
        .O(\counter[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[12]_i_3 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[14]),
        .O(\counter[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[12]_i_4 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[13]),
        .O(\counter[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[12]_i_5 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[12]),
        .O(\counter[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[16]_i_2 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[19]),
        .O(\counter[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[16]_i_3 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[18]),
        .O(\counter[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[16]_i_4 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[17]),
        .O(\counter[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[16]_i_5 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[16]),
        .O(\counter[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter[20]_i_2 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .O(\counter[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[4]_i_2 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[7]),
        .O(\counter[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[4]_i_3 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[6]),
        .O(\counter[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[4]_i_4 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[5]),
        .O(\counter[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[4]_i_5 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[4]),
        .O(\counter[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[8]_i_2 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[11]),
        .O(\counter[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[8]_i_3 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[10]),
        .O(\counter[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[8]_i_4 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[9]),
        .O(\counter[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \counter[8]_i_5 
       (.I0(counter_reg[20]),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(counter_reg[8]),
        .O(\counter[8]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[0]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[0] ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_1_n_0 ,\NLW_counter_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\counter[0]_i_2_n_0 }),
        .O({\counter_reg[0]_i_1_n_4 ,\counter_reg[0]_i_1_n_5 ,\counter_reg[0]_i_1_n_6 ,\counter_reg[0]_i_1_n_7 }),
        .S({\counter[0]_i_3_n_0 ,\counter[0]_i_4_n_0 ,\counter[0]_i_5_n_0 ,\counter[0]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\NLW_counter_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S({\counter[12]_i_2_n_0 ,\counter[12]_i_3_n_0 ,\counter[12]_i_4_n_0 ,\counter[12]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\NLW_counter_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S({\counter[16]_i_2_n_0 ,\counter[16]_i_3_n_0 ,\counter[16]_i_4_n_0 ,\counter[16]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[0]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO(\NLW_counter_reg[20]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[20]_i_1_O_UNCONNECTED [3:1],\counter_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,\counter[20]_i_2_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[0]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[0]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_1_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\NLW_counter_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S({\counter[4]_i_2_n_0 ,\counter[4]_i_3_n_0 ,\counter[4]_i_4_n_0 ,\counter[4]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\NLW_counter_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S({\counter[8]_i_2_n_0 ,\counter[8]_i_3_n_0 ,\counter[8]_i_4_n_0 ,\counter[8]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk),
        .CE(counter),
        .CLR(rst_IBUF),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]));
  FDCE #(
    .INIT(1'b0)) 
    i2c_ena_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(i2c_master_0_n_6),
        .Q(ena));
  i2c_master i2c_master_0
       (.D({i2c_master_0_n_0,i2c_master_0_n_1,i2c_master_0_n_2,i2c_master_0_n_3}),
        .\FSM_onehot_state_reg[1]_0 (i2c_master_0_n_6),
        .\FSM_onehot_state_reg[2]_0 (\FSM_onehot_state[2]_i_2_n_0 ),
        .\FSM_onehot_state_reg[2]_1 (\FSM_onehot_state_reg_n_0_[2] ),
        .Q(busy_cnt),
        .busy_prev(busy_prev),
        .busy_prev_reg(busy_prev_reg_n_0),
        .busy_reg_0(i2c_master_0_n_5),
        .clk(clk),
        .counter(counter),
        .counter_reg(counter_reg[20]),
        .\counter_reg[20] (i2c_master_0_n_7),
        .\counter_reg[20]_0 (i2c_master_0_n_8),
        .\counter_reg[20]_1 (i2c_master_0_n_9),
        .ena(ena),
        .rst_IBUF(rst_IBUF),
        .scl_OBUF(scl_OBUF),
        .sda_OBUF(sda_OBUF),
        .stretch(stretch));
endmodule

module i2c_master
   (D,
    scl_OBUF,
    busy_reg_0,
    \FSM_onehot_state_reg[1]_0 ,
    \counter_reg[20] ,
    \counter_reg[20]_0 ,
    \counter_reg[20]_1 ,
    sda_OBUF,
    clk,
    rst_IBUF,
    ena,
    busy_prev_reg,
    Q,
    stretch,
    busy_prev,
    counter_reg,
    \FSM_onehot_state_reg[2]_0 ,
    counter,
    \FSM_onehot_state_reg[2]_1 );
  output [3:0]D;
  output scl_OBUF;
  output busy_reg_0;
  output \FSM_onehot_state_reg[1]_0 ;
  output \counter_reg[20] ;
  output \counter_reg[20]_0 ;
  output \counter_reg[20]_1 ;
  output sda_OBUF;
  input clk;
  input rst_IBUF;
  input ena;
  input busy_prev_reg;
  input [3:0]Q;
  input stretch;
  input busy_prev;
  input [0:0]counter_reg;
  input \FSM_onehot_state_reg[2]_0 ;
  input counter;
  input \FSM_onehot_state_reg[2]_1 ;

  wire [3:0]D;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_2_n_0 ;
  wire \FSM_onehot_state[5]_i_1_n_0 ;
  wire \FSM_onehot_state[6]_i_2_n_0 ;
  wire \FSM_onehot_state_reg[1]_0 ;
  wire \FSM_onehot_state_reg[2]_0 ;
  wire \FSM_onehot_state_reg[2]_1 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire \FSM_onehot_state_reg_n_0_[6] ;
  wire [3:0]Q;
  wire \bit_cnt[0]_i_1_n_0 ;
  wire \bit_cnt[1]_i_1_n_0 ;
  wire \bit_cnt[2]_i_1_n_0 ;
  wire \bit_cnt_reg_n_0_[0] ;
  wire \bit_cnt_reg_n_0_[1] ;
  wire \bit_cnt_reg_n_0_[2] ;
  wire busy1;
  wire busy_i_1_n_0;
  wire busy_i_2_n_0;
  wire busy_i_3_n_0;
  wire busy_prev;
  wire busy_prev_reg;
  wire busy_reg_0;
  wire clk;
  wire [8:0]count;
  wire \count[0]_i_2_n_0 ;
  wire \count[2]_i_2_n_0 ;
  wire \count[4]_i_2_n_0 ;
  wire \count[5]_i_2_n_0 ;
  wire \count[5]_i_3_n_0 ;
  wire \count[6]_i_2_n_0 ;
  wire \count[7]_i_2_n_0 ;
  wire \count[8]_i_2_n_0 ;
  wire \count[8]_i_3_n_0 ;
  wire \count[8]_i_4_n_0 ;
  wire [8:8]count_0;
  wire [7:0]count__0;
  wire counter;
  wire [0:0]counter_reg;
  wire \counter_reg[20] ;
  wire \counter_reg[20]_0 ;
  wire \counter_reg[20]_1 ;
  wire data_clk_i_1_n_0;
  wire data_clk_i_2_n_0;
  wire data_clk_i_3_n_0;
  wire data_clk_prev;
  wire data_clk_prev_i_1_n_0;
  wire data_clk_reg_n_0;
  wire ena;
  wire i2c_busy;
  wire i2c_ena_i_2_n_0;
  wire i2c_ena_i_3_n_0;
  wire rst_IBUF;
  wire scl_OBUF;
  wire scl_clk_i_1_n_0;
  wire scl_clk_i_2_n_0;
  wire scl_clk_i_3_n_0;
  wire scl_clk_i_4_n_0;
  wire scl_clk_reg_n_0;
  wire scl_ena_i_1_n_0;
  wire scl_ena_reg_n_0;
  wire sda_OBUF;
  wire sda_int_i_1_n_0;
  wire sda_int_i_2_n_0;
  wire sda_int_i_3_n_0;
  wire sda_int_i_4_n_0;
  wire sda_int_i_5_n_0;
  wire sda_int_reg_n_0;
  wire stretch;
  wire stretch_0;
  wire stretch_i_1_n_0;
  wire stretch_i_3_n_0;
  wire stretch_i_4_n_0;
  wire stretch_i_5_n_0;

  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(ena),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000D0D0D0)) 
    \FSM_onehot_state[0]_i_1__0 
       (.I0(counter_reg),
        .I1(\FSM_onehot_state_reg[2]_0 ),
        .I2(counter),
        .I3(busy_prev),
        .I4(\FSM_onehot_state[2]_i_3_n_0 ),
        .I5(\FSM_onehot_state_reg[2]_1 ),
        .O(\counter_reg[20]_1 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(ena),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF020FF20)) 
    \FSM_onehot_state[1]_i_1__0 
       (.I0(counter_reg),
        .I1(\FSM_onehot_state_reg[2]_0 ),
        .I2(counter),
        .I3(busy_prev),
        .I4(\FSM_onehot_state[2]_i_3_n_0 ),
        .I5(\FSM_onehot_state_reg[2]_1 ),
        .O(\counter_reg[20]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hFFFEAAAA)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\bit_cnt_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FF00FF002000)) 
    \FSM_onehot_state[2]_i_1__0 
       (.I0(counter_reg),
        .I1(\FSM_onehot_state_reg[2]_0 ),
        .I2(counter),
        .I3(busy_prev),
        .I4(\FSM_onehot_state[2]_i_3_n_0 ),
        .I5(\FSM_onehot_state_reg[2]_1 ),
        .O(\counter_reg[20] ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(i2c_busy),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\bit_cnt_reg_n_0_[0] ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFFFFF444)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state[4]_i_2_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(ena),
        .I3(\FSM_onehot_state_reg_n_0_[5] ),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \FSM_onehot_state[4]_i_2 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\bit_cnt_reg_n_0_[1] ),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .O(\FSM_onehot_state[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(\bit_cnt_reg_n_0_[0] ),
        .O(\FSM_onehot_state[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_state[6]_i_1 
       (.I0(data_clk_reg_n_0),
        .I1(data_clk_prev),
        .O(busy1));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_state[6]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(ena),
        .O(\FSM_onehot_state[6]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(busy1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(busy1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(busy1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk),
        .CE(busy1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk),
        .CE(busy1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(clk),
        .CE(busy1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[5] ));
  (* FSM_ENCODED_STATES = "ready:0000001,command:0000100,slv_ack1:0001000,mstr_ack:0100000,stop:1000000,start:0000010,rd:0010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(clk),
        .CE(busy1),
        .CLR(rst_IBUF),
        .D(\FSM_onehot_state[6]_i_2_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[6] ));
  LUT5 #(
    .INIT(32'hBBBF4440)) 
    \bit_cnt[0]_i_1 
       (.I0(data_clk_prev),
        .I1(data_clk_reg_n_0),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .I4(\bit_cnt_reg_n_0_[0] ),
        .O(\bit_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFFF10101000)) 
    \bit_cnt[1]_i_1 
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(data_clk_prev),
        .I2(data_clk_reg_n_0),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[4] ),
        .I5(\bit_cnt_reg_n_0_[1] ),
        .O(\bit_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFFF10101000)) 
    \bit_cnt[2]_i_1 
       (.I0(\bit_cnt_reg_n_0_[1] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(busy1),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[4] ),
        .I5(\bit_cnt_reg_n_0_[2] ),
        .O(\bit_cnt[2]_i_1_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[0]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bit_cnt_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[1]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bit_cnt_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\bit_cnt[2]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bit_cnt_reg_n_0_[2] ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \busy_cnt[0]_i_1 
       (.I0(Q[0]),
        .I1(busy_prev_reg),
        .I2(i2c_busy),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hAA6A)) 
    \busy_cnt[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(i2c_busy),
        .I3(busy_prev_reg),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h9AAAAAAA)) 
    \busy_cnt[2]_i_1 
       (.I0(Q[2]),
        .I1(busy_prev_reg),
        .I2(i2c_busy),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hBFFFFFFC40000000)) 
    \busy_cnt[3]_i_1 
       (.I0(busy_prev_reg),
        .I1(i2c_busy),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    busy_i_1
       (.I0(busy_i_2_n_0),
        .I1(data_clk_prev),
        .I2(data_clk_reg_n_0),
        .I3(busy_i_3_n_0),
        .I4(i2c_busy),
        .O(busy_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    busy_i_2
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(ena),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(\FSM_onehot_state_reg_n_0_[3] ),
        .O(busy_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000007)) 
    busy_i_3
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(ena),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_state_reg_n_0_[6] ),
        .O(busy_i_3_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    busy_prev_i_1
       (.I0(i2c_busy),
        .I1(busy_prev),
        .I2(rst_IBUF),
        .I3(busy_prev_reg),
        .O(busy_reg_0));
  FDPE #(
    .INIT(1'b1)) 
    busy_reg
       (.C(clk),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .PRE(rst_IBUF),
        .Q(i2c_busy));
  LUT5 #(
    .INIT(32'hFE0000FF)) 
    \count[0]_i_1 
       (.I0(count[2]),
        .I1(\count[0]_i_2_n_0 ),
        .I2(\count[7]_i_2_n_0 ),
        .I3(stretch_0),
        .I4(count[0]),
        .O(count__0[0]));
  LUT3 #(
    .INIT(8'hEF)) 
    \count[0]_i_2 
       (.I0(count[7]),
        .I1(count[6]),
        .I2(count[8]),
        .O(\count[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hFD0055AA)) 
    \count[1]_i_1 
       (.I0(count[0]),
        .I1(count[2]),
        .I2(\count[2]_i_2_n_0 ),
        .I3(count[1]),
        .I4(stretch_0),
        .O(count__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hF3FF0800)) 
    \count[2]_i_1 
       (.I0(\count[2]_i_2_n_0 ),
        .I1(count[1]),
        .I2(stretch_0),
        .I3(count[0]),
        .I4(count[2]),
        .O(count__0[2]));
  LUT6 #(
    .INIT(64'hFDFFFFFFFFFFFFFF)) 
    \count[2]_i_2 
       (.I0(count[8]),
        .I1(count[6]),
        .I2(count[7]),
        .I3(count[5]),
        .I4(count[3]),
        .I5(count[4]),
        .O(\count[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF2222000F2222)) 
    \count[3]_i_1 
       (.I0(count[1]),
        .I1(\count[6]_i_2_n_0 ),
        .I2(count[4]),
        .I3(count[2]),
        .I4(count[3]),
        .I5(\count[4]_i_2_n_0 ),
        .O(count__0[3]));
  LUT5 #(
    .INIT(32'hFF085508)) 
    \count[4]_i_1 
       (.I0(count[3]),
        .I1(count[1]),
        .I2(\count[6]_i_2_n_0 ),
        .I3(count[4]),
        .I4(\count[4]_i_2_n_0 ),
        .O(count__0[4]));
  LUT6 #(
    .INIT(64'hCFFFC5FFFFFFFFFF)) 
    \count[4]_i_2 
       (.I0(count[5]),
        .I1(stretch_0),
        .I2(count[2]),
        .I3(count[0]),
        .I4(\count[0]_i_2_n_0 ),
        .I5(count[1]),
        .O(\count[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF22220FFF2222)) 
    \count[5]_i_1 
       (.I0(count[1]),
        .I1(\count[5]_i_2_n_0 ),
        .I2(count[4]),
        .I3(count[3]),
        .I4(count[5]),
        .I5(\count[5]_i_3_n_0 ),
        .O(count__0[5]));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \count[5]_i_2 
       (.I0(count[2]),
        .I1(stretch_0),
        .I2(count[0]),
        .I3(count[4]),
        .I4(count[3]),
        .O(\count[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFDF5FDF)) 
    \count[5]_i_3 
       (.I0(count[1]),
        .I1(\count[0]_i_2_n_0 ),
        .I2(count[0]),
        .I3(count[2]),
        .I4(stretch_0),
        .O(\count[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF40000000)) 
    \count[6]_i_1 
       (.I0(\count[6]_i_2_n_0 ),
        .I1(count[5]),
        .I2(count[3]),
        .I3(count[4]),
        .I4(count[1]),
        .I5(count[6]),
        .O(count__0[6]));
  LUT3 #(
    .INIT(8'hDF)) 
    \count[6]_i_2 
       (.I0(count[0]),
        .I1(stretch_0),
        .I2(count[2]),
        .O(\count[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFDFFFFF00200000)) 
    \count[7]_i_1 
       (.I0(count[6]),
        .I1(\count[7]_i_2_n_0 ),
        .I2(count[2]),
        .I3(stretch_0),
        .I4(count[0]),
        .I5(count[7]),
        .O(count__0[7]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \count[7]_i_2 
       (.I0(count[5]),
        .I1(count[3]),
        .I2(count[4]),
        .I3(count[1]),
        .O(\count[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBBBAAAA)) 
    \count[8]_i_1 
       (.I0(\count[8]_i_2_n_0 ),
        .I1(count[0]),
        .I2(count[2]),
        .I3(stretch_0),
        .I4(count[8]),
        .I5(\count[8]_i_3_n_0 ),
        .O(count_0));
  LUT6 #(
    .INIT(64'h55FF55AA03000000)) 
    \count[8]_i_2 
       (.I0(count[2]),
        .I1(\count[6]_i_2_n_0 ),
        .I2(\count[7]_i_2_n_0 ),
        .I3(count[6]),
        .I4(count[7]),
        .I5(count[8]),
        .O(\count[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDFDFFFDF00000000)) 
    \count[8]_i_3 
       (.I0(count[5]),
        .I1(\count[8]_i_4_n_0 ),
        .I2(count[1]),
        .I3(count[2]),
        .I4(count[7]),
        .I5(count[8]),
        .O(\count[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \count[8]_i_4 
       (.I0(count[3]),
        .I1(count[4]),
        .O(\count[8]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[0]),
        .Q(count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[1]),
        .Q(count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[2]),
        .Q(count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[3]),
        .Q(count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[4]),
        .Q(count[4]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[5]),
        .Q(count[5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[6]),
        .Q(count[6]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count__0[7]),
        .Q(count[7]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(count_0),
        .Q(count[8]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    data_clk_i_1
       (.I0(data_clk_i_2_n_0),
        .I1(rst_IBUF),
        .I2(data_clk_reg_n_0),
        .O(data_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'h5555444015154440)) 
    data_clk_i_2
       (.I0(count[8]),
        .I1(count[6]),
        .I2(count[5]),
        .I3(data_clk_i_3_n_0),
        .I4(count[7]),
        .I5(stretch_i_4_n_0),
        .O(data_clk_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFB0000000)) 
    data_clk_i_3
       (.I0(count[0]),
        .I1(stretch_0),
        .I2(count[1]),
        .I3(count[3]),
        .I4(count[2]),
        .I5(count[4]),
        .O(data_clk_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    data_clk_prev_i_1
       (.I0(data_clk_reg_n_0),
        .I1(rst_IBUF),
        .I2(data_clk_prev),
        .O(data_clk_prev_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    data_clk_prev_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_clk_prev_i_1_n_0),
        .Q(data_clk_prev),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    data_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_clk_i_1_n_0),
        .Q(data_clk_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF40)) 
    i2c_ena_i_1
       (.I0(i2c_ena_i_2_n_0),
        .I1(busy_prev),
        .I2(i2c_ena_i_3_n_0),
        .I3(ena),
        .O(\FSM_onehot_state_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA6AAAAAAA)) 
    i2c_ena_i_2
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(i2c_busy),
        .I5(busy_prev_reg),
        .O(i2c_ena_i_2_n_0));
  LUT5 #(
    .INIT(32'h00801101)) 
    i2c_ena_i_3
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(i2c_busy),
        .I3(busy_prev_reg),
        .I4(Q[0]),
        .O(i2c_ena_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    scl_OBUF_inst_i_1
       (.I0(scl_clk_reg_n_0),
        .I1(scl_ena_reg_n_0),
        .O(scl_OBUF));
  LUT4 #(
    .INIT(16'hFE0E)) 
    scl_clk_i_1
       (.I0(scl_clk_i_2_n_0),
        .I1(scl_clk_i_3_n_0),
        .I2(rst_IBUF),
        .I3(scl_clk_reg_n_0),
        .O(scl_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF04AE)) 
    scl_clk_i_2
       (.I0(count[8]),
        .I1(count[7]),
        .I2(\count[5]_i_2_n_0 ),
        .I3(count[0]),
        .I4(scl_clk_i_4_n_0),
        .I5(\count[8]_i_3_n_0 ),
        .O(scl_clk_i_2_n_0));
  LUT6 #(
    .INIT(64'hF4FFF40F44004400)) 
    scl_clk_i_3
       (.I0(count[2]),
        .I1(count[8]),
        .I2(\count[5]_i_2_n_0 ),
        .I3(count[6]),
        .I4(count[5]),
        .I5(count[7]),
        .O(scl_clk_i_3_n_0));
  LUT6 #(
    .INIT(64'h4500000000000000)) 
    scl_clk_i_4
       (.I0(\count[8]_i_4_n_0 ),
        .I1(stretch_0),
        .I2(count[0]),
        .I3(count[1]),
        .I4(count[2]),
        .I5(count[7]),
        .O(scl_clk_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    scl_clk_reg
       (.C(clk),
        .CE(1'b1),
        .D(scl_clk_i_1_n_0),
        .Q(scl_clk_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFF44BF00)) 
    scl_ena_i_1
       (.I0(data_clk_reg_n_0),
        .I1(data_clk_prev),
        .I2(\FSM_onehot_state_reg_n_0_[6] ),
        .I3(scl_ena_reg_n_0),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .O(scl_ena_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    scl_ena_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(scl_ena_i_1_n_0),
        .Q(scl_ena_reg_n_0));
  LUT4 #(
    .INIT(16'hF2CE)) 
    sda_OBUF_inst_i_1
       (.I0(sda_int_reg_n_0),
        .I1(\FSM_onehot_state_reg_n_0_[6] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(data_clk_prev),
        .O(sda_OBUF));
  LUT6 #(
    .INIT(64'hBBBBBABB88888A88)) 
    sda_int_i_1
       (.I0(sda_int_i_2_n_0),
        .I1(sda_int_i_3_n_0),
        .I2(sda_int_i_4_n_0),
        .I3(data_clk_reg_n_0),
        .I4(data_clk_prev),
        .I5(sda_int_reg_n_0),
        .O(sda_int_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFC808FB0A)) 
    sda_int_i_2
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\bit_cnt_reg_n_0_[1] ),
        .I5(sda_int_i_5_n_0),
        .O(sda_int_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    sda_int_i_3
       (.I0(data_clk_prev),
        .I1(data_clk_reg_n_0),
        .I2(\bit_cnt_reg_n_0_[0] ),
        .I3(\bit_cnt_reg_n_0_[1] ),
        .I4(\bit_cnt_reg_n_0_[2] ),
        .I5(\FSM_onehot_state_reg_n_0_[4] ),
        .O(sda_int_i_3_n_0));
  LUT5 #(
    .INIT(32'h00000007)) 
    sda_int_i_4
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(ena),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .O(sda_int_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFF4)) 
    sda_int_i_5
       (.I0(ena),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(sda_int_i_5_n_0));
  FDPE #(
    .INIT(1'b1)) 
    sda_int_reg
       (.C(clk),
        .CE(1'b1),
        .D(sda_int_i_1_n_0),
        .PRE(rst_IBUF),
        .Q(sda_int_reg_n_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'h74)) 
    stretch_i_1
       (.I0(stretch),
        .I1(stretch_i_3_n_0),
        .I2(stretch_0),
        .O(stretch_i_1_n_0));
  LUT6 #(
    .INIT(64'h00BB000000F00000)) 
    stretch_i_3
       (.I0(stretch_i_4_n_0),
        .I1(count[6]),
        .I2(stretch_i_5_n_0),
        .I3(count[8]),
        .I4(count[7]),
        .I5(count[5]),
        .O(stretch_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000077777F77)) 
    stretch_i_4
       (.I0(count[2]),
        .I1(count[3]),
        .I2(count[1]),
        .I3(stretch_0),
        .I4(count[0]),
        .I5(count[4]),
        .O(stretch_i_4_n_0));
  LUT6 #(
    .INIT(64'hEAAAAAAAFFFFFFFF)) 
    stretch_i_5
       (.I0(count[6]),
        .I1(count[2]),
        .I2(count[1]),
        .I3(count[4]),
        .I4(count[3]),
        .I5(\count[5]_i_2_n_0 ),
        .O(stretch_i_5_n_0));
  FDCE #(
    .INIT(1'b0)) 
    stretch_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(stretch_i_1_n_0),
        .Q(stretch_0));
endmodule

(* ECO_CHECKSUM = "d8e0a2d0" *) 
(* NotValidForBitStream *)
module oscilloscope
   (sysclk,
    rst,
    sda,
    scl,
    sw,
    clk_p,
    clk_n,
    dataR_p,
    dataR_n,
    dataG_p,
    dataG_n,
    dataB_p,
    dataB_n);
  input sysclk;
  input rst;
  inout sda;
  inout scl;
  input [3:0]sw;
  output clk_p;
  output clk_n;
  output dataR_p;
  output dataR_n;
  output dataG_p;
  output dataG_n;
  output dataB_p;
  output dataB_n;

  wire clk;
  wire clk_n;
  wire clk_n_OBUF;
  wire clk_p;
  wire clk_p_OBUF;
  wire dataB_n;
  wire dataB_n_OBUF;
  wire dataB_p;
  wire dataG_n;
  wire dataG_n_OBUF;
  wire dataG_p;
  wire dataR_n;
  wire dataR_n_OBUF;
  wire dataR_p;
  wire hdmi_n_3;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire pixel_clk;
  wire rst;
  wire rst_IBUF;
  wire rst_clk2;
  wire scl;
  wire scl_OBUF;
  wire sda;
  wire sda_OBUF;
  (* IBUF_LOW_PWR *) wire sysclk;
  wire tmds_clk;
  wire NLW_hdmi_dataB_p_OBUF_UNCONNECTED;
  wire NLW_hdmi_dataG_p_OBUF_UNCONNECTED;
  wire NLW_hdmi_dataR_p_OBUF_UNCONNECTED;
PULLUP pullup_scl
       (.O(scl));
PULLUP pullup_sda
       (.O(sda));

initial begin
 $sdf_annotate("oscilloscope_tb_full_time_impl.sdf",,,,"tool_control");
end
  clock_gen_wrapper clk_gen
       (.CLK(pixel_clk),
        .Q(hdmi_n_3),
        .clk(clk),
        .clk_n_OBUF(clk_n_OBUF),
        .clkout2_buf(tmds_clk),
        .rst_clk2(rst_clk2),
        .sysclk(sysclk));
  OBUF clk_n_OBUF_inst
       (.I(clk_n_OBUF),
        .O(clk_n));
  OBUF clk_p_OBUF_inst
       (.I(clk_p_OBUF),
        .O(clk_p));
  OBUF dataB_n_OBUF_inst
       (.I(dataB_n_OBUF),
        .O(dataB_n));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF dataB_p_OBUF_inst
       (.I(lopt),
        .O(dataB_p));
  OBUF dataG_n_OBUF_inst
       (.I(dataG_n_OBUF),
        .O(dataG_n));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF dataG_p_OBUF_inst
       (.I(lopt_1),
        .O(dataG_p));
  OBUF dataR_n_OBUF_inst
       (.I(dataR_n_OBUF),
        .O(dataR_n));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF dataR_p_OBUF_inst
       (.I(lopt_2),
        .O(dataR_p));
  video_generator hdmi
       (.CLK(pixel_clk),
        .Q(hdmi_n_3),
        .clk_p_OBUF(clk_p_OBUF),
        .dataB_n_OBUF(dataB_n_OBUF),
        .dataB_p_OBUF(NLW_hdmi_dataB_p_OBUF_UNCONNECTED),
        .dataG_n_OBUF(dataG_n_OBUF),
        .dataG_p_OBUF(NLW_hdmi_dataG_p_OBUF_UNCONNECTED),
        .dataR_n_OBUF(dataR_n_OBUF),
        .dataR_p_OBUF(NLW_hdmi_dataR_p_OBUF_UNCONNECTED),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_2(lopt_2),
        .rst_IBUF(rst_IBUF),
        .rst_clk2(rst_clk2),
        .\send_data.idx_reg[3] (tmds_clk));
  i2c_communication i2c
       (.clk(clk),
        .rst_IBUF(rst_IBUF),
        .scl_OBUF(scl_OBUF),
        .sda_OBUF(sda_OBUF),
        .stretch(scl_OBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  OBUF scl_OBUF_inst
       (.I(scl_OBUF),
        .O(scl));
  OBUF sda_OBUF_inst
       (.I(sda_OBUF),
        .O(sda));
endmodule

module serializer
   (dataB_p_OBUF,
    dataB_n_OBUF,
    \send_data.idx_reg[3]_0 ,
    \send_data.idx_reg[3]_1 ,
    Q,
    D,
    CLK,
    lopt);
  output dataB_p_OBUF;
  output dataB_n_OBUF;
  input \send_data.idx_reg[3]_0 ;
  input \send_data.idx_reg[3]_1 ;
  input Q;
  input [4:0]D;
  input CLK;
  output lopt;

  wire CLK;
  wire [4:0]D;
  wire Q;
  wire \d_tmp_reg_n_0_[2] ;
  wire \d_tmp_reg_n_0_[3] ;
  wire \d_tmp_reg_n_0_[6] ;
  wire \d_tmp_reg_n_0_[8] ;
  wire \d_tmp_reg_n_0_[9] ;
  wire dataB_n_OBUF;
  wire dataB_p_OBUF;
  wire dout_i_1__1_n_0;
  wire dout_i_3_n_0;
  wire dout_i_4__0_n_0;
  wire dout_reg_i_2_n_0;
  wire dout_reg_lopt_replica_1;
  wire [3:0]p_0_in__1;
  wire [3:0]\send_data.idx_reg ;
  wire \send_data.idx_reg[3]_0 ;
  wire \send_data.idx_reg[3]_1 ;

  assign lopt = dout_reg_lopt_replica_1;
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[2] 
       (.C(CLK),
        .CE(Q),
        .D(D[0]),
        .Q(\d_tmp_reg_n_0_[2] ),
        .R(1'b0));
  (* \PinAttr:D:HOLD_DETOUR  = "198" *) 
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[3] 
       (.C(CLK),
        .CE(Q),
        .D(D[1]),
        .Q(\d_tmp_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[6] 
       (.C(CLK),
        .CE(Q),
        .D(D[2]),
        .Q(\d_tmp_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[8] 
       (.C(CLK),
        .CE(Q),
        .D(D[3]),
        .Q(\d_tmp_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[9] 
       (.C(CLK),
        .CE(Q),
        .D(D[4]),
        .Q(\d_tmp_reg_n_0_[9] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    dataB_n_OBUF_inst_i_1
       (.I0(dataB_p_OBUF),
        .O(dataB_n_OBUF));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    dout_i_1__1
       (.I0(\d_tmp_reg_n_0_[9] ),
        .I1(\send_data.idx_reg [0]),
        .I2(\d_tmp_reg_n_0_[8] ),
        .I3(\send_data.idx_reg [3]),
        .I4(dout_reg_i_2_n_0),
        .O(dout_i_1__1_n_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'hAACA)) 
    dout_i_3
       (.I0(\d_tmp_reg_n_0_[3] ),
        .I1(\d_tmp_reg_n_0_[2] ),
        .I2(\send_data.idx_reg [1]),
        .I3(\send_data.idx_reg [0]),
        .O(dout_i_3_n_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    dout_i_4__0
       (.I0(\d_tmp_reg_n_0_[3] ),
        .I1(\d_tmp_reg_n_0_[6] ),
        .I2(\send_data.idx_reg [0]),
        .O(dout_i_4__0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    dout_reg
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_1 ),
        .D(dout_i_1__1_n_0),
        .Q(dataB_p_OBUF));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    dout_reg_i_2
       (.I0(dout_i_3_n_0),
        .I1(dout_i_4__0_n_0),
        .I2(\send_data.idx_reg [2]),
        .O(dout_reg_i_2_n_0));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    dout_reg_lopt_replica
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_1 ),
        .D(dout_i_1__1_n_0),
        .Q(dout_reg_lopt_replica_1));
  LUT1 #(
    .INIT(2'h1)) 
    \send_data.idx[0]_i_1__1 
       (.I0(\send_data.idx_reg [0]),
        .O(p_0_in__1[0]));
  (* \PinAttr:I2:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \send_data.idx[1]_i_1__1 
       (.I0(\send_data.idx_reg [2]),
        .I1(\send_data.idx_reg [3]),
        .I2(\send_data.idx_reg [0]),
        .I3(\send_data.idx_reg [1]),
        .O(p_0_in__1[1]));
  LUT3 #(
    .INIT(8'h6A)) 
    \send_data.idx[2]_i_1__1 
       (.I0(\send_data.idx_reg [2]),
        .I1(\send_data.idx_reg [1]),
        .I2(\send_data.idx_reg [0]),
        .O(p_0_in__1[2]));
  (* \PinAttr:I2:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6C8C)) 
    \send_data.idx[3]_i_1__1 
       (.I0(\send_data.idx_reg [2]),
        .I1(\send_data.idx_reg [3]),
        .I2(\send_data.idx_reg [0]),
        .I3(\send_data.idx_reg [1]),
        .O(p_0_in__1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[0] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_1 ),
        .D(p_0_in__1[0]),
        .Q(\send_data.idx_reg [0]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[1] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_1 ),
        .D(p_0_in__1[1]),
        .Q(\send_data.idx_reg [1]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[2] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_1 ),
        .D(p_0_in__1[2]),
        .Q(\send_data.idx_reg [2]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[3] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_1 ),
        .D(p_0_in__1[3]),
        .Q(\send_data.idx_reg [3]));
endmodule

(* ORIG_REF_NAME = "serializer" *) 
module serializer_2
   (dataG_p_OBUF,
    dataG_n_OBUF,
    \send_data.idx_reg[0]_0 ,
    \send_data.idx_reg[3]_0 ,
    Q,
    D,
    CLK,
    lopt);
  output dataG_p_OBUF;
  output dataG_n_OBUF;
  input \send_data.idx_reg[0]_0 ;
  input \send_data.idx_reg[3]_0 ;
  input Q;
  input [2:0]D;
  input CLK;
  output lopt;

  wire CLK;
  wire [2:0]D;
  wire Q;
  wire \d_tmp_reg_n_0_[2] ;
  wire \d_tmp_reg_n_0_[8] ;
  wire \d_tmp_reg_n_0_[9] ;
  wire dataG_n_OBUF;
  wire dataG_p_OBUF;
  wire dout_i_1_n_0;
  wire dout_i_2__0_n_0;
  wire dout_reg_lopt_replica_1;
  wire [3:0]p_0_in__0;
  wire [3:0]\send_data.idx_reg ;
  wire \send_data.idx_reg[0]_0 ;
  wire \send_data.idx_reg[3]_0 ;

  assign lopt = dout_reg_lopt_replica_1;
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[2] 
       (.C(CLK),
        .CE(Q),
        .D(D[0]),
        .Q(\d_tmp_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[8] 
       (.C(CLK),
        .CE(Q),
        .D(D[1]),
        .Q(\d_tmp_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[9] 
       (.C(CLK),
        .CE(Q),
        .D(D[2]),
        .Q(\d_tmp_reg_n_0_[9] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    dataG_n_OBUF_inst_i_1
       (.I0(dataG_p_OBUF),
        .O(dataG_n_OBUF));
  LUT6 #(
    .INIT(64'hF0FFF00088888888)) 
    dout_i_1
       (.I0(\d_tmp_reg_n_0_[2] ),
        .I1(dout_i_2__0_n_0),
        .I2(\d_tmp_reg_n_0_[9] ),
        .I3(\send_data.idx_reg [0]),
        .I4(\d_tmp_reg_n_0_[8] ),
        .I5(\send_data.idx_reg [3]),
        .O(dout_i_1_n_0));
  (* \PinAttr:I1:HOLD_DETOUR  = "190" *) 
  LUT3 #(
    .INIT(8'h54)) 
    dout_i_2__0
       (.I0(\send_data.idx_reg [0]),
        .I1(\send_data.idx_reg [2]),
        .I2(\send_data.idx_reg [1]),
        .O(dout_i_2__0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    dout_reg
       (.C(\send_data.idx_reg[0]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_0 ),
        .D(dout_i_1_n_0),
        .Q(dataG_p_OBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    dout_reg_lopt_replica
       (.C(\send_data.idx_reg[0]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_0 ),
        .D(dout_i_1_n_0),
        .Q(dout_reg_lopt_replica_1));
  LUT1 #(
    .INIT(2'h1)) 
    \send_data.idx[0]_i_1__0 
       (.I0(\send_data.idx_reg [0]),
        .O(p_0_in__0[0]));
  (* \PinAttr:I3:HOLD_DETOUR  = "190" *) 
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h5A52)) 
    \send_data.idx[1]_i_1__0 
       (.I0(\send_data.idx_reg [0]),
        .I1(\send_data.idx_reg [3]),
        .I2(\send_data.idx_reg [1]),
        .I3(\send_data.idx_reg [2]),
        .O(p_0_in__0[1]));
  (* \PinAttr:I0:HOLD_DETOUR  = "190" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \send_data.idx[2]_i_1__0 
       (.I0(\send_data.idx_reg [2]),
        .I1(\send_data.idx_reg [1]),
        .I2(\send_data.idx_reg [0]),
        .O(p_0_in__0[2]));
  (* \PinAttr:I3:HOLD_DETOUR  = "190" *) 
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h6CC4)) 
    \send_data.idx[3]_i_1__0 
       (.I0(\send_data.idx_reg [0]),
        .I1(\send_data.idx_reg [3]),
        .I2(\send_data.idx_reg [1]),
        .I3(\send_data.idx_reg [2]),
        .O(p_0_in__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[0] 
       (.C(\send_data.idx_reg[0]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_0 ),
        .D(p_0_in__0[0]),
        .Q(\send_data.idx_reg [0]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[1] 
       (.C(\send_data.idx_reg[0]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_0 ),
        .D(p_0_in__0[1]),
        .Q(\send_data.idx_reg [1]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[2] 
       (.C(\send_data.idx_reg[0]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_0 ),
        .D(p_0_in__0[2]),
        .Q(\send_data.idx_reg [2]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[3] 
       (.C(\send_data.idx_reg[0]_0 ),
        .CE(1'b1),
        .CLR(\send_data.idx_reg[3]_0 ),
        .D(p_0_in__0[3]),
        .Q(\send_data.idx_reg [3]));
endmodule

(* ORIG_REF_NAME = "serializer" *) 
module serializer_3
   (dataR_p_OBUF,
    serial_en_reg,
    dataR_n_OBUF,
    \send_data.idx_reg[3]_0 ,
    rst_IBUF,
    Q,
    D,
    CLK,
    lopt);
  output dataR_p_OBUF;
  output serial_en_reg;
  output dataR_n_OBUF;
  input \send_data.idx_reg[3]_0 ;
  input rst_IBUF;
  input Q;
  input [2:0]D;
  input CLK;
  output lopt;

  wire CLK;
  wire [2:0]D;
  wire Q;
  wire [9:2]d_tmp;
  wire dataR_n_OBUF;
  wire dataR_p_OBUF;
  wire dout_i_1__0_n_0;
  wire dout_i_4_n_0;
  wire dout_i_5_n_0;
  wire dout_reg_i_3_n_0;
  wire dout_reg_lopt_replica_1;
  wire [3:0]p_0_in;
  wire rst_IBUF;
  wire [3:0]\send_data.idx_reg ;
  wire \send_data.idx_reg[3]_0 ;
  wire serial_en_reg;

  assign lopt = dout_reg_lopt_replica_1;
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[2] 
       (.C(CLK),
        .CE(Q),
        .D(D[0]),
        .Q(d_tmp[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[8] 
       (.C(CLK),
        .CE(Q),
        .D(D[1]),
        .Q(d_tmp[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_tmp_reg[9] 
       (.C(CLK),
        .CE(Q),
        .D(D[2]),
        .Q(d_tmp[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    dataR_n_OBUF_inst_i_1
       (.I0(dataR_p_OBUF),
        .O(dataR_n_OBUF));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    dout_i_1__0
       (.I0(d_tmp[9]),
        .I1(\send_data.idx_reg [0]),
        .I2(d_tmp[8]),
        .I3(\send_data.idx_reg [3]),
        .I4(dout_reg_i_3_n_0),
        .O(dout_i_1__0_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    dout_i_2
       (.I0(rst_IBUF),
        .I1(Q),
        .O(serial_en_reg));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'h08)) 
    dout_i_4
       (.I0(d_tmp[2]),
        .I1(\send_data.idx_reg [1]),
        .I2(\send_data.idx_reg [0]),
        .O(dout_i_4_n_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT2 #(
    .INIT(4'h2)) 
    dout_i_5
       (.I0(d_tmp[2]),
        .I1(\send_data.idx_reg [0]),
        .O(dout_i_5_n_0));
  FDCE #(
    .INIT(1'b0)) 
    dout_reg
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(serial_en_reg),
        .D(dout_i_1__0_n_0),
        .Q(dataR_p_OBUF));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    dout_reg_i_3
       (.I0(dout_i_4_n_0),
        .I1(dout_i_5_n_0),
        .I2(\send_data.idx_reg [2]),
        .O(dout_reg_i_3_n_0));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    dout_reg_lopt_replica
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(serial_en_reg),
        .D(dout_i_1__0_n_0),
        .Q(dout_reg_lopt_replica_1));
  LUT1 #(
    .INIT(2'h1)) 
    \send_data.idx[0]_i_1 
       (.I0(\send_data.idx_reg [0]),
        .O(p_0_in[0]));
  (* \PinAttr:I0:HOLD_DETOUR  = "155" *) 
  (* \PinAttr:I3:HOLD_DETOUR  = "190" *) 
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \send_data.idx[1]_i_1 
       (.I0(\send_data.idx_reg [2]),
        .I1(\send_data.idx_reg [3]),
        .I2(\send_data.idx_reg [0]),
        .I3(\send_data.idx_reg [1]),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h6A)) 
    \send_data.idx[2]_i_1 
       (.I0(\send_data.idx_reg [2]),
        .I1(\send_data.idx_reg [1]),
        .I2(\send_data.idx_reg [0]),
        .O(p_0_in[2]));
  (* \PinAttr:I0:HOLD_DETOUR  = "155" *) 
  (* \PinAttr:I3:HOLD_DETOUR  = "190" *) 
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h6C8C)) 
    \send_data.idx[3]_i_1 
       (.I0(\send_data.idx_reg [2]),
        .I1(\send_data.idx_reg [3]),
        .I2(\send_data.idx_reg [0]),
        .I3(\send_data.idx_reg [1]),
        .O(p_0_in[3]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[0] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(serial_en_reg),
        .D(p_0_in[0]),
        .Q(\send_data.idx_reg [0]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[1] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(serial_en_reg),
        .D(p_0_in[1]),
        .Q(\send_data.idx_reg [1]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[2] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(serial_en_reg),
        .D(p_0_in[2]),
        .Q(\send_data.idx_reg [2]));
  FDCE #(
    .INIT(1'b0)) 
    \send_data.idx_reg[3] 
       (.C(\send_data.idx_reg[3]_0 ),
        .CE(1'b1),
        .CLR(serial_en_reg),
        .D(p_0_in[3]),
        .Q(\send_data.idx_reg [3]));
endmodule

module tmds_encoder
   (D,
    en,
    \dout_reg[8]_0 ,
    CLK,
    \dout_reg[6]_0 ,
    \dout_reg[3]_0 ,
    \dout_reg[2]_0 ,
    \dout_reg[9]_0 ,
    \count_reg[1]_0 );
  output [4:0]D;
  input en;
  input \dout_reg[8]_0 ;
  input CLK;
  input \dout_reg[6]_0 ;
  input \dout_reg[3]_0 ;
  input \dout_reg[2]_0 ;
  input \dout_reg[9]_0 ;
  input \count_reg[1]_0 ;

  wire CLK;
  wire [4:0]D;
  wire \count[1]_i_1__0_n_0 ;
  wire \count[2]_i_1__0_n_0 ;
  wire \count[3]_i_1__0_n_0 ;
  wire \count[3]_i_2_n_0 ;
  wire \count_reg[1]_0 ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \dout[9]_i_1__1_n_0 ;
  wire \dout_reg[2]_0 ;
  wire \dout_reg[3]_0 ;
  wire \dout_reg[6]_0 ;
  wire \dout_reg[8]_0 ;
  wire \dout_reg[9]_0 ;
  wire en;

  LUT3 #(
    .INIT(8'h14)) 
    \count[1]_i_1__0 
       (.I0(\count_reg[1]_0 ),
        .I1(\count[3]_i_2_n_0 ),
        .I2(\count_reg_n_0_[1] ),
        .O(\count[1]_i_1__0_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h4151)) 
    \count[2]_i_1__0 
       (.I0(\count_reg[1]_0 ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count[3]_i_2_n_0 ),
        .I3(\count_reg_n_0_[1] ),
        .O(\count[2]_i_1__0_n_0 ));
  (* \PinAttr:I2:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h11141414)) 
    \count[3]_i_1__0 
       (.I0(\count_reg[1]_0 ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[2] ),
        .I3(\count_reg_n_0_[1] ),
        .I4(\count[3]_i_2_n_0 ),
        .O(\count[3]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \count[3]_i_2 
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[1] ),
        .O(\count[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(en),
        .D(\count[1]_i_1__0_n_0 ),
        .Q(\count_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(en),
        .D(\count[2]_i_1__0_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(en),
        .D(\count[3]_i_1__0_n_0 ),
        .Q(\count_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hCACACA0A)) 
    \dout[9]_i_1__1 
       (.I0(D[4]),
        .I1(\dout_reg[9]_0 ),
        .I2(en),
        .I3(\count_reg[1]_0 ),
        .I4(\count[3]_i_2_n_0 ),
        .O(\dout[9]_i_1__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[2] 
       (.C(CLK),
        .CE(en),
        .D(\dout_reg[2]_0 ),
        .Q(D[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[3] 
       (.C(CLK),
        .CE(en),
        .D(\dout_reg[3]_0 ),
        .Q(D[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[6] 
       (.C(CLK),
        .CE(en),
        .D(\dout_reg[6]_0 ),
        .Q(D[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[8] 
       (.C(CLK),
        .CE(en),
        .D(\dout_reg[8]_0 ),
        .Q(D[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout[9]_i_1__1_n_0 ),
        .Q(D[4]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "tmds_encoder" *) 
module tmds_encoder_0
   (D,
    en,
    \dout_reg[2]_0 ,
    CLK);
  output [2:0]D;
  input en;
  input \dout_reg[2]_0 ;
  input CLK;

  wire CLK;
  wire [2:0]D;
  wire \dout[8]_i_1__0_n_0 ;
  wire \dout[9]_i_1__0_n_0 ;
  wire \dout_reg[2]_0 ;
  wire en;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \dout[8]_i_1__0 
       (.I0(D[1]),
        .I1(en),
        .O(\dout[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dout[9]_i_1__0 
       (.I0(D[2]),
        .I1(en),
        .I2(\dout_reg[2]_0 ),
        .O(\dout[9]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[2] 
       (.C(CLK),
        .CE(en),
        .D(\dout_reg[2]_0 ),
        .Q(D[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout[8]_i_1__0_n_0 ),
        .Q(D[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout[9]_i_1__0_n_0 ),
        .Q(D[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "tmds_encoder" *) 
module tmds_encoder_1
   (D,
    en,
    \dout_reg[2]_0 ,
    CLK);
  output [2:0]D;
  input en;
  input \dout_reg[2]_0 ;
  input CLK;

  wire CLK;
  wire [2:0]D;
  wire \dout[8]_i_1_n_0 ;
  wire \dout[9]_i_1_n_0 ;
  wire \dout_reg[2]_0 ;
  wire en;

  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \dout[8]_i_1 
       (.I0(D[1]),
        .I1(en),
        .O(\dout[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \dout[9]_i_1 
       (.I0(D[2]),
        .I1(en),
        .I2(\dout_reg[2]_0 ),
        .O(\dout[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[2] 
       (.C(CLK),
        .CE(en),
        .D(\dout_reg[2]_0 ),
        .Q(D[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout[8]_i_1_n_0 ),
        .Q(D[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout[9]_i_1_n_0 ),
        .Q(D[2]),
        .R(1'b0));
endmodule

module video_generator
   (dataR_p_OBUF,
    dataG_p_OBUF,
    dataB_p_OBUF,
    Q,
    clk_p_OBUF,
    dataR_n_OBUF,
    dataG_n_OBUF,
    dataB_n_OBUF,
    CLK,
    rst_clk2,
    \send_data.idx_reg[3] ,
    rst_IBUF,
    lopt,
    lopt_1,
    lopt_2);
  output dataR_p_OBUF;
  output dataG_p_OBUF;
  output dataB_p_OBUF;
  output Q;
  output clk_p_OBUF;
  output dataR_n_OBUF;
  output dataG_n_OBUF;
  output dataB_n_OBUF;
  input CLK;
  input rst_clk2;
  input \send_data.idx_reg[3] ;
  input rst_IBUF;
  output lopt;
  output lopt_1;
  output lopt_2;

  wire CLK;
  wire Q;
  wire clk_p_OBUF;
  wire cnt_n_0;
  wire cnt_n_1;
  wire cnt_n_2;
  wire cnt_n_3;
  wire cnt_n_4;
  wire cnt_n_5;
  wire dataB_n_OBUF;
  wire dataB_p_OBUF;
  wire dataG_n_OBUF;
  wire dataG_p_OBUF;
  wire dataR_n_OBUF;
  wire dataR_p_OBUF;
  wire [9:2]dout;
  wire en;
  wire enc_b_n_0;
  wire enc_b_n_1;
  wire enc_b_n_2;
  wire enc_b_n_3;
  wire enc_b_n_4;
  wire enc_g_n_0;
  wire enc_g_n_1;
  wire enc_g_n_2;
  wire lopt;
  wire lopt_1;
  wire lopt_2;
  wire rst_IBUF;
  wire rst_clk2;
  wire \send_data.idx_reg[3] ;
  wire serial_en_i_1_n_0;
  wire serial_r_n_1;

  LUT2 #(
    .INIT(4'h8)) 
    clk_p_OBUF_inst_i_1
       (.I0(Q),
        .I1(\send_data.idx_reg[3] ),
        .O(clk_p_OBUF));
  counter cnt
       (.CLK(CLK),
        .\counter_h_reg[8]_0 (cnt_n_1),
        .\counter_v_reg[27]_0 (cnt_n_0),
        .\counter_v_reg[27]_1 (cnt_n_2),
        .\counter_v_reg[27]_2 (cnt_n_3),
        .\counter_v_reg[27]_3 (cnt_n_4),
        .\counter_v_reg[27]_4 (cnt_n_5),
        .en(en),
        .rst_IBUF(rst_IBUF));
  tmds_encoder enc_b
       (.CLK(CLK),
        .D({enc_b_n_0,enc_b_n_1,enc_b_n_2,enc_b_n_3,enc_b_n_4}),
        .\count_reg[1]_0 (cnt_n_1),
        .\dout_reg[2]_0 (cnt_n_5),
        .\dout_reg[3]_0 (cnt_n_4),
        .\dout_reg[6]_0 (cnt_n_0),
        .\dout_reg[8]_0 (cnt_n_3),
        .\dout_reg[9]_0 (cnt_n_2),
        .en(en));
  tmds_encoder_0 enc_g
       (.CLK(CLK),
        .D({enc_g_n_0,enc_g_n_1,enc_g_n_2}),
        .\dout_reg[2]_0 (cnt_n_1),
        .en(en));
  tmds_encoder_1 enc_r
       (.CLK(CLK),
        .D({dout[9:8],dout[2]}),
        .\dout_reg[2]_0 (cnt_n_1),
        .en(en));
  FDCE #(
    .INIT(1'b0)) 
    encoder_en_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_clk2),
        .D(1'b1),
        .Q(en));
  serializer serial_b
       (.CLK(CLK),
        .D({enc_b_n_0,enc_b_n_1,enc_b_n_2,enc_b_n_3,enc_b_n_4}),
        .Q(Q),
        .dataB_n_OBUF(dataB_n_OBUF),
        .dataB_p_OBUF(dataB_p_OBUF),
        .lopt(lopt),
        .\send_data.idx_reg[3]_0 (\send_data.idx_reg[3] ),
        .\send_data.idx_reg[3]_1 (serial_r_n_1));
  LUT1 #(
    .INIT(2'h1)) 
    serial_en_i_1
       (.I0(en),
        .O(serial_en_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    serial_en_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(serial_en_i_1_n_0),
        .D(1'b1),
        .Q(Q));
  serializer_2 serial_g
       (.CLK(CLK),
        .D({enc_g_n_0,enc_g_n_1,enc_g_n_2}),
        .Q(Q),
        .dataG_n_OBUF(dataG_n_OBUF),
        .dataG_p_OBUF(dataG_p_OBUF),
        .lopt(lopt_1),
        .\send_data.idx_reg[0]_0 (\send_data.idx_reg[3] ),
        .\send_data.idx_reg[3]_0 (serial_r_n_1));
  serializer_3 serial_r
       (.CLK(CLK),
        .D({dout[9:8],dout[2]}),
        .Q(Q),
        .dataR_n_OBUF(dataR_n_OBUF),
        .dataR_p_OBUF(dataR_p_OBUF),
        .lopt(lopt_2),
        .rst_IBUF(rst_IBUF),
        .\send_data.idx_reg[3]_0 (\send_data.idx_reg[3] ),
        .serial_en_reg(serial_r_n_1));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
