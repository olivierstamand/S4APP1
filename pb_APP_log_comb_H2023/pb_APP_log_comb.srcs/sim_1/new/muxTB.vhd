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

entity muxTB is
--  Port ( );
end muxTB;

architecture Behavioral of muxTB is

component mux is
    Port (
    ADCbin : in std_logic_vector(3 downto 0);
    Dizaines: in std_logic_vector(3 downto 0);
    Unites_ns: in std_logic_vector(3 downto 0);
    Code_signe: in std_logic_vector(3 downto 0);
    Unite_s: in std_logic_vector(3 downto 0);
    erreur: in std_logic;
    BTN: in std_logic_vector(1 downto 0);
    S1, S2 : in std_logic;
    DAFF0: out std_logic_vector(3 downto 0); --droite
    DAFF1: out std_logic_vector(3 downto 0) -- gauche
    );
end component;
-- dual BCD pour les inputs
constant sysclk_Period  : time := 100 ns;
signal input: std_logic_vector (3 downto 0) := "0011";
signal diz : std_logic_vector( 3 downto 0) := "0000";
signal unit_ns : std_logic_vector( 3 downto 0) := "0011";
signal signe : std_logic_vector(3 downto 0) := "1111";
signal unit_s : std_logic_vector(3 downto 0) := "1010";
signal err : std_logic := '0';
signal btn : std_logic_vector(1 downto 0) := "00";
signal s1, s2 : std_logic;
----------------------------------------------------------------------------
begin

-- UUT : Unit Under Test
UUT: mux PORT MAP(input, diz, unit_ns, signe, unit_s, err, btn, s1, s2);
-- tester les differentes combinaisons de boutons pour le mux
   
   
   -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         BTN <= "00";
         wait  for sysclk_Period;
         BTN <= "01";
         wait  for sysclk_Period;
         BTN <= "10";
         wait  for sysclk_Period;
         BTN <= "11";
         wait  for sysclk_Period;
         s2 <= '1';
         wait  for sysclk_Period;
         input <= "0100";
         diz <= "0000";
         unit_ns <= "0100";
         signe <= "1111";
         unit_s <= "1001";
         s2 <= '0';
         BTN <= "00";
         wait  for sysclk_Period;
         BTN <= "01";
         wait  for sysclk_Period;
         BTN <= "10";
         wait  for sysclk_Period;
      END PROCESS;

END Behavioral;
