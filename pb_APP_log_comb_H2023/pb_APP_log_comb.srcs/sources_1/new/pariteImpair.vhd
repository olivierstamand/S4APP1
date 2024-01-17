----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 11:16:09 AM
-- Design Name: 
-- Module Name: paritePair - Behavioral
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

entity pariteImpair is
    Port ( 
        ABCin : in std_logic_vector(3 downto 0);
        parite: out std_logic
    );
end pariteImpair;

architecture Behavioral of pariteImpair is
signal tmp : std_logic;
begin
tmp <= NOT(ABCin(0) XOR ABCin(1) XOR ABCin(2) XOR ABCin(3));
parite <= tmp ;

end Behavioral;
