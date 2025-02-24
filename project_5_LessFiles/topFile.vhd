LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY top_module IS
    PORT (
        SW : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Switches for A and B inputs
        carry_in : IN  STD_LOGIC;                     -- External carry-in
        clk : IN  STD_LOGIC;                     -- Clock for multiplexing display
        segments : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);  -- 7-segment display outputs
        anodes : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)   -- Anodes for digit selection
    );
END top_module;

ARCHITECTURE Structural OF top_module IS

    -- Internal Signals
    SIGNAL A, B : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Cout : STD_LOGIC;
    SIGNAL seg0, seg1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL seg2, seg3 : STD_LOGIC_VECTOR(6 DOWNTO 0);

    -- Component Declarations
    COMPONENT four_bit_full_adder
        PORT (
            A, B : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            Cin : IN  STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            Cout : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT display_driver
        PORT (
            inputs : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            seg_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;

    COMPONENT Mux4by7
        PORT (
            Input0  : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            Input1  : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            Input2  : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            Input3  : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            Control : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            Output  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;

    COMPONENT LEDdisplay
        PORT (
            clk : IN  STD_LOGIC;
            seg0 : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            seg1 : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            seg2 : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            seg3 : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
            seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            an : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

BEGIN

    -- Assign Inputs
    A <= SW(3 DOWNTO 0);  -- Lower 4 switches for A
    B <= SW(7 DOWNTO 4);  -- Upper 4 switches for B

    -- Instantiate 4-bit Full Adder
    ADDER: four_bit_full_adder PORT MAP (
        A => A,
        B => B,
        Cin => carry_in,
        S => S,
        Cout => Cout);

    -- Instantiate Display Drivers
    DISP0: display_driver PORT MAP (inputs => A, seg_out => seg0);   -- Display A
    DISP1: display_driver PORT MAP (inputs => B, seg_out => seg1);   -- Display B
    DISP2: display_driver PORT MAP (inputs => S, seg_out => seg2);   -- Display Sum
    DISP3: display_driver PORT MAP (inputs => ("000" & Cout), seg_out => seg3); -- Display Carry-out

    -- Instantiate LED Display Controller (Multiplexing)
    DISPLAY_CTRL: LEDdisplay PORT MAP (
        clk => clk,
        seg0 => seg0,
        seg1 => seg1,
        seg2 => seg2,
        seg3 => seg3,
        seg => segments,
        an => anodes);

END Structural;
