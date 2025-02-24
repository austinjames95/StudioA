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

architecture Behavioral of full_adder is
begin
  -- Sum Calc
  S <= A XOR B XOR Cin;

  -- Carry Calc
  Cout <= (A AND B) or (B AND Cin) or (A AND Cin);
END Behavioral;
