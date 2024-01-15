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

entity pariteTb is
--  Port ( );
end pariteTb;

architecture Behavioral of pariteTb is

component paritePair is
    Port ( 
        ABCin : in std_logic_vector(2 downto 0);
        parite: out std_logic_vector(3 downto 0)
    );
end component;
component pariteImpair is
    Port ( 
        ABCin : in std_logic_vector(2 downto 0);
        parite: out std_logic_vector(3 downto 0)
    );
end component;   
constant sysclk_Period  : time := 100 ns;
   signal input: std_logic_vector (2 downto 0) := "000";
----------------------------------------------------------------------------

begin

-- UUT : Unit Under Test
UUTPAIR: paritePair PORT MAP(input);
UUTIMPAIR: pariteImpair PORT MAP (input);
   
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         input <= "000";
         wait  for sysclk_Period;
         input <= "001";
         wait  for sysclk_Period;
         input <= "010";
         wait  for sysclk_Period;
         input <= "011";
         wait  for sysclk_Period;
         input <= "100";
         wait  for sysclk_Period;
         input <= "101";
         wait  for sysclk_Period;
         input <= "110";
         wait  for sysclk_Period;
         input <= "111";
         wait  for sysclk_Period;
         

      END PROCESS;

END Behavioral;
