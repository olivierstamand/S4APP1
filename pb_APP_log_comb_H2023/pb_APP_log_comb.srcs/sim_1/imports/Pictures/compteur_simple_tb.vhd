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

entity Add1Bit_tb is
--  Port ( );
end Add1Bit_tb;

architecture Behavioral of Add1Bit_tb is

COMPONENT Add1BitB
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC
          );
end COMPONENT;
   constant sysclk_Period  : time := 100 ns;
   signal A: std_logic := '0';
   signal B: std_logic := '0';
   signal Cin: std_logic := '0';

----------------------------------------------------------------------------

begin

-- UUT : Unit Under Test
UUT: Add1bitB 
   PORT MAP(
    A => A, 
    B => B ,
    Cin => Cin     
   );
   
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         A <= '0';
         B <= '0';
         Cin <= '0';
         wait  for sysclk_Period;
         A <= '0';
         B <= '0';
         Cin <= '1';
         wait  for sysclk_Period;
         A <= '0';
         B <= '1';
         Cin <= '0';
         wait  for sysclk_Period;
         A <= '0';
         B <= '1';
         Cin <= '1';
         wait  for sysclk_Period;
         A <= '1';
         B <= '0';
         Cin <= '0';
         wait for sysclk_Period;
         A <= '1';
         B <= '0';
         Cin <= '1';
         wait for sysclk_Period;
         A <= '1';
         B <= '1';
         Cin <= '0';
         wait for sysclk_Period;
         A <= '1';
         B <= '1';
         Cin <= '1';
      END PROCESS;

END Behavioral;
