LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY half_adder IS
    PORT (
        A, B  : IN  STD_LOGIC;
        S     : OUT STD_LOGIC;
        Cout  : OUT STD_LOGIC
    );
END half_adder;

ARCHITECTURE Behavioral OF half_adder IS
BEGIN
    -- Sum calculation (XOR)
    S    <= A XOR B;

    -- Carry calculation (AND)
    Cout <= A AND B;
END Behavioral;
