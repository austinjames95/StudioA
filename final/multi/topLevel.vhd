library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity top_level_multi is
    Port ( 
        an : out STD_LOGIC_VECTOR (3 downto 0);
        sw, sw2 : in STD_LOGIC_VECTOR (3 downto 0);
        seg : out STD_LOGIC_VECTOR (6 downto 0);
        sum_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end top_level;

architecture Behavioral of top_level is

function shift_left_4bit(input: STD_LOGIC_VECTOR(3 downto 0); shift: integer) return STD_LOGIC_VECTOR is
    variable temp : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    temp(3 downto 0) := input; 

    if shift = 1 then
        temp := temp(6 downto 0) & '0';
    elsif shift = 2 then
        temp := temp(5 downto 0) & "00";
    elsif shift = 3 then
        temp := temp(4 downto 0) & "000";
    end if;

    return temp;
end function;

signal sum : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin

process(sw, sw2) 
    variable temp_sum : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    variable shifted_value : STD_LOGIC_VECTOR(7 downto 0);
begin
    temp_sum := (others => '0');

    for i in 0 to 3 loop
        if sw(i) = '1' then
            shifted_value := shift_left_4bit(sw2, i);
            temp_sum := std_logic_vector(unsigned(temp_sum) + unsigned(shifted_value));
        end if;
    end loop;

    sum <= temp_sum;
end process;

sum_out <= sum;

an <= "1110"; 

with sum(3 downto 0) select
seg <=
"1000000" when x"0", 
"1111001" when x"1", 
"0100100" when x"2", 
"0110000" when x"3", 
"0011001" when x"4", 
"0010010" when x"5", 
"0000010" when x"6", 
"1111000" when x"7", 
"0000000" when x"8", 
"0010000" when x"9", 
"0001000" when x"A",
"0000011" when x"B", 
"1000110" when x"C", 
"0100001" when x"D", 
"0000110" when x"E", 
"0001110" when others;

end Behavioral;
