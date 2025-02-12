----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2025 02:49:08 PM
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

-- Full Adder using Half Adders
entity full_adder is Port ( 
    A : in  STD_LOGIC;
    B : in  STD_LOGIC;
    Cin : in  STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC);
end full_adder;

architecture Structural of full_adder is
    -- Declare internal signals
    signal S1, C1, C2 : STD_LOGIC;

    -- Component Declaration for Half Adder
    component half_adder
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               S : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

begin
    -- First Half Adder: A and B
    HA1: half_adder port map (A => A, B => B, S => S1, Cout => C1);

    -- Second Half Adder: S1 and Cin
    HA2: half_adder port map (A => S1, B => Cin, S => S, Cout => C2);

    -- Final Carry-Out: OR of Half Adder carries
    Cout <= C1 OR C2;

end Structural;