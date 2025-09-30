library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CMD_generator_testbench is
end CMD_generator_testbench;

architecture behavior of CMD_generator_testbench is

    -- Component under test
    component CMD_generator
        Port (
            Edge_detected_input  : in  STD_LOGIC_VECTOR(6 downto 0);
            ENA                  : in  STD_LOGIC;
            JK_reset_in          : in  STD_LOGIC_VECTOR(6 downto 0);
            CLK                  : in STD_LOGIC;
            Latched_Output_U0    : out STD_LOGIC;
            Latched_Output_U1    : out STD_LOGIC;
            Latched_Output_D1    : out STD_LOGIC;
            Latched_Output_D2    : out STD_LOGIC;
            Latched_Output_B0    : out STD_LOGIC;
            Latched_Output_B1    : out STD_LOGIC;
            Latched_Output_B2    : out STD_LOGIC;
            LUT_out              : out STD_LOGIC_VECTOR(2 downto 0);
            Store_ENA            : out STD_LOGIC;
            test_out             : out STD_LOGIC_VECTOR(6 downto 0);
            Store_full           : in STD_LOGIC
            );
    end component;

    -- Testbench signals
    signal Edge_detected_Input  : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal ENA                  : STD_LOGIC := '0';
    signal JK_reset_in          : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal CLK                  : STD_LOGIC := '1';
    signal Latched_Output_U0    : STD_LOGIC;
    signal Latched_Output_U1    : STD_LOGIC;
    signal Latched_Output_D1    : STD_LOGIC;
    signal Latched_Output_D2    : STD_LOGIC;
    signal Latched_Output_B0    : STD_LOGIC;
    signal Latched_Output_B1    : STD_LOGIC;
    signal Latched_Output_B2    : STD_LOGIC;
    signal LUT_Out              : STD_LOGIC_VECTOR(2 downto 0);
    signal Store_ENA            : STD_LOGIC;
    signal Store_full           : STD_LOGIC := '0';
    signal test_out             : STD_LOGIC_VECTOR(6 downto 0);

    -- Clock period
    constant clk_period : time := 20 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: CMD_generator
        port map (
            Edge_detected_Input => Edge_detected_Input,
            ENA                  => ENA,
            CLK                  => CLK,
            JK_reset_in          => JK_reset_in,
            Latched_Output_U0    => Latched_Output_U0,
            Latched_Output_U1    => Latched_Output_U1,
            Latched_Output_D1    => Latched_Output_D1,
            Latched_Output_D2    => Latched_Output_D2,
            Latched_Output_B0    => Latched_Output_B0,
            Latched_Output_B1    => Latched_Output_B1,
            Latched_Output_B2    => Latched_Output_B2,
            LUT_Out              => LUT_Out,
            Store_ENA            => Store_ENA,
            test_out             => test_out,
            Store_full           => Store_full
        );

    -- Clock Process
    clk_process :process
    begin
         clk <= '0';
         wait for clk_period/2;  --for 10 ns signal is '0'.
         clk <= '1';
         wait for clk_period/2;  --for next 10 ns signal is '1'.
    end process;

    -- Stimulus process
    stim_proc: process
    begin
            
        --Putting inputs 
        wait for 10 ns;   
        ENA <= '1';
        Edge_detected_Input(0) <= '1';
        JK_reset_in(0) <= '1';
        wait for 20 ns;
        ENA <= '0';
        Edge_detected_Input(0) <= '0';
        wait for 200 ns;
        
        ENA <= '1';
        Edge_detected_Input(1) <= '1';
        wait for 20 ns;
        ENA <= '0';
        Edge_detected_Input(1) <= '0';
        wait for 200 ns;
        
        ENA <= '1';
        Edge_detected_Input(2) <= '1';
        wait for 20 ns;
        ENA <= '0';
        Edge_detected_Input(2) <= '0';
        wait for 200 ns;
        
        ENA <= '1';
        Edge_detected_Input(3) <= '1';
        wait for 20 ns;
        ENA <= '0';
        Edge_detected_Input(3) <= '0';
        wait for 200 ns;
        
        ENA <= '1';
        Edge_detected_Input(4) <= '1';
        wait for 20 ns;
        ENA <= '0';
        Edge_detected_Input(4) <= '0';
        wait for 200 ns;
        
        ENA <= '1';
        Edge_detected_Input(5) <= '1';
        wait for 20 ns;
        ENA <= '0';
        Edge_detected_Input(5) <= '0';
        wait for 200 ns;
        
        ENA <= '1';
        Edge_detected_Input(6) <= '1';
        wait for 20 ns;
        ENA <= '0';
        Edge_detected_Input(6) <= '0';
        wait for 200 ns;
        
        ENA <= '1';
        Edge_detected_Input <= "0000000";
        wait for 20 ns;
        ENA <= '0';
        wait for 200 ns;

        
        --Resetting SR latches
        JK_reset_in(0) <= '1';
        wait for 20 ns;
        JK_reset_in(0) <= '0';
        wait for 200 ns;
        
        JK_reset_in(1) <= '1';
        wait for 20 ns;
        JK_reset_in(1) <= '0';
        wait for 200 ns;
        
        JK_reset_in(2) <= '1';
        wait for 20 ns;
        JK_reset_in(2) <= '0';
        wait for 200 ns;
        
        JK_reset_in(3) <= '1';
        wait for 20 ns;
        JK_reset_in(3) <= '0';
        wait for 200 ns;
        
        JK_reset_in(4) <= '1';
        wait for 20 ns;
        JK_reset_in(4) <= '0';
        wait for 200 ns;
        
        JK_reset_in(5) <= '1';
        wait for 20 ns;
        JK_reset_in(5) <= '0';
        wait for 200 ns;
        
        JK_reset_in(6) <= '1';
        wait for 20 ns;
        JK_reset_in(6) <= '0';
        wait for 200 ns;
        
        --SR_Reset_In <= "1111111";
        

        -- Finish simulation
        wait;
    end process;

end behavior;