----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 02:17:11 PM
-- Design Name: 
-- Module Name: thermo2bin4bits - Behavioral
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

entity thermo2bin3bits is
    Port (
       ADC3th: in std_logic_vector (2 downto 0);
       prevmsb: in std_logic;
       ADC4bin: out std_logic_vector (3 downto 0); 
       err: out std_logic
    );
end thermo2bin3bits;

architecture Behavioral of thermo2bin3bits is

begin
ADC4bin(0) <= (NOT ADC3th(1) AND ADC3th(0)) OR ADC3th(2);
ADC4bin(1) <= ADC3th(1) AND ADC3th(0); 
ADC4bin(2) <= '0';
ADC4bin(3) <= '0';
err <= (NOT ADC3th(0) AND ADC3th(1)) OR (ADC3th(0) AND NOT prevmsb) OR (ADC3th(2) AND NOT ADC3th(1));
end Behavioral;
