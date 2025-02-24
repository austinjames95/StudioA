--MAKE TOPDOWN

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY four_bit_full_adder IS
    PORT (
        A, B    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin     : IN  STD_LOGIC;
        S       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout    : OUT STD_LOGIC
    );
END four_bit_full_adder;

ARCHITECTURE Structural OF four_bit_full_adder IS
    -- Component Declaration
    COMPONENT bit_full_adder IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Cin : IN STD_LOGIC;
        S : OUT STD_LOGIC;
        Cout : OUT STD_LOGIC);
    END COMPONENT bit_full_adder;

    -- Internal carry signals
    SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2: STD_LOGIC;

BEGIN
    -- Instantiate 1-bit full adders
    FA0: bit_full_adder PORT MAP (
      A => A(0), 
      B => B(0), 
      Cin => Cin, 
      S => S(0), 
      Cout => c0);
      
    FA1: bit_full_adder PORT MAP (
      A => A(1), 
      B => B(1), 
      Cin => c0, 
      S => S(1), 
      Cout => c1);
    FA2: bit_full_adder PORT MAP (
      A => A(2), 
      B => B(2), 
      Cin => c1, 
      S => S(2), 
      Cout => c2);
    FA3: bit_full_adder PORT MAP (
      A => A(3), 
      B => B(3), 
      Cin => c2, 
      S => S(3), 
      Cout => Cout);

END Structural;
