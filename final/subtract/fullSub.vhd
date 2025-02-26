library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Full Subtractor using Half Subtractors
entity full_subtractor is 
    Port ( 
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Bin : in  STD_LOGIC;
        D : out STD_LOGIC;  -- Difference output
        Bout : out STD_LOGIC  -- Borrow output
    );
end full_subtractor;

architecture Behavioral of full_subtractor is
begin
    -- Difference calculation
    D <= A XOR B XOR Bin;

    -- Borrow calculation
    Bout <= (NOT A AND B) OR (NOT A AND Bin) OR (B AND Bin);

end Behavioral;
