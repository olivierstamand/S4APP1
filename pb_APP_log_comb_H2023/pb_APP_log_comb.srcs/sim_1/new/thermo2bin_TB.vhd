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

entity thermo2bin_TB is
--  Port ( );
end thermo2bin_TB;

architecture Behavioral of thermo2bin_TB is


component thermo2bin is
    Port(
        ADCth : in std_logic_vector (11 downto 0);
        ADCBin : out std_logic_vector (3 downto 0) 
        );
end component;

component thermo2bin4bits is
    Port (
       ADC4th: in std_logic_vector (3 downto 0);
       ADC4bin: out std_logic_vector (3 downto 0); 
       err: out std_logic
    );
end component;
constant sysclk_Period  : time := 100 ns;
signal input: std_logic_vector (11 downto 0) := "000000000000";

----------------------------------------------------------------------------

begin

-- UUT : Unit Under Test
UUT: thermo2bin PORT MAP(input);

   
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         input <= "000000000001";
         wait  for sysclk_Period;
         input <= "000000000011";
         wait  for sysclk_Period;
         input <= "000000000111";
         wait  for sysclk_Period;
         input <= "000000001111";
         wait  for sysclk_Period;
         input <= "000000011111";
         wait  for sysclk_Period;
         input <= "000000111111";
         wait  for sysclk_Period;
         input <= "000000111111";
         wait  for sysclk_Period;
         input <= "000001111111";
         wait  for sysclk_Period;
         input <= "000011111111";
         wait  for sysclk_Period;
         input <= "000111111111";
         wait  for sysclk_Period;
         input <= "000001010011";
        wait  for sysclk_Period;
         input <= "000001010011";
         wait  for sysclk_Period;
         input <= "000001010011";
      END PROCESS;

END Behavioral;
