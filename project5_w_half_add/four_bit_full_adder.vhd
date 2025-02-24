LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY four_bit_full_adder IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout : OUT STD_LOGIC;
      
END four_bit_full_adder;

ARCHITECTURE Structural OF four_bit_full_adder IS
      
    -- Full Adder Component
    COMPONENT bit_full_adder IS
        PORT (
            A : IN  STD_LOGIC;
            B : IN STD_LOGIC;
            Cin : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC);
      
    END COMPONENT bit_full_adder;

    -- Half Adder Component
    COMPONENT half_adder IS
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC;
        );
    END COMPONENT half_adder;
    -- SIGNAL DECLARATION
    SIGNAL c0, c1, c2 : STD_LOGIC;
      
BEGIN
    -- Instantiate 4 Full Adders
    FA0: bit_full_adder PORT MAP (A(0), B(0), Cin,  S(0), c0);
    FA1: bit_full_adder PORT MAP (A(1), B(1), c0,  S(1), c1);
    FA2: bit_full_adder PORT MAP (A(2), B(2), c1,  S(2), c2);
    FA3: bit_full_adder PORT MAP (A(3), B(3), c2,  S(3), Cout);

END ARCHITECTURE Structural;
