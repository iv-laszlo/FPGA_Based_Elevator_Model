library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity User_button_handler_testbench is
end User_button_handler_testbench;

architecture Behavioral of User_button_handler_testbench is

component User_button_handler
    Port (U0_input             : in STD_LOGIC;
          U1_input             : in STD_LOGIC;
          D1_input             : in STD_LOGIC;
          D2_input             : in STD_LOGIC;
          B0_input             : in STD_LOGIC;
          B1_input             : in STD_LOGIC;
          B2_input             : in STD_LOGIC;
          CLK                  : in STD_LOGIC;
          Edge_detected_output : out STD_LOGIC_VECTOR(6 downto 0);
          Pulse_out            : out STD_LOGIC);
end component;

    --input signals
    signal U0_input             : STD_LOGIC := '0';
    signal U1_input             : STD_LOGIC := '0';
    signal D1_input             : STD_LOGIC := '0';
    signal D2_input             : STD_LOGIC := '0';
    signal B0_input             : STD_LOGIC := '0';
    signal B1_input             : STD_LOGIC := '0';
    signal B2_input             : STD_LOGIC := '0';
    signal CLK                  : STD_LOGIC := '0';
    --output signals
    signal Edge_detected_output : STD_LOGIC_VECTOR(6 downto 0);
    signal Pulse_out            : STD_LOGIC;
    
    constant clk_period         : time := 1 ns;

begin

uut: User_button_handler
    port map(U0_input             => U0_input,            
             U1_input             => U1_input,            
             D1_input             => D1_input,            
             D2_input             => D2_input,            
             B0_input             => B0_input,            
             B1_input             => B1_input,            
             B2_input             => B2_input,            
             CLK                  => CLK,                 
             Edge_detected_output => Edge_detected_output,
             Pulse_out            => Pulse_out);
             

clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 10 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 10 ns signal is '1'.
   end process;
          
stim_process: process
begin
    U0_input <= '1';
    wait for 10 ns;
    U0_input <= '0';
    B0_input <= '1';
    wait for 10 ns;
    B0_input <= '0';
    wait for 10 ns;
    U0_input <= '1';
    wait for 25 ns;
    U0_input <= '0';
    B0_input <= '1';
    wait for 25 ns;
    B0_input <= '0';
    

    
    wait;
end process; 
             
             

end Behavioral;