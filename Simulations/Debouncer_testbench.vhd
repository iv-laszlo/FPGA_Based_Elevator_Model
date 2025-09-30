library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Debouncer_testbench is
end Debouncer_testbench;

architecture Behavioral of Debouncer_testbench is

    -- Component declaration
    component Debouncer
        port (
            CLK    : in STD_LOGIC;
            btn_on : in STD_LOGIC;
            output : out STD_LOGIC
        );
    end component;

    -- Signals
    signal CLK     : STD_LOGIC := '0';
    signal btn_on  : STD_LOGIC := '0';
    signal output  : STD_LOGIC;

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Debouncer
        port map (
            CLK    => CLK,
            btn_on => btn_on,
            output => output
        );

    -- Clock process
    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for clk_period / 2;
            CLK <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial stable low
        btn_on <= '0';
        wait for 100 ns;

        -- Simulate bouncing: fast toggle for a few cycles
        btn_on <= '1';
        wait for 10 ns;
        btn_on <= '0';
        wait for 10 ns;
        btn_on <= '1';
        wait for 10 ns;
        btn_on <= '0';
        wait for 10 ns;
        btn_on <= '1';

        -- Now hold high steadily (debouncer should eventually output '1')
        wait for 300 ns;

        -- Simulate release with bounce
        btn_on <= '0';
        wait for 10 ns;
        btn_on <= '1';
        wait for 10 ns;
        btn_on <= '0';
        wait for 10 ns;
        btn_on <= '1';
        wait for 10 ns;
        btn_on <= '0';

        -- Hold low steadily
        wait for 300 ns;

        wait;
    end process;

end Behavioral;