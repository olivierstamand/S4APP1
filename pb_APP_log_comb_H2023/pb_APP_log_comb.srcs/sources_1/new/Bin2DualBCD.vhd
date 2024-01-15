----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 11:42:57 AM
-- Design Name: 
-- Module Name: Bin2DualBCD - Behavioral
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

entity Bin2DualBCD is
 Port ( 
        ADCbin : in std_logic_vector(3 downto 0);
        Dizaines: out std_logic_vector(3 downto 0);
        code_signe: out std_logic_vector(3 downto 0);
        Unites_ns: out std_logic_vector(3 downto 0);
        Unite_s: out std_logic_vector(3 downto 0)
    );
    
end Bin2DualBCD;

architecture Behavioral of Bin2DualBCD is
component Bin2DualBCD_NS is
  Port (
    ABCin : in std_logic_vector(3 downto 0);
    dizaines: out std_logic_vector(3 downto 0);
    unite_ns: out std_logic_vector(3 downto 0)
  );
end component;
component Bin2DualBDC_s is
  Port ( 
    moins5 : in std_logic_vector(3 downto 0);
    code_signe : out std_logic_vector (3 downto 0);
    unite_s : out std_logic_vector (3 downto 0)
  );
end component;
component Moins_5 is
    Port(
        ADCbin : in std_logic_vector(3 downto 0);
        ADCout : out std_logic_vector (3 downto 0)
        );
end component;
signal moins5out : std_logic_vector(3 downto 0);
begin
moins5: Moins_5 port map(ADCbin, moins5out);
NS : Bin2DualBCD_NS port map(ADCbin, Dizaines, Unites_ns);
S : Bin2DualBDC_s port map(moins5out, code_signe, Unite_s);
end Behavioral;
