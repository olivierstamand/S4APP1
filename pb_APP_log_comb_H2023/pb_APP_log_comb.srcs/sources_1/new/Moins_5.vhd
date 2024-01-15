----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 11:50:26 AM
-- Design Name: 
-- Module Name: Moins_5 - Behavioral
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

entity Moins_5 is
    Port(
        ADCbin : in std_logic_vector(3 downto 0);
        ADCout : out std_logic_vector (3 downto 0)
        );
end Moins_5;

architecture Behavioral of Moins_5 is
component Add4bits is
  Port (
    X: in std_logic_vector(3 downto 0);
    Y: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    OVERFLOW: out std_logic
  );
end component;
signal not5 : std_logic_vector(3 downto 0) := "1011";
begin
adder: Add4bits port map(ADCBin, not5, '0', ADCout);
end Behavioral;
