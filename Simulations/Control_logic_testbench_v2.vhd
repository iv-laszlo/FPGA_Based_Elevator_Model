library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Control_logic_testbench is
end Control_logic_testbench;

architecture Behavioral of Control_logic_testbench is

    -- Component Declaration
    component Control_logic is
        Port (
            Next_cmd            : in STD_LOGIC_VECTOR(2 downto 0);
            Position_input      : in STD_LOGIC_VECTOR(2 downto 0);
            ENA                 : in STD_LOGIC;
            CLK                 : in STD_LOGIC;
            Validity_in         : in STD_LOGIC;
            RST                 : in STD_LOGIC;
            Store_empty         : in STD_LOGIC;
            Motor_up            : out STD_LOGIC;
            Motor_down          : out STD_LOGIC;
            Button_reset        : out STD_LOGIC_VECTOR(6 downto 0);
            Store_R_ENA         : out STD_LOGIC
--            test_out            : out STD_LOGIC
        );
    end component;

    -- Signals
    signal Next_cmd       : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal Position_input : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal ENA            : STD_LOGIC := '0';
    signal CLK            : STD_LOGIC := '0';
    signal Validity_in    : STD_LOGIC := '0';
    signal RST            : STD_LOGIC := '0';
    signal Store_empty    : STD_LOGIC := '0';
    signal Motor_up       : STD_LOGIC := '0';
    signal Motor_down     : STD_LOGIC := '0';
    signal Button_reset   : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal Store_R_ENA    : STD_LOGIC;
--    signal test_out       : STD_LOGIC;

    -- Clock period
    constant clk_period : time := 20 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Control_logic
        port map (
            Next_cmd       => Next_cmd,
            Position_input => Position_input,
            ENA            => ENA,
            CLK            => CLK,
            Validity_in    => Validity_in,
            RST            => RST,
            Store_empty    => Store_empty,
            Motor_up       => Motor_up,
            Motor_down     => Motor_down,
            Button_reset   => Button_reset,
            Store_R_ENA    => Store_R_ENA
--            test_out       => test_out
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
        wait for clk_period/2;
        Position_input <= "010";  -- floor 2
        RST <= '1';
        Store_empty <= '1';
        wait for clk_period;
        RST <= '0';
        wait for clk_period * 2;
        Store_empty <= '0';
        wait for clk_period * 10;

        -- Simulate outside button U1 at floor 0
        Position_input <= "001";  -- floor 0
        Next_cmd <= "010";        -- U1 button
        ENA <= '1';
        wait for clk_period;
        ENA <= '0';
        Validity_in <= '0';
        wait for clk_period;
        Validity_in <= '1';          -- Valid command captured
        wait for clk_period * 10;

        -- Simulate reaching floor 1
        Position_input <= "010";  -- floor 1
        ENA <= '1';
        wait for clk_period;
        ENA <= '0';
        Store_empty <= '1';
        wait for clk_period * 10;

        -- Simulate inside button B2 from floor 1
        Next_cmd <= "111";        -- B2 button
        Store_empty <= '0';
        ENA <= '1';
        wait for clk_period;
        ENA <= '0';
        Validity_in <= '0';
        wait for clk_period * 2;
        Validity_in <= '1';
        wait for clk_period * 10;

        -- Simulate reaching floor 2
        Position_input <= "100";
        ENA <= '1';
        wait for clk_period;
        ENA <= '0';
        Store_empty <= '1';
        wait for clk_period * 10;

        wait;
    end process;

end Behavioral;