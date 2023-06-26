-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Mon Jun 26 10:48:38 2023
-- Host        : TX running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/txzing/Desktop/test/vivado/vivado_proj/vivado_proj.srcs/sources_1/bd/system/ip/system_Reset_Delay_0_0/system_Reset_Delay_0_0_sim_netlist.vhdl
-- Design      : system_Reset_Delay_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_Reset_Delay_0_0_Reset_Delay is
  port (
    rst_n_o : out STD_LOGIC;
    rst_o : out STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_Reset_Delay_0_0_Reset_Delay : entity is "Reset_Delay";
end system_Reset_Delay_0_0_Reset_Delay;

architecture STRUCTURE of system_Reset_Delay_0_0_Reset_Delay is
  signal \reset_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal reset_cnt_reg : STD_LOGIC_VECTOR ( 20 downto 7 );
  signal \reset_cnt_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \reset_cnt_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \reset_cnt_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \reset_cnt_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \reset_cnt_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \reset_cnt_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \reset_cnt_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \reset_cnt_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \reset_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \reset_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \reset_cnt_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \reset_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \reset_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \reset_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \reset_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \reset_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \reset_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \reset_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \reset_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \reset_cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \^rst_o\ : STD_LOGIC;
  signal rst_o_reg_i_1_n_0 : STD_LOGIC;
  signal rst_o_reg_i_2_n_0 : STD_LOGIC;
  signal rst_o_reg_i_3_n_0 : STD_LOGIC;
  signal rst_o_reg_i_4_n_0 : STD_LOGIC;
  signal \NLW_reset_cnt_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_reset_cnt_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \reset_cnt_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \reset_cnt_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \reset_cnt_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \reset_cnt_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \reset_cnt_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \reset_cnt_reg[8]_i_1\ : label is 11;
begin
  rst_o <= \^rst_o\;
\reset_cnt[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \reset_cnt_reg_n_0_[0]\,
      O => \reset_cnt[0]_i_2_n_0\
    );
\reset_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[0]_i_1_n_7\,
      Q => \reset_cnt_reg_n_0_[0]\,
      R => '0'
    );
\reset_cnt_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \reset_cnt_reg[0]_i_1_n_0\,
      CO(2) => \reset_cnt_reg[0]_i_1_n_1\,
      CO(1) => \reset_cnt_reg[0]_i_1_n_2\,
      CO(0) => \reset_cnt_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \reset_cnt_reg[0]_i_1_n_4\,
      O(2) => \reset_cnt_reg[0]_i_1_n_5\,
      O(1) => \reset_cnt_reg[0]_i_1_n_6\,
      O(0) => \reset_cnt_reg[0]_i_1_n_7\,
      S(3) => \reset_cnt_reg_n_0_[3]\,
      S(2) => \reset_cnt_reg_n_0_[2]\,
      S(1) => \reset_cnt_reg_n_0_[1]\,
      S(0) => \reset_cnt[0]_i_2_n_0\
    );
\reset_cnt_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[8]_i_1_n_5\,
      Q => reset_cnt_reg(10),
      R => '0'
    );
\reset_cnt_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[8]_i_1_n_4\,
      Q => reset_cnt_reg(11),
      R => '0'
    );
\reset_cnt_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[12]_i_1_n_7\,
      Q => reset_cnt_reg(12),
      R => '0'
    );
\reset_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \reset_cnt_reg[8]_i_1_n_0\,
      CO(3) => \reset_cnt_reg[12]_i_1_n_0\,
      CO(2) => \reset_cnt_reg[12]_i_1_n_1\,
      CO(1) => \reset_cnt_reg[12]_i_1_n_2\,
      CO(0) => \reset_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \reset_cnt_reg[12]_i_1_n_4\,
      O(2) => \reset_cnt_reg[12]_i_1_n_5\,
      O(1) => \reset_cnt_reg[12]_i_1_n_6\,
      O(0) => \reset_cnt_reg[12]_i_1_n_7\,
      S(3 downto 0) => reset_cnt_reg(15 downto 12)
    );
\reset_cnt_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[12]_i_1_n_6\,
      Q => reset_cnt_reg(13),
      R => '0'
    );
\reset_cnt_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[12]_i_1_n_5\,
      Q => reset_cnt_reg(14),
      R => '0'
    );
\reset_cnt_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[12]_i_1_n_4\,
      Q => reset_cnt_reg(15),
      R => '0'
    );
\reset_cnt_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[16]_i_1_n_7\,
      Q => reset_cnt_reg(16),
      R => '0'
    );
\reset_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \reset_cnt_reg[12]_i_1_n_0\,
      CO(3) => \reset_cnt_reg[16]_i_1_n_0\,
      CO(2) => \reset_cnt_reg[16]_i_1_n_1\,
      CO(1) => \reset_cnt_reg[16]_i_1_n_2\,
      CO(0) => \reset_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \reset_cnt_reg[16]_i_1_n_4\,
      O(2) => \reset_cnt_reg[16]_i_1_n_5\,
      O(1) => \reset_cnt_reg[16]_i_1_n_6\,
      O(0) => \reset_cnt_reg[16]_i_1_n_7\,
      S(3 downto 0) => reset_cnt_reg(19 downto 16)
    );
\reset_cnt_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[16]_i_1_n_6\,
      Q => reset_cnt_reg(17),
      R => '0'
    );
\reset_cnt_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[16]_i_1_n_5\,
      Q => reset_cnt_reg(18),
      R => '0'
    );
\reset_cnt_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[16]_i_1_n_4\,
      Q => reset_cnt_reg(19),
      R => '0'
    );
\reset_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[0]_i_1_n_6\,
      Q => \reset_cnt_reg_n_0_[1]\,
      R => '0'
    );
\reset_cnt_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[20]_i_1_n_7\,
      Q => reset_cnt_reg(20),
      R => '0'
    );
\reset_cnt_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \reset_cnt_reg[16]_i_1_n_0\,
      CO(3 downto 0) => \NLW_reset_cnt_reg[20]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_reset_cnt_reg[20]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \reset_cnt_reg[20]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => reset_cnt_reg(20)
    );
\reset_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[0]_i_1_n_5\,
      Q => \reset_cnt_reg_n_0_[2]\,
      R => '0'
    );
\reset_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[0]_i_1_n_4\,
      Q => \reset_cnt_reg_n_0_[3]\,
      R => '0'
    );
\reset_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[4]_i_1_n_7\,
      Q => \reset_cnt_reg_n_0_[4]\,
      R => '0'
    );
\reset_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \reset_cnt_reg[0]_i_1_n_0\,
      CO(3) => \reset_cnt_reg[4]_i_1_n_0\,
      CO(2) => \reset_cnt_reg[4]_i_1_n_1\,
      CO(1) => \reset_cnt_reg[4]_i_1_n_2\,
      CO(0) => \reset_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \reset_cnt_reg[4]_i_1_n_4\,
      O(2) => \reset_cnt_reg[4]_i_1_n_5\,
      O(1) => \reset_cnt_reg[4]_i_1_n_6\,
      O(0) => \reset_cnt_reg[4]_i_1_n_7\,
      S(3) => reset_cnt_reg(7),
      S(2) => \reset_cnt_reg_n_0_[6]\,
      S(1) => \reset_cnt_reg_n_0_[5]\,
      S(0) => \reset_cnt_reg_n_0_[4]\
    );
\reset_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[4]_i_1_n_6\,
      Q => \reset_cnt_reg_n_0_[5]\,
      R => '0'
    );
\reset_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[4]_i_1_n_5\,
      Q => \reset_cnt_reg_n_0_[6]\,
      R => '0'
    );
\reset_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[4]_i_1_n_4\,
      Q => reset_cnt_reg(7),
      R => '0'
    );
\reset_cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[8]_i_1_n_7\,
      Q => reset_cnt_reg(8),
      R => '0'
    );
\reset_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \reset_cnt_reg[4]_i_1_n_0\,
      CO(3) => \reset_cnt_reg[8]_i_1_n_0\,
      CO(2) => \reset_cnt_reg[8]_i_1_n_1\,
      CO(1) => \reset_cnt_reg[8]_i_1_n_2\,
      CO(0) => \reset_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \reset_cnt_reg[8]_i_1_n_4\,
      O(2) => \reset_cnt_reg[8]_i_1_n_5\,
      O(1) => \reset_cnt_reg[8]_i_1_n_6\,
      O(0) => \reset_cnt_reg[8]_i_1_n_7\,
      S(3 downto 0) => reset_cnt_reg(11 downto 8)
    );
\reset_cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rst_o_reg_i_1_n_0,
      D => \reset_cnt_reg[8]_i_1_n_6\,
      Q => reset_cnt_reg(9),
      R => '0'
    );
rst_n_o_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rst_o\,
      O => rst_n_o
    );
rst_o_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF1055"
    )
        port map (
      I0 => reset_cnt_reg(16),
      I1 => rst_o_reg_i_2_n_0,
      I2 => rst_o_reg_i_3_n_0,
      I3 => reset_cnt_reg(15),
      I4 => rst_o_reg_i_4_n_0,
      O => rst_o_reg_i_1_n_0
    );
rst_o_reg_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => reset_cnt_reg(12),
      I1 => reset_cnt_reg(13),
      I2 => reset_cnt_reg(11),
      I3 => reset_cnt_reg(14),
      O => rst_o_reg_i_2_n_0
    );
rst_o_reg_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5557"
    )
        port map (
      I0 => reset_cnt_reg(10),
      I1 => reset_cnt_reg(8),
      I2 => reset_cnt_reg(7),
      I3 => reset_cnt_reg(9),
      O => rst_o_reg_i_3_n_0
    );
rst_o_reg_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => reset_cnt_reg(18),
      I1 => reset_cnt_reg(19),
      I2 => reset_cnt_reg(17),
      I3 => reset_cnt_reg(20),
      O => rst_o_reg_i_4_n_0
    );
rst_o_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rst_o_reg_i_1_n_0,
      Q => \^rst_o\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_Reset_Delay_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_o : out STD_LOGIC;
    rst_n_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_Reset_Delay_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_Reset_Delay_0_0 : entity is "system_Reset_Delay_0_0,Reset_Delay,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_Reset_Delay_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_Reset_Delay_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_Reset_Delay_0_0 : entity is "Reset_Delay,Vivado 2020.1";
end system_Reset_Delay_0_0;

architecture STRUCTURE of system_Reset_Delay_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_clk_wiz_1_0_clk_out1, INSERT_VIP 0";
begin
inst: entity work.system_Reset_Delay_0_0_Reset_Delay
     port map (
      clk => clk,
      rst_n_o => rst_n_o,
      rst_o => rst_o
    );
end STRUCTURE;
