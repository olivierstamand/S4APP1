----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 01:40:53 PM
-- Design Name: 
-- Module Name: parite - Behavioral
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

entity parite is
  Port (
    s1 : in std_logic;
    ABCin : in std_logic_vector(3 downto 0);
    parite : out std_logic_vector(3 downto 0)
  );
end parite;

architecture Behavioral of parite is
component paritePair is
    Port ( 
        ABCin : in std_logic_vector(2 downto 0);
        parite: out std_logic_vector(3 downto 0)
    );
end component;
component pariteImpair is
    Port ( 
        ABCin : in std_logic_vector(2 downto 0);
        parite: out std_logic_vector(3 downto 0)
    );
end component;
signal outPair : std_logic_vector(3 downto 0);
signal outImpair : std_logic_vector(3 downto 0);
begin
pair: paritePair port map (ABCin, outPair);
impair: pariteImpair port map(ABCin, outImpair);

process (s1) is
begin
 case s1 is
    when '1' =>
        parite <= outPair;
    when '0' =>
        parite <= outImpair;
    when others => 
        parite <= "0000";
end case;
end process;
end Behavioral;
