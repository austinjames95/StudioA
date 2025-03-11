library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_level is
    Port ( 
        an : out  STD_LOGIC_VECTOR (3 downto 0);
        sw, sw2 : in  STD_LOGIC_VECTOR (3 downto 0);
        seg : out  STD_LOGIC_VECTOR (6 downto 0));
end top_level;

architecture Behavioral of top_level is

COMPONENT four_bit_full_adder IS
    PORT (
        A, B  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin   : IN  STD_LOGIC;
        S     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout  : OUT STD_LOGIC);
END COMPONENT;

signal sum : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin

process(sw, sw2)
    variable temp_sum : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    temp_sum := (others => '0'); 
    for i in 0 to 3 loop
        if sw(i) = '1' then
            temp_sum := temp_sum + (sw2 & "0000") srl i; 
        end if;
    end loop;
    sum <= temp_sum;
end process;

an <= "1110"; 

-- Display only the lower 4 bits of the product on 7-segment display
with sum(3 downto 0) select
seg <=
"1000000" when x"0" ,
"1111001" when x"1" ,
"0100100" when x"2" ,
"0110000" when x"3" ,
"0011001" when x"4" ,
"0010010" when x"5" ,
"0000010" when x"6" ,
"1111000" when x"7" ,
"0000000" when x"8" ,
"0010000" when x"9" ,
"0001000" when x"A" ,
"0000011" when x"B" ,
"1000110" when x"C" ,
"0100001" when x"D" ,
"0000110" when x"E" ,
"0001110" when others;

end Behavioral;
