-- $Id: opb_v20_wrap.vhd,v 1.1.2.1 2009/10/06 21:15:01 gburch Exp $
-------------------------------------------------------------------------------
--
-- *************************************************************************
-- **                                                                     **
-- ** DISCLAIMER OF LIABILITY                                             **
-- **                                                                     **
-- ** This text/file contains proprietary, confidential                   **
-- ** information of Xilinx, Inc., is distributed under                   **
-- ** license from Xilinx, Inc., and may be used, copied                  **
-- ** and/or disclosed only pursuant to the terms of a valid              **
-- ** license agreement with Xilinx, Inc. Xilinx hereby                   **
-- ** grants you a license to use this text/file solely for               **
-- ** design, simulation, implementation and creation of                  **
-- ** design files limited to Xilinx devices or technologies.             **
-- ** Use with non-Xilinx devices or technologies is expressly            **
-- ** prohibited and immediately terminates your license unless           **
-- ** covered by a separate agreement.                                    **
-- **                                                                     **
-- ** Xilinx is providing this design, code, or information               **
-- ** "as-is" solely for use in developing programs and                   **
-- ** solutions for Xilinx devices, with no obligation on the             **
-- ** part of Xilinx to provide support. By providing this design,        **
-- ** code, or information as one possible implementation of              **
-- ** this feature, application or standard, Xilinx is making no          **
-- ** representation that this implementation is free from any            **
-- ** claims of infringement. You are responsible for obtaining           **
-- ** any rights you may require for your implementation.                 **
-- ** Xilinx expressly disclaims any warranty whatsoever with             **
-- ** respect to the adequacy of the implementation, including            **
-- ** but not limited to any warranties or representations that this      **
-- ** implementation is free from claims of infringement, implied         **
-- ** warranties of merchantability or fitness for a particular           **
-- ** purpose.                                                            **
-- **                                                                     **
-- ** Xilinx products are not intended for use in life support            **
-- ** appliances, devices, or systems. Use in such applications is        **
-- ** expressly prohibited.                                               **
-- **                                                                     **
-- ** Any modifications that are made to the Source Code are              **
-- ** done at the user�s sole risk and will be unsupported.               **
-- ** The Xilinx Support Hotline does not have access to source           **
-- ** code and therefore cannot answer specific questions related         **
-- ** to source HDL. The Xilinx Hotline support of original source        **
-- ** code IP shall only address issues and questions related             **
-- ** to the standard Netlist version of the core (and thus               **
-- ** indirectly, the original core source).                              **
-- **                                                                     **
-- ** Copyright (c) 2003,2009 Xilinx, Inc. All rights reserved.           **
-- **                                                                     **
-- ** This copyright and support notice must be retained as part          **
-- ** of this text at all times.                                          **
-- **                                                                     **
-- *************************************************************************
--
-------------------------------------------------------------------------------
-- opb_v20_wrap.vhd
--   Generated by wrapgen, v1.01j Sep 22,2004 4:16:33
--
--  GAB         10/05/09
-- ^^^^^^
--  Moved all helper libraries proc_common_v2_00_a, opb_ipif_v3_01_a, and
--  opb_arbiter_v1_02_e locally into opb_v20_v1_10_d
--
--  Updated legal header
-- ~~~~~~

library ieee;

use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
-- entity
-------------------------------------------------------------------------------

entity opb_v20_wrap is
  generic
  (
    C_OPB_AWIDTH     : integer          := 32;
    C_OPB_DWIDTH     : integer          := 32;
    C_NUM_MASTERS    : integer          := 1;
    C_NUM_SLAVES     : integer          := 16;
    C_USE_LUT_OR     : integer          := 1;
    C_EXT_RESET_HIGH : integer          := 1;
    C_BASEADDR       : std_logic_vector := X"10000000";
    C_HIGHADDR       : std_logic_vector := X"100001FF";
    C_DYNAM_PRIORITY : integer          := 1;
    C_PARK           : integer          := 1;
    C_PROC_INTRFCE   : integer          := 1;
    C_REG_GRANTS     : integer          := 1;
    C_DEV_BLK_ID     : integer          := 0;
    C_DEV_MIR_ENABLE : integer          := 0
  );
  port
  (
    SYS_Rst        : in  std_logic;
    Debug_SYS_Rst  : in  std_logic;
    WDT_Rst        : in  std_logic;
    OPB_Clk        : in  std_logic;
    OPB_Rst        : out std_logic;
    M_ABus         : in  std_logic_vector(0 to C_OPB_AWIDTH*C_NUM_MASTERS-1)       := (others => '0');
    M_BE           : in  std_logic_vector(0 to (C_OPB_DWIDTH+7)/8*C_NUM_MASTERS-1) := (others => '0');
    M_beXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_busLock      : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_DBus         : in  std_logic_vector(0 to C_OPB_DWIDTH*C_NUM_MASTERS-1)       := (others => '0');
    M_DBusEn       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '1');
    M_DBusEn32_63  : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '1');
    M_dwXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_fwXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_hwXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_request      : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_RNW          : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_select       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    M_seqAddr      : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
    Sl_beAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    Sl_DBus        : in  std_logic_vector(0 to C_OPB_DWIDTH* C_NUM_SLAVES-1)       := (others => '0');
    Sl_DBusEn      : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '1');
    Sl_DBusEn32_63 : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '1');
    Sl_errAck      : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    Sl_dwAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    Sl_fwAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    Sl_hwAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    Sl_retry       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    Sl_toutSup     : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    Sl_xferAck     : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
    OPB_MRequest   : out std_logic_vector(0 to C_NUM_MASTERS-1);
    OPB_ABus       : out std_logic_vector(0 to C_OPB_AWIDTH-1);
    OPB_BE         : out std_logic_vector(0 to (C_OPB_DWIDTH+7)/8-1);
    OPB_beXfer     : out std_logic;
    OPB_beAck      : out std_logic;
    OPB_busLock    : out std_logic;
    OPB_rdDBus     : out std_logic_vector(0 to C_OPB_DWIDTH-1);
    OPB_wrDBus     : out std_logic_vector(0 to C_OPB_DWIDTH-1);
    OPB_DBus       : out std_logic_vector(0 to C_OPB_DWIDTH-1);
    OPB_errAck     : out std_logic;
    OPB_dwAck      : out std_logic;
    OPB_dwXfer     : out std_logic;
    OPB_fwAck      : out std_logic;
    OPB_fwXfer     : out std_logic;
    OPB_hwAck      : out std_logic;
    OPB_hwXfer     : out std_logic;
    OPB_MGrant     : out std_logic_vector(0 to C_NUM_MASTERS-1);
    OPB_pendReq    : out std_logic_vector(0 to C_NUM_MASTERS-1);
    OPB_retry      : out std_logic;
    OPB_RNW        : out std_logic;
    OPB_select     : out std_logic;
    OPB_seqAddr    : out std_logic;
    OPB_timeout    : out std_logic;
    OPB_toutSup    : out std_logic;
    OPB_xferAck    : out std_logic
  );
end entity opb_v20_wrap;

-------------------------------------------------------------------------------
-- architecture
-------------------------------------------------------------------------------

architecture imp of opb_v20_wrap is

  component opb_v20 is
    generic
    (
      C_OPB_AWIDTH     : integer          := 32;
      C_OPB_DWIDTH     : integer          := 32;
      C_NUM_MASTERS    : integer          := 1;
      C_NUM_SLAVES     : integer          := 16;
      C_USE_LUT_OR     : integer          := 1;
      C_EXT_RESET_HIGH : integer          := 1;
      C_BASEADDR       : std_logic_vector := X"10000000";
      C_HIGHADDR       : std_logic_vector := X"100001FF";
      C_DYNAM_PRIORITY : integer          := 1;
      C_PARK           : integer          := 1;
      C_PROC_INTRFCE   : integer          := 1;
      C_REG_GRANTS     : integer          := 1;
      C_DEV_BLK_ID     : integer          := 0;
      C_DEV_MIR_ENABLE : integer          := 0
    );
    port
    (
      SYS_Rst        : in  std_logic;
      Debug_SYS_Rst  : in  std_logic;
      WDT_Rst        : in  std_logic;
      OPB_Clk        : in  std_logic;
      OPB_Rst        : out std_logic;
      M_ABus         : in  std_logic_vector(0 to C_OPB_AWIDTH*C_NUM_MASTERS-1)       := (others => '0');
      M_BE           : in  std_logic_vector(0 to (C_OPB_DWIDTH+7)/8*C_NUM_MASTERS-1) := (others => '0');
      M_beXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_busLock      : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_DBus         : in  std_logic_vector(0 to C_OPB_DWIDTH*C_NUM_MASTERS-1)       := (others => '0');
      M_DBusEn       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '1');
      M_DBusEn32_63  : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '1');
      M_dwXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_fwXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_hwXfer       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_request      : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_RNW          : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_select       : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      M_seqAddr      : in  std_logic_vector(0 to C_NUM_MASTERS-1)                    := (others => '0');
      Sl_beAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      Sl_DBus        : in  std_logic_vector(0 to C_OPB_DWIDTH* C_NUM_SLAVES-1)       := (others => '0');
      Sl_DBusEn      : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '1');
      Sl_DBusEn32_63 : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '1');
      Sl_errAck      : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      Sl_dwAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      Sl_fwAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      Sl_hwAck       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      Sl_retry       : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      Sl_toutSup     : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      Sl_xferAck     : in  std_logic_vector(0 to C_NUM_SLAVES-1)                     := (others => '0');
      OPB_MRequest   : out std_logic_vector(0 to C_NUM_MASTERS-1);
      OPB_ABus       : out std_logic_vector(0 to C_OPB_AWIDTH-1);
      OPB_BE         : out std_logic_vector(0 to (C_OPB_DWIDTH+7)/8-1);
      OPB_beXfer     : out std_logic;
      OPB_beAck      : out std_logic;
      OPB_busLock    : out std_logic;
      OPB_rdDBus     : out std_logic_vector(0 to C_OPB_DWIDTH-1);
      OPB_wrDBus     : out std_logic_vector(0 to C_OPB_DWIDTH-1);
      OPB_DBus       : out std_logic_vector(0 to C_OPB_DWIDTH-1);
      OPB_errAck     : out std_logic;
      OPB_dwAck      : out std_logic;
      OPB_dwXfer     : out std_logic;
      OPB_fwAck      : out std_logic;
      OPB_fwXfer     : out std_logic;
      OPB_hwAck      : out std_logic;
      OPB_hwXfer     : out std_logic;
      OPB_MGrant     : out std_logic_vector(0 to C_NUM_MASTERS-1);
      OPB_pendReq    : out std_logic_vector(0 to C_NUM_MASTERS-1);
      OPB_retry      : out std_logic;
      OPB_RNW        : out std_logic;
      OPB_select     : out std_logic;
      OPB_seqAddr    : out std_logic;
      OPB_timeout    : out std_logic;
      OPB_toutSup    : out std_logic;
      OPB_xferAck    : out std_logic
    );
  end component opb_v20;

begin  ------------------------------------------------------------------------

  OPB_V20_I : opb_v20
    generic map
    (
      C_OPB_AWIDTH     => C_OPB_AWIDTH,
      C_OPB_DWIDTH     => C_OPB_DWIDTH,
      C_NUM_MASTERS    => C_NUM_MASTERS,
      C_NUM_SLAVES     => C_NUM_SLAVES,
      C_USE_LUT_OR     => C_USE_LUT_OR,
      C_EXT_RESET_HIGH => C_EXT_RESET_HIGH,
      C_BASEADDR       => C_BASEADDR,
      C_HIGHADDR       => C_HIGHADDR,
      C_DYNAM_PRIORITY => C_DYNAM_PRIORITY,
      C_PARK           => C_PARK,
      C_PROC_INTRFCE   => C_PROC_INTRFCE,
      C_REG_GRANTS     => C_REG_GRANTS,
      C_DEV_BLK_ID     => C_DEV_BLK_ID,
      C_DEV_MIR_ENABLE => C_DEV_MIR_ENABLE
    )
    port map
    (
      SYS_Rst        => SYS_Rst,
      Debug_SYS_Rst  => Debug_SYS_Rst,
      WDT_Rst        => WDT_Rst,
      OPB_Clk        => OPB_Clk,
      OPB_Rst        => OPB_Rst,
      M_ABus         => M_ABus,
      M_BE           => M_BE,
      M_beXfer       => M_beXfer,
      M_busLock      => M_busLock,
      M_DBus         => M_DBus,
      M_DBusEn       => M_DBusEn,
      M_DBusEn32_63  => M_DBusEn32_63,
      M_dwXfer       => M_dwXfer,
      M_fwXfer       => M_fwXfer,
      M_hwXfer       => M_hwXfer,
      M_request      => M_request,
      M_RNW          => M_RNW,
      M_select       => M_select,
      M_seqAddr      => M_seqAddr,
      Sl_beAck       => Sl_beAck,
      Sl_DBus        => Sl_DBus,
      Sl_DBusEn      => Sl_DBusEn,
      Sl_DBusEn32_63 => Sl_DBusEn32_63,
      Sl_errAck      => Sl_errAck,
      Sl_dwAck       => Sl_dwAck,
      Sl_fwAck       => Sl_fwAck,
      Sl_hwAck       => Sl_hwAck,
      Sl_retry       => Sl_retry,
      Sl_toutSup     => Sl_toutSup,
      Sl_xferAck     => Sl_xferAck,
      OPB_MRequest   => OPB_MRequest,
      OPB_ABus       => OPB_ABus,
      OPB_BE         => OPB_BE,
      OPB_beXfer     => OPB_beXfer,
      OPB_beAck      => OPB_beAck,
      OPB_busLock    => OPB_busLock,
      OPB_rdDBus     => OPB_rdDBus,
      OPB_wrDBus     => OPB_wrDBus,
      OPB_DBus       => OPB_DBus,
      OPB_errAck     => OPB_errAck,
      OPB_dwAck      => OPB_dwAck,
      OPB_dwXfer     => OPB_dwXfer,
      OPB_fwAck      => OPB_fwAck,
      OPB_fwXfer     => OPB_fwXfer,
      OPB_hwAck      => OPB_hwAck,
      OPB_hwXfer     => OPB_hwXfer,
      OPB_MGrant     => OPB_MGrant,
      OPB_pendReq    => OPB_pendReq,
      OPB_retry      => OPB_retry,
      OPB_RNW        => OPB_RNW,
      OPB_select     => OPB_select,
      OPB_seqAddr    => OPB_seqAddr,
      OPB_timeout    => OPB_timeout,
      OPB_toutSup    => OPB_toutSup,
      OPB_xferAck    => OPB_xferAck
    );

end architecture imp;
