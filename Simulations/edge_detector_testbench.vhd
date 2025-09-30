library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_edge_detector is
end tb_edge_detector;

architecture behavior of tb_edge_detector is

    -- Component declaration of the UUT
    component edge_detector
        port (
            CLK          : in  std_logic;
            input        : in  std_logic;
            output_pulse : out std_logic
        );
    end component;

    -- Signals to drive the UUT
    signal CLK          : std_logic := '0';
    signal input_signal : std_logic := '0';
    signal output_pulse : std_logic;

    -- Clock period
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: edge_detector port map (
        CLK          => CLK,
        input        => input_signal,
        output_pulse => output_pulse
    );

    -- Clock generation process
    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        wait for 20 ns;
        input_signal <= '1'; -- Rising edge
        wait for 10 ns;
        input_signal <= '0'; -- Falling edge
        wait for 20 ns;
        input_signal <= '1'; -- Another rising edge
        wait for 10 ns;
        input_signal <= '1'; -- No edge
        wait for 10 ns;
        input_signal <= '0'; -- Falling edge
        wait for 10 ns;
        input_signal <= '1'; -- Rising edge again
        wait for 30 ns;

        wait;
    end process;

end behavior;
