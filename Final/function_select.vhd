library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_select is
    Port ( 
        Input0 : in  STD_LOGIC_VECTOR (3 downto 0);
        Input1 : in  STD_LOGIC_VECTOR (3 downto 0);
        Input2 : in  STD_LOGIC_VECTOR (3 downto 0);
        Input3 : in  STD_LOGIC_VECTOR (4 downto 0);
        control : in  STD_LOGIC_VECTOR (1 downto 0);
        Output : out  STD_LOGIC_VECTOR (4 downto 0)
    );
end function_select;

ARCHITECTURE Procedural of function_select IS
BEGIN
    PROCESS (Input0, Input1, Input2, control)
    BEGIN
        CASE control is
            when "00"   => Output <= '0' & Input0;  -- Extend 4-bit to 5-bit
            when "01"   => Output <= '0' & Input1;  -- Extend 4-bit to 5-bit
            when "10"   => Output <= '0' & Input2;  -- Extend 4-bit to 5-bit
            when others => Output <= Input3;        -- 5-bit input as is
        END CASE;
    END PROCESS;
END Procedural;
