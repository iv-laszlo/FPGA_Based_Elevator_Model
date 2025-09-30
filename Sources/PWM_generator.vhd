library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity pwm is
    generic(
            DUTY_PERIOD : NATURAL := 7700; -- 7700 @ 14%, 6050 @ 11%
            CYCLE_PERIOD : NATURAL := 55000); --55000 in reality
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Output : out STD_LOGIC := '0';
        ENA : in STD_LOGIC);
end pwm;

architecture Behavioral of pwm is

begin

    process(CLK, RST, ENA)
    variable Counter : NATURAL RANGE 0 to CYCLE_PERIOD;
    begin
        if RST = '1' then
            Counter := 0;
        else
            if rising_edge(CLK) then
                if Counter < CYCLE_PERIOD then
                    Counter := Counter + 1;
                else
                    Counter := 0;
                end if;
            else
                null;
            end if;
            
            if ENA = '1' then
                if Counter <= DUTY_PERIOD then
                    Output <= '1';
                else
                    Output <= '0';
                end if;
            else
                Output <= '0';
            end if;
        
        end if;    
    end process;

end Behavioral;