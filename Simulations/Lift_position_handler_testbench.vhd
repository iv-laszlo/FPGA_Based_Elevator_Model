library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Lift_position_handler_testbench is
end Lift_position_handler_testbench;

architecture Behavioral of Lift_position_handler_testbench is

component Lift_position_handler 
      Port (
            S0A_input             : in STD_LOGIC;
            S0B_input             : in STD_LOGIC;
            S1A_input             : in STD_LOGIC;
            S1B_input             : in STD_LOGIC;
            S2A_input             : in STD_LOGIC;
            S2B_input             : in STD_LOGIC;
            CLK                   : in STD_LOGIC;
            Debounced_output      : out STD_LOGIC_VECTOR(2 downto 0);
            Pulse_out             : out STD_LOGIC);
end component;

    --input signals
    signal S0A_input             : STD_LOGIC := '0';
    signal S0B_input             : STD_LOGIC := '0';
    signal S1A_input             : STD_LOGIC := '0';
    signal S1B_input             : STD_LOGIC := '0';
    signal S2A_input             : STD_LOGIC := '0';
    signal S2B_input             : STD_LOGIC := '0';
    signal CLK                   : STD_LOGIC := '0';
    --output signals
    signal Debounced_output      : STD_LOGIC_VECTOR(2 downto 0);
    signal Pulse_out             : STD_LOGIC;
    
    constant clk_period          : time := 1 ns;

begin

uut: Lift_position_handler
    port map(S0A_input              => S0A_input,            
             S0B_input              => S0B_input,            
             S1A_input              => S1A_input,            
             S1B_input              => S1B_input,            
             S2A_input              => S2A_input,           
             S2B_input              => S2B_input,            
             CLK                    => CLK,                 
             Debounced_output       => Debounced_output,
             Pulse_out              => Pulse_out);
             

clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for half clock period, signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next half clock period, signal is '1'.
   end process;
          
stim_process: process
begin
    
    wait for 10 ns;
    S0A_input <= '1';
    S0B_input <= '1';
    wait for 30 ns;
    
    S0A_input <= '0';
    S0B_input <= '0';
    S1A_input <= '1';
    S1B_input <= '1';
    wait for 30 ns;
    S1A_input <= '0';
    S1B_input <= '0';

    
    wait;
end process; 
             
end Behavioral;