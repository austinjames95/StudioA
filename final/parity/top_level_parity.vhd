library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( 
        sw, sw2 : in STD_LOGIC_VECTOR (3 downto 0);
        led_parity : out STD_LOGIC
    );
end top_level;

architecture Behavioral of top_level is

begin
    led_parity <= '1' when sw(0) = sw2(0) else '0';

end Behavioral;
