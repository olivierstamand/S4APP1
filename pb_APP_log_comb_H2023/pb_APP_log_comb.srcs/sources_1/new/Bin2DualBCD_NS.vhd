----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 02:38:24 PM
-- Design Name: 
-- Module Name: Bin2DualBCD_NS - Behavioral
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

entity Bin2DualBCD_NS is
  Port (
    ABCin : in std_logic_vector(3 downto 0);
    dizaines: out std_logic_vector(3 downto 0);
    unite_ns: out std_logic_vector(3 downto 0)
  );
end Bin2DualBCD_NS;

architecture Behavioral of Bin2DualBCD_NS is

begin
process (ABCin) is
begin
    case ABCin is
        when "0000" =>
            dizaines <= "0000";
            unite_ns <= "0000";
        when "0001" => 
            dizaines <= "0000";
            unite_ns <= "0001";
        when "0010" => 
            dizaines <= "0000";
            unite_ns <= "0010";
        when "0011" => 
            dizaines <= "0000";
            unite_ns <= "0011";
        when "0100" => 
            dizaines <= "0000";
            unite_ns <= "0100";
        when "0101" => 
            dizaines <= "0000";
            unite_ns <= "0101";
        when "0110" => 
            dizaines <= "0000";
            unite_ns <= "0110"; 
        when "0111" => 
            dizaines <= "0000";
            unite_ns <= "0111";
        when "1000" => 
            dizaines <= "0000";
            unite_ns <= "1000";
        when "1001" => 
            dizaines <= "0000";
            unite_ns <= "1001";
        when "1010" => 
            dizaines <= "0001";
            unite_ns <= "0000";
        when "1011" => 
            dizaines <= "0001";
            unite_ns <= "0001";
        when "1100" => 
            dizaines <= "0001";
            unite_ns <= "0010";
        when "1101" => 
            dizaines <= "0001";
            unite_ns <= "0011";
        when "1110" => 
            dizaines <= "0001";
            unite_ns <= "0100";
        when "1111" => 
            dizaines <= "0001";
            unite_ns <= "0101";
        when others => 
            dizaines <= "1110";
            unite_ns <= "1110";
        end case;
end process;           
end Behavioral;
