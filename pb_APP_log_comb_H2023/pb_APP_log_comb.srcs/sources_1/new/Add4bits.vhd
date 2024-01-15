----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2024 02:12:02 PM
-- Design Name: 
-- Module Name: Add4bits - Behavioral
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

entity Add4bits is
  Port (
    X: in std_logic_vector(3 downto 0);
    Y: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    OVERFLOW: out std_logic
  );
end Add4bits;

architecture Behavioral of Add4bits is
component Add1bitA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;
component Add1bitB is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;
signal C1, C2, C3: std_logic;
signal tmp_s: std_logic_vector(3 downto 0);

begin
add0: Add1bitA PORT MAP(X(0), Y(0), Cin, tmp_s(0), C1);
add1: Add1bitA PORT MAP(X(1), Y(1), C1, tmp_s(1), C2);
add2: Add1bitB PORT MAP(X(2), Y(2), C2, tmp_s(2), C3);
add3: Add1bitB PORT MAP(X(3), Y(3), C3, tmp_s(3), OVERFLOW);
S <= tmp_s;
end Behavioral;
