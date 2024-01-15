----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 08:53:05 AM
-- Design Name: 
-- Module Name: Fact2_3 - Behavioral
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
use IEEE.numeric_std;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fact2_3 is
    Port (
        N : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        A2_3 : out std_logic_vector(2 downto 0)
    );
end Fact2_3;

architecture Behavioral of Fact2_3 is
component Add4bits is
  Port (
    X: in std_logic_vector(3 downto 0);
    Y: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    OVERFLOW: out std_logic
  );
end component;
signal N1, N2, N3 : std_logic_vector(3 downto 0);
signal tmp1, tmp2 : std_logic_vector(3 downto 0);
signal C1in, C2in, C3in : std_logic;
begin
-- shift bits for N1, N2 et N3
N1 <= '0' & N(3 downto 1); --2^-1
N2 <= "000" & N(3 downto 3); --2^-3
C1in <= N(0) AND N(2);

N3 <= "0000"; -- utiliser le Cin
C2in <= N(3) AND (N(0) XOR N(2)); --seulement un Cin si un seul des deux autres avait un Cin à 1

adder1: Add4Bits port map(N1, N2, C1in , tmp1);
adder2: Add4Bits port map(tmp1, N3, C2in, tmp2);
A2_3 <= tmp2(2 downto 0);
end Behavioral;
