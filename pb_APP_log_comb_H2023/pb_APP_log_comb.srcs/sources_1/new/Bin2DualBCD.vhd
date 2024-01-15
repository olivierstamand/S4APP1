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

begin



end Behavioral;
