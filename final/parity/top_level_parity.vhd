library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level_parity is
    Port ( 
        sw, sw2 : in STD_LOGIC_VECTOR (3 downto 0);
        led_parity : out STD_LOGIC;
        seg : out STD_LOGIC_VECTOR (6 downto 0);
        an  : out STD_LOGIC_VECTOR (3 downto 0)
    );
end top_level;

architecture Behavioral of top_level_parity is
    signal mid : STD_LOGIC_VECTOR(3 downto 0);
begin

    led_parity <= '1' when sw(0) = sw2(0) else '0';

    -- Enable only one display (e.g., the rightmost digit)
    an <= "1110";
    mid <= sw;

    with mid select
    seg <=
        "1000000" when "0000", 
        "1111001" when "0001", 
        "0100100" when "0010", 
        "0110000" when "0011", 
        "0011001" when "0100", 
        "0010010" when "0101", 
        "0000010" when "0110", 
        "1111000" when "0111", 
        "0000000" when "1000", 
        "0010000" when "1001", 
        "0001000" when "1010", 
        "0000011" when "1011", 
        "1000110" when "1100", 
        "0100001" when "1101", 
        "0000110" when "1110", 
        "0001110" when others; 

end Behavioral;
