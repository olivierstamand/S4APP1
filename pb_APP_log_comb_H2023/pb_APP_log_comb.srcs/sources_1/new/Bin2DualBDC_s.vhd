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
signal signedOut : std_logic_vector(3 downto 0);
begin
inverted <= not(moins5(3)) & not(moins5(2)) & not(moins5(1)) & not(moins5(0)); -- on inverse pas le signe
adder: Add4bits port map(inverted, "0001", '0', signedOut);
process (moins5, signedOut) is 
begin
    case moins5(3) is
        when '1' =>
            code_signe <= "1111";
            unite_s <= '0' & signedOut(2 downto 0);
        when '0' =>
            code_signe <= "0000";
            unite_s <= moins5;
        when others =>
            code_signe <= "1110";
            unite_s <= "1110";
     end case;
end process;
end Behavioral;
