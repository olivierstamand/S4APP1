----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 04:56:12 PM
-- Design Name: 
-- Module Name: mux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port (
    ADCbin : in std_logic_vector(3 downto 0);
    Dizaines: in std_logic_vector(3 downto 0);
    Unites_ns: in std_logic_vector(3 downto 0);
    Code_signe: in std_logic_vector(3 downto 0);
    Unite_s: in std_logic_vector(3 downto 0);
    erreur: in std_logic;
    BTN: in std_logic_vector(3 downto 0);
    S2 : in std_logic;
    DAFF0: out std_logic_vector(3 downto 0); --droite
    DAFF1: out std_logic_vector(3 downto 0) -- gauche
    );
end mux;

architecture Behavioral of mux is

begin
process (ADCbin, Dizaines, Unites_ns, Code_signe, Unite_s, BTN, S2) is
begin
    if S2 = '1' then
        DAFF0 <= "1110";
        DAFF1 <= "1101";
    ELSIf (BTN(0) = '0' AND BTN(1) = '0') then
        DAFF0 <= Unites_ns;
        DAFF1 <= Dizaines;
    ELSif (BTN(0) = '1' AND BTN(1) = '1') then
        DAFF0 <= "1110";
        DAFF1 <= "1101";
    ELSif BTN(0) = '1' then
        DAFF0 <= ADCbin;
        DAFF1 <= "0000";
    ELSif BTN(1) = '1' then
        DAFF0 <= Unite_s;
        DAFF1 <= Code_signe;
    ELSE
        DAFF0 <= "0000";
        DAFF1 <= "0000";
    end if;
end process;
end Behavioral;
