----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 10:51:47 AM
-- Design Name: 
-- Module Name: dec3a8TB - Behavioral
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

entity dec3a8TB is
--  Port ( );
end dec3a8TB;

architecture Behavioral of dec3a8TB is
component dec3a8 is
    Port (
    A2_3 : in std_logic_vector(2 downto 0);
    LED : out std_logic_vector(7 downto 0)
    );
end component;
constant sysclk_Period  : time := 100 ns;
signal A2_3 : std_logic_vector(2 downto 0);
begin
UUT : dec3a8 port map (A2_3);

 -- test bench
   tb : PROCESS
  
      BEGIN
         -- simuler une sequence de valeurs a l'entree 
         A2_3 <= "000";
         wait  for sysclk_Period;
         A2_3 <= "001";
         wait  for sysclk_Period;
         A2_3 <= "010";
         wait  for sysclk_Period;
         A2_3 <= "011";
         wait  for sysclk_Period;
         A2_3 <= "100";
         wait  for sysclk_Period;
         A2_3 <= "101";
         wait  for sysclk_Period;
         A2_3 <= "110";
         wait  for sysclk_Period;
         A2_3 <= "111";
         wait  for sysclk_Period;
      END PROCESS;


end Behavioral;
