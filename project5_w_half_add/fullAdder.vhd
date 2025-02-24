
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Full Adder using Half Adders
entity full_adder is Port ( 
    A : in  STD_LOGIC;
    B : in  STD_LOGIC;
    Cin : in  STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
    -- Componenet Delaration for half adder
    COMPONENT half_adder is Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
    end COMPONENT half_adder;
    -- Internal Signals
    SIGNAL S1, C1, C2 : STD_LOGIC;

    -- First Half Adder
    HA1: half_adder PORT MAP (
        A => A,
        B => B,
        S => S1,
        Cout => C1
    );

    -- Second Half Adder
    HA2: half_adder PORT MAP (
        A => S1,
        B => Cin,
        S => S,
        Cout => C2
    );

    -- Carry-Out Logic
    Cout <= C1 OR C2;

END ARCHITECTURE Structural;
