Top_level_parity:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level_parity is
    Port ( 
        sw, sw2     : in  STD_LOGIC_VECTOR (3 downto 0);
        sum_out     : out STD_LOGIC_VECTOR (3 downto 0);
        led_parity  : buffer STD_LOGIC
    );
end top_level_parity;

architecture Behavioral of top_level_parity is
    signal ones_counter : integer <= 0;
    signal full_sum : STD_LOGIC_VECTOR(4 downto 0);
begin
    ones_count <= to_integer(unsigned(sw(0))) +
                  to_integer(unsigned(sw(1))) +
                  to_integer(unsigned(sw(2))) +
                  to_integer(unsigned(sw(3))) +
                  to_integer(unsigned(sw2(0))) +
                  to_integer(unsigned(sw2(1))) +
                  to_integer(unsigned(sw2(2))) +
                  to_integer(unsigned(sw2(3)));

    full_sum <= std_logic_vector(to_unsigned(ones_count, 5));
    sum_out <= full_sum(3 downto 0);
    led_parity <= sw(0) xor sw(1) xor sw(2) xor sw(3) xor sw2(0) xor sw2(1) xor sw2(2) xor sw2(3);

end Behavioral;

