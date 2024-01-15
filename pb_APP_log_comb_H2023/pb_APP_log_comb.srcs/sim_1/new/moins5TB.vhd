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

entity moins5TB is
--  Port ( );
end moins5TB;

architecture Behavioral of moins5TB is

component Moins_5 is
    Port(
        ADCbin : in std_logic_vector(3 downto 0);
        ADCout : out std_logic_vector (3 downto 0)
        );
end component;
constant sysclk_Period  : time := 100 ns;
signal input: std_logic_vector (3 downto 0) := "0000";
----------------------------------------------------------------------------

begin

-- UUT : Unit Under Test
UUT: Moins_5 PORT MAP(input);

   
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         input <= "0000";
         wait  for sysclk_Period;
         input <= "0001";
         wait  for sysclk_Period;
         input <= "0010";
         wait  for sysclk_Period;
         input <= "0011";
         wait  for sysclk_Period;
         input <= "0100";
         wait  for sysclk_Period;
         input <= "0101";
         wait  for sysclk_Period;
         input <= "0110";
         wait  for sysclk_Period;
         input <= "0111";
         wait  for sysclk_Period;
         input <= "1000";
         wait  for sysclk_Period;
         input <= "1001";
         wait  for sysclk_Period;
         input <= "1010";
         wait  for sysclk_Period;
         input <= "1011";
         wait  for sysclk_Period;
         input <= "1100";
         wait  for sysclk_Period;
         input <= "1101";
         wait  for sysclk_Period;
         input <= "1110";
         wait  for sysclk_Period;
         input <= "1111";
         wait  for sysclk_Period;

      END PROCESS;

END Behavioral;
