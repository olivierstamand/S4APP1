---------------------------------------------------------------------------------------------
-- Universit� de Sherbrooke - D�partement de GEGI
-- Version         : 3.0
-- Nomenclature    : GRAMS
-- Date            : 21 Avril 2020
-- Auteur(s)       : R�jean Fontaine, Daniel Dalle, Marc-Andr� T�trault
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: Pmod8LD PmodSSD
--
-- Outils          : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit utilitaire pour le laboratoire et la probl�matique de logique combinatoire
--
---------------------------------------------------------------------------------------------
-- � faire :
-- Voir le guide de l'APP
--    Ins�rer les modules additionneurs ("components" et "instances")
--
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AppCombi_top is
  port ( 
          i_ADC_th    : in std_logic_vector (11 downto 0); 
          i_btn       : in    std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
          i_sw        : in    std_logic_vector (3 downto 0); -- Interrupteurs de la carte Zybo
          sysclk      : in    std_logic;        
          o_DEL2      : out    std_logic;
          o_DEL3      : out    std_logic; 
          i_S1        : in    std_logic;
          i_S2        : in    std_logic;          -- horloge systeme
          o_SSD       : out   std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
          o_led       : out   std_logic_vector (3 downto 0); -- vers DELs de la carte Zybo
          o_led6_r    : out   std_logic;                     -- vers DEL rouge de la carte Zybo
          o_pmodled   : out   std_logic_vector (7 downto 0)  -- vers connecteur pmod 8 DELs
          );
end AppCombi_top;


architecture BEHAVIORAL of AppCombi_top is
   signal ADCBin :std_logic_vector (3 downto 0);
   signal parit :  std_logic_vector(3 downto 0);
   signal  A2_3 :  std_logic_vector(2 downto 0);
   signal Dizaines:  std_logic_vector(3 downto 0);
   signal code_signe:  std_logic_vector(3 downto 0);
   signal Unites_ns:  std_logic_vector(3 downto 0);
   signal Unite_s:  std_logic_vector(3 downto 0);

   signal codevalide : std_logic;
   constant nbreboutons     : integer := 4;    -- Carte Zybo Z7
   constant freq_sys_MHz    : integer := 125;  -- 125 MHz 
   
   signal d_s_1Hz           : std_logic;
   signal clk_5MHz          : std_logic;
   --
   signal d_opa             : std_logic_vector (3 downto 0):= "0000";   -- operande A
   signal d_opb             : std_logic_vector (3 downto 0):= "0000";   -- operande B
   signal d_cin             : std_logic := '0';                         -- retenue entree
   signal d_sum             : std_logic_vector (3 downto 0):= "0000";   -- somme
   signal d_cout            : std_logic := '0';                         -- retenue sortie
   --
   signal d_AFF0            : std_logic_vector (3 downto 0):= "0000";
   signal d_AFF1            : std_logic_vector (3 downto 0):= "0000";
 
component Bin2DualBCD is
 Port ( 
        ADCbin : in std_logic_vector(3 downto 0);
        Dizaines: out std_logic_vector(3 downto 0);
        code_signe: out std_logic_vector(3 downto 0);
        Unites_ns: out std_logic_vector(3 downto 0);
        Unite_s: out std_logic_vector(3 downto 0)
    );
    
end component; 
component dec3a8 is
    Port (
    A2_3 : in std_logic_vector(2 downto 0);
    LED : out std_logic_vector(7 downto 0)
    );
end component; 
component thermo2bin is
    Port (
        ADCth : in std_logic_vector (11 downto 0);
        ADCBin : out std_logic_vector (3 downto 0); 
        err : out std_logic
    );
end component;
component Fact2_3 is
    Port (
        N : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        A2_3 : out std_logic_vector(2 downto 0)
    );
end component;
component mux is
    Port (
    ADCbin : in std_logic_vector(3 downto 0);
    Dizaines: in std_logic_vector(3 downto 0);
    Unites_ns: in std_logic_vector(3 downto 0);
    Code_signe: in std_logic_vector(3 downto 0);
    Unite_s: in std_logic_vector(3 downto 0);
    erreur: in std_logic;
    BTN: in std_logic_vector(3 downto 0);
    S2 : in std_logic;
    DAFF0: out std_logic_vector(3 downto 0); --droite
    DAFF1: out std_logic_vector(3 downto 0) -- gauche
    );
end component;

component parite is
  Port (
    s1 : in std_logic;
    ABCin : in std_logic_vector(3 downto 0);
    parite : out std_logic
  );
end component;


 component synchro_module_v2 is
   generic (const_CLK_syst_MHz: integer := freq_sys_MHz);
      Port ( 
           clkm        : in  STD_LOGIC;  -- Entr�e  horloge maitre
           o_CLK_5MHz  : out STD_LOGIC;  -- horloge divise utilise pour le circuit             
           o_S_1Hz     : out  STD_LOGIC  -- Signal temoin 1 Hz
            );
      end component;  
      
COMPONENT Add4bits
    Port (X: in std_logic_vector(3 downto 0);
          Y: in std_logic_vector(3 downto 0);
          S: out std_logic_vector(3 downto 0);
           OVERFLOW : out STD_LOGIC
          );
end COMPONENT;

   component septSegments_Top is
    Port (   clk          : in   STD_LOGIC;                      -- horloge systeme, typique 100 MHz (preciser par le constante)
             i_AFF0       : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0
             i_AFF1       : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0     
             o_AFFSSD_Sim : out string(1 to 2);
             o_AFFSSD     : out  STD_LOGIC_VECTOR (7 downto 0)  
           );
   end component;
   
signal pariteOut : std_logic;
begin
  paritee : parite port map
   (
    s1 => i_S1,
    ABCin => ADCBin ,
    parite => pariteOut
  );
  
  o_led(0) <= pariteOut;
  o_DEL2 <= pariteOut;
    thermo: thermo2bin port map( 
        ADCth  => i_ADC_th,
        ADCBin => ADCBin, 
        err => codevalide
      );
 dec: dec3a8 
    port map (
    A2_3 => A2_3,
    LED => o_pmodled
    );
 fact : Fact2_3 
    port map (
        N => ADCBin,
        Cin => '0',
        A2_3 =>A2_3
    );
  BCD: Bin2DualBCD 
 port map ( 
        ADCbin => ADCBin,
        Dizaines => Dizaines,
        code_signe => code_signe,
        Unites_ns => Unites_ns,
        Unite_s => Unite_s
    );
      muxi : mux port map(
        ADCbin  => ADCBin,
        Dizaines => Dizaines,
        Unites_ns => Unites_ns,
        Code_signe => code_signe,
        Unite_s => Unite_s,
        erreur => codevalide,
        BTN => i_btn,
        S2 => i_S2,
        DAFF0 => d_AFF0,   --droite
        DAFF1 => d_AFF1 -- gauche
      );
    inst_synch : synchro_module_v2
     generic map (const_CLK_syst_MHz => freq_sys_MHz)
         port map (
            clkm         => sysclk,
            o_CLK_5MHz   => clk_5MHz,
            o_S_1Hz      => o_DEL3
           
        );  

   inst_aff :  septSegments_Top 
       port map (
           clk    => clk_5MHz,
           -- donnee a afficher definies sur 8 bits : chiffre hexa position 1 et 0
           i_AFF1  => d_AFF1, 
           i_AFF0  => d_AFF0,
           o_AFFSSD_Sim   => open,   -- ne pas modifier le "open". Ligne pour simulations seulement.
           o_AFFSSD       => o_SSD   -- sorties directement adaptees au connecteur PmodSSD
       );
                           
     
   

   
end BEHAVIORAL;


