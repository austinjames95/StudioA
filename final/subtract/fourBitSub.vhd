LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY four_bit_full_subtractor IS
    PORT (
        A, B : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        Bin : IN  STD_LOGIC;
        D : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Bout : OUT STD_LOGIC);
END four_bit_full_subtractor;

ARCHITECTURE Structural OF four_bit_full_subtractor IS
    -- Component Declaration
    COMPONENT full_subtractor IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Bin : IN STD_LOGIC;
        D : OUT STD_LOGIC;
        Bout : OUT STD_LOGIC);
    END COMPONENT full_subtractor;

    -- Internal borrow signals
    SIGNAL b0 : STD_LOGIC;
    SIGNAL b1 : STD_LOGIC;
    SIGNAL b2 : STD_LOGIC;

BEGIN
    -- Instantiate 1-bit full subtractors
    FS0: full_subtractor 
    PORT MAP (
      A => A(0), 
      B => B(0), 
      Bin => Bin, 
      D => D(0), 
      Bout => b0);

    FS1: full_subtractor 
    PORT MAP (
      A => A(1), 
      B => B(1), 
      Bin => b0, 
      D => D(1), 
      Bout => b1);

    FS2: full_subtractor 
    PORT MAP (
      A => A(2), 
      B => B(2), 
      Bin => b1, 
      D => D(2), 
      Bout => b2);

    FS3: full_subtractor 
    PORT MAP (
      A => A(3), 
      B => B(3), 
      Bin => b2, 
      D => D(3), 
      Bout => Bout);

END Structural;
