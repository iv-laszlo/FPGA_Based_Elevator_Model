library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Reset_formatter_testbench is
end Reset_formatter_testbench;

architecture Behavioral of Reset_formatter_testbench is

    -- Component Declaration
    component Reset_formatter is
    Port(
        Reset_button        : in STD_LOGIC;
        Reset_pulse         : out STD_LOGIC;
        CLK                 : in STD_LOGIC
        );
    end component;

    -- Signals
    signal Reset_button   : STD_LOGIC;
    signal Reset_pulse    : STD_LOGIC;
    signal CLK            : STD_LOGIC := '0';

    -- Clock period
    constant clk_period : time := 20 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Reset_formatter
    Port map (
        Reset_button => Reset_button,
        Reset_pulse  => Reset_pulse,
        CLK          => CLK
        );

    -- Clock Process
    clk_process :process
    begin
         clk <= '0';
         wait for clk_period/2;  --for 10 ns signal is '0'.
         clk <= '1';
         wait for clk_period/2;  --for next 10 ns signal is '1'.
    end process;

    -- Stimulus Process
    stim_proc: process
    begin
        -- Initial Reset
        Reset_button <= '1';
        wait for clk_period;
        Reset_button <= '0';
        wait for clk_period * 2;
        Reset_button <= '1';
        wait for clk_period * 25;
        Reset_button <= '0';
    end process;

end Behavioral;