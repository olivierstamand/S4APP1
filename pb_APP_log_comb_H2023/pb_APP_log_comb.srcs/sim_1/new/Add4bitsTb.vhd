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

entity Add4bitsTB is
--  Port ( );
end Add4bitsTB;

architecture Behavioral of Add4bitsTB is

COMPONENT Add4bits
    Port (X: in std_logic_vector(3 downto 0);
          Y: in std_logic_vector(3 downto 0);
          Cin: in std_logic;
          S: out std_logic_vector(3 downto 0);
           OVERFLOW : out STD_LOGIC
          );
end COMPONENT;
   constant sysclk_Period  : time := 100 ns;
   signal X: std_logic_vector (3 downto 0) := "0000";
   signal Y: std_logic_vector (3 downto 0) := "0000";
   signal Cin: std_logic := '0';
----------------------------------------------------------------------------

begin

-- UUT : Unit Under Test
UUT: Add4bits 
   PORT MAP(X,Y,Cin);
   
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         X <= "0010";
         Y <= "0100";
         wait  for sysclk_Period;
         X <= "0100";
         Y <= "1000";
         wait  for sysclk_Period;
         X <= "0001";
         Y <= "0001";
         wait  for sysclk_Period;
         X <= "1011";
         Y <= "1101";
         wait  for sysclk_Period;


      END PROCESS;

END Behavioral;
