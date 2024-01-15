----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 01:10:59 PM
-- Design Name: 
-- Module Name: Bin2DualBDC_s - Behavioral
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

entity Bin2DualBDC_s is
  Port ( 
    moins5 : in std_logic_vector(3 downto 0);
    code_signe : out std_logic_vector (3 downto 0);
    unite_s : out std_logic_vector (3 downto 0)
  );
end Bin2DualBDC_s;

architecture Behavioral of Bin2DualBDC_s is
component Add4bits is
  Port (
    X: in std_logic_vector(3 downto 0);
    Y: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    OVERFLOW: out std_logic
  );
end component;
signal inverted : std_logic_vector(3 downto 0);
signal signed : std_logic_vector(3 downto 0);
begin
inverted <= not(moins5(3)) & not(moins5(2)) & not(moins5(1)) & not(moins5(0));
adder: Add4bits port map(inverted, "0001", '0', signed);
end Behavioral;
