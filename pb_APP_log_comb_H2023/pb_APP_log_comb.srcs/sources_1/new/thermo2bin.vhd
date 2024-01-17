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

entity thermo2bin is
    Port (
        ADCth : in std_logic_vector (11 downto 0);
        ADCBin : out std_logic_vector (3 downto 0); 
        err : out std_logic
    );
end thermo2bin;

architecture Behavioral of thermo2bin is
signal err_tmp: std_logic_vector (3 downto 0);
signal bin1: std_logic_vector (3 downto 0);
signal bin2: std_logic_vector (3 downto 0);
signal bin3: std_logic_vector (3 downto 0);
signal bin4: std_logic_vector (3 downto 0);
signal buf1 : std_logic_vector (3 downto 0) := "0000";
signal buf2 : std_logic_vector (3 downto 0) := "0000";

component thermo2bin3bits is
    Port (
       ADC3th: in std_logic_vector (2 downto 0);
       ADC4bin: out std_logic_vector (3 downto 0); 
       prevmsb : in std_logic; 
       err: out std_logic
    );
end component;
COMPONENT Add4bits is 
    Port (X: in std_logic_vector(3 downto 0);
          Y: in std_logic_vector(3 downto 0);
          Cin: in std_logic;
          S: out std_logic_vector(3 downto 0);
           OVERFLOW : out STD_LOGIC
          );
end COMPONENT;

begin
adder1 : Add4bits PORT MAP (bin1,bin2,'0',buf1);
adder2 : Add4bits PORT MAP (buf1,bin3,'0',buf2); 
adder3 : Add4bits PORT MAP (buf2,bin4,'0', ADCBin);
thermo1: thermo2bin3bits
  PORT MAP (
    ADC3th => ADCth(2 downto 0),
    prevmsb => '1',
    err => err_tmp(0),
    ADC4bin => bin1
  );
  
 thermo2: thermo2bin3bits
  PORT MAP (
    ADC3th => ADCth(5 downto 3),
    err => err_tmp(1),
    prevmsb => ADCth(2),
    ADC4bin => bin2
  );
  thermo3: thermo2bin3bits
   PORT MAP (
    ADC3th => ADCth(8 downto 6),
    prevmsb => ADCth(5),
    err => err_tmp(2),
    ADC4bin => bin3
  );
   thermo4: thermo2bin3bits
   PORT MAP (
    ADC3th => ADCth(11 downto 9),
    prevmsb => ADCth(8),
    err => err_tmp(3),
    ADC4bin => bin4
  );
err <=  err_tmp(0) OR err_tmp(1) OR err_tmp(2) OR err_tmp(3);

end Behavioral;
