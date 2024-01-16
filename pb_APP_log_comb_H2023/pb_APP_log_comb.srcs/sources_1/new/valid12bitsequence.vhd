----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 02:17:11 PM
-- Design Name: 
-- Module Name: thermo2bin - Behavioral
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

entity valid12bitsequence is
    Port (
        zeroespresent : in std_logic_vector (2 downto 0);
        err : in std_logic_vector (2 downto 0) ;
        valid : out std_logic
    );
end valid12bitsequence;

architecture Behavioral of valid12bitsequence is
begin
  
valid <= ((NOT zeroespresent(1) AND NOT zeroespresent(0)) OR (zeroespresent(2) AND zeroespresent(1))) AND (NOT err(0) AND NOT err(1) AND NOT err(2));

end Behavioral;
