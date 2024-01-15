---------------------------------------------------------------------------------------------
-- compteur_simple_tb.vhd
---------------------------------------------------------------------------------------------
-- Universit� de Sherbrooke - D�partement de GEGI
-- Version         : 1.0
-- Nomenclature    : 0.8 GRAMS
-- Date            : 16 novembre 2018
-- Auteur(s)       : R�jean Fontaine, Daniel Dalle
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: carte Thermo12, Pmod8LD PmodSSD
--
-- Outils          : vivado 2018.2 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Banc d'essai pour atelier  
-- TEST UNITAIRE de compteur_simple
-- 
---------------------------------------------------------------------------------------------
-- Revisions
-- Creation 13 dec 2018
--
---------------------------------------------------------------------------------------------
-- � faire :
-- 
--
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Fact2_3TB is
--  Port ( );
end Fact2_3TB;

architecture Behavioral of Fact2_3TB is

COMPONENT Fact2_3
    Port (
        N : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        A2_3 : out std_logic_vector(2 downto 0)
    );
end COMPONENT;
   constant sysclk_Period  : time := 100 ns;
   signal N: std_logic_vector (3 downto 0) := "0000";
   signal A2_3: std_logic_vector (2 downto 0) := "000";
   signal Cin: std_logic := '0';
----------------------------------------------------------------------------

begin

-- UUT : Unit Under Test
UUT: Fact2_3 
   PORT MAP(N,Cin, A2_3);
   
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         N <= "0000";
         wait  for sysclk_Period;
         N <= "0001";
         wait  for sysclk_Period;
         N <= "0010";
         wait  for sysclk_Period;
         N <= "0011";
         wait  for sysclk_Period;
         N <= "0100";
         wait  for sysclk_Period;
         N <= "0101";
         wait  for sysclk_Period;
         N <= "0110";
         wait  for sysclk_Period;
         N <= "0111";
         wait  for sysclk_Period;
         N <= "1000";
         wait  for sysclk_Period;
         N <= "1001";
         wait  for sysclk_Period;
         N <= "1010";
         wait  for sysclk_Period;
         N <= "1011";
         wait  for sysclk_Period;
         N <= "1100";
         wait  for sysclk_Period;
         N <= "1101";
         wait  for sysclk_Period;
         N <= "1110";
         wait  for sysclk_Period;
         N <= "1111";
         wait  for sysclk_Period;

      END PROCESS;

END Behavioral;
