----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 03:37:01 PM
-- Design Name: 
-- Module Name: Bin2DualBCDTB - Behavioral
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

entity Bin2DualBCDTB is
--  Port ( );
end Bin2DualBCDTB;

architecture Behavioral of Bin2DualBCDTB is
component Bin2DualBCD is
 Port ( 
        ADCbin : in std_logic_vector(3 downto 0);
        Dizaines: out std_logic_vector(3 downto 0);
        code_signe: out std_logic_vector(3 downto 0);
        Unites_ns: out std_logic_vector(3 downto 0);
        Unite_s: out std_logic_vector(3 downto 0)
    );
    
end component;
constant sysclk_Period  : time := 100 ns;
signal ADCbin : std_logic_vector(3 downto 0);
begin
UUT : Bin2DualBCD port map (ADCbin);

 -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         ADCbin <= "0000";
         wait  for sysclk_Period;
         ADCbin <= "0001";
         wait  for sysclk_Period;
         ADCbin <= "0010";
         wait  for sysclk_Period;
         ADCbin <= "0011";
         wait  for sysclk_Period;
         ADCbin <= "0100";
         wait  for sysclk_Period;
         ADCbin <= "0101";
         wait  for sysclk_Period;
         ADCbin <= "0110";
         wait  for sysclk_Period;
         ADCbin <= "0111";
         wait  for sysclk_Period;
         ADCbin <= "1000";
         wait  for sysclk_Period;
         ADCbin <= "1001";
         wait  for sysclk_Period;
         ADCbin <= "1010";
         wait  for sysclk_Period;
         ADCbin <= "1011";
         wait  for sysclk_Period;
         ADCbin <= "1100";
         wait  for sysclk_Period;
         ADCbin <= "1101";
         wait  for sysclk_Period;
         ADCbin <= "1110";
         wait  for sysclk_Period;
         ADCbin <= "1111";
         wait  for sysclk_Period;
      END PROCESS;
end Behavioral;
