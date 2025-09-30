library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_8_to_1_testbench is
end mux_8_to_1_testbench;

architecture Behavioral of mux_8_to_1_testbench is

    -- Component declaration
    component mux_8_to_1 is
        Port (
            input   : in STD_LOGIC_VECTOR(7 downto 0);
            sel     : in STD_LOGIC_VECTOR (2 downto 0);
            output  : out STD_LOGIC
        );
    end component;

    -- Signals
    signal input   : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sel     : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal output  : STD_LOGIC;

begin

    -- Instantiate the MUX
    uut: mux_8_to_1
        port map (
            input   => input,
            sel     => sel,
            output  => output
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Set a unique input pattern for testing
        input <= "10101011";  -- input(7) = '1', input(6) = '0', ..., input(0) = '1'

        -- Test all selection cases
        sel <= "000"; wait for 10 ns;  -- input(7) = 1
        sel <= "001"; wait for 10 ns;  -- input(0) = 1
        sel <= "010"; wait for 10 ns;  -- input(1) = 1
        sel <= "011"; wait for 10 ns;  -- input(2) = 0
        sel <= "100"; wait for 10 ns;  -- input(3) = 1
        sel <= "101"; wait for 10 ns;  -- input(4) = 0
        sel <= "110"; wait for 10 ns;  -- input(5) = 1
        sel <= "111"; wait for 10 ns;  -- input(6) = 0

        wait;
    end process;

end Behavioral;