----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2024 02:12:02 PM
-- Design Name: 
-- Module Name: Add1bitA - Behavioral
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

entity Add1bitA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Add1bitA;

architecture Behavioral of Add1bitA is
signal tmp:std_logic_vector(2 downto 0);

begin

tmp <= A&B&Cin;
process (tmp) is 
begin 
case tmp is 
    when "000" =>
        S <= '0';  
        Cout <= '0';
    when "001" =>
        S <= '1';  
        Cout <= '0';
    when "010" =>
        S <= '1';  
        Cout <= '0';
    when "011" =>
        S <= '0';  
        Cout <= '1';
    when "100" =>
        S <= '1';  
        Cout <= '0';
    when "101" =>
        S <= '0';  
        Cout <= '1';
    when "110" =>
        S <= '0';  
        Cout <= '1';
    when "111" =>
        S <= '1';  
        Cout <= '1';
    when others => 
        S <= '0';
        Cout <= '0';
end case;    
end process;
end Behavioral;
