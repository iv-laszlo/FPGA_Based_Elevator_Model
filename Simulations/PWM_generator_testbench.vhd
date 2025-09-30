library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pwm_generator_testbench is
end pwm_generator_testbench;

architecture Behavioral of pwm_generator_testbench is

    -- Component declaration of the UUT
    component pwm
        generic(
            DUTY_PERIOD : NATURAL;
            CYCLE_PERIOD : NATURAL);
        port(
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            Output : out STD_LOGIC;
            ENA : in STD_LOGIC);
    end component;

    -- Signals to drive the UUT
    signal CLK          : std_logic := '0';
    signal RST : STD_LOGIC := '0';
    signal Output : std_logic := '0';
    signal ENA : std_logic := '0';

    -- Clock period
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: pwm
            generic map(
                DUTY_PERIOD => 4,
                CYCLE_PERIOD => 10)
            port map(
                CLK => CLK,
                RST => RST,
                Output => Output,
                ENA => ENA);

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
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 60 ns;
        ENA <= '1';
        wait for 500 ns;
        ENA <= '0';
        
        wait;
    end process;

end Behavioral;