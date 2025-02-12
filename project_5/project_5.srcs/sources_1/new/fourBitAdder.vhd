----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2025 03:00:36 PM
-- Design Name: 
-- Module Name: fourBitAdder - Behavioral
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

-- 4-bit Full Adder Entity
entity four_bit_full_adder is
    Port ( A     : in  STD_LOGIC_VECTOR(3 downto 0);
           B     : in  STD_LOGIC_VECTOR(3 downto 0);
           Cin   : in  STD_LOGIC;
           S     : out STD_LOGIC_VECTOR(3 downto 0);
           Cout  : out STD_LOGIC);
end four_bit_full_adder;

architecture Structural of four_bit_full_adder is
    -- Internal carry signals
    signal c1, c2, c3: STD_LOGIC;

    -- Component Declaration for Full Adder
    component full_adder
        Port ( A     : in  STD_LOGIC;
               B     : in  STD_LOGIC;
               Cin   : in  STD_LOGIC;
               S     : out STD_LOGIC;
               Cout  : out STD_LOGIC);
    end component;

begin
    -- Instantiate Full Adders for each bit
    FA0: full_adder port map (A => A(0), B => B(0), Cin => Cin, S => S(0), Cout => c1);
    FA1: full_adder port map (A => A(1), B => B(1), Cin => c1, S => S(1), Cout => c2);
    FA2: full_adder port map (A => A(2), B => B(2), Cin => c2, S => S(2), Cout => c3);
    FA3: full_adder port map (A => A(3), B => B(3), Cin => c3, S => S(3), Cout => Cout);

end Structural;
