library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity CMD_store_testbench is
end CMD_store_testbench;
 
architecture Behavioral of CMD_store_testbench is

component CMD_store is
    Port   (
            CMD_input    : in STD_LOGIC_VECTOR(2 downto 0);
            Write_enable : in STD_LOGIC;
            Reset        : in STD_LOGIC;
            Clk          : in STD_LOGIC;
            Read_enable  : in STD_LOGIC;
            CMD_output   : out STD_LOGIC_VECTOR(2 downto 0);
            Empty        : out STD_LOGIC;
            LED_states   : in STD_LOGIC_VECTOR(6 downto 0);
            Validity_out : out STD_LOGIC;
            Store_full   : out STD_LOGIC
            );
end component CMD_store;
   
 signal CMD_input    : STD_LOGIC_VECTOR(2 downto 0);
 signal Write_enable : STD_LOGIC;
 signal Reset        : STD_LOGIC := '0';
 signal Clk          : STD_LOGIC;
 signal Read_enable  : STD_LOGIC := '0';
 signal CMD_output   : STD_LOGIC_VECTOR(2 downto 0);
 signal Empty        : STD_LOGIC;
 signal LED_states   : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
 signal Validity_out : STD_LOGIC := '0';
 signal Store_full   : STD_LOGIC;
 
 constant clk_period : time := 20 ns;
   
begin
 
  uut: CMD_store
    port map (
      CMD_input    => CMD_input,     
      Write_enable => Write_enable,    
      Reset        => Reset,  
      Clk          => Clk, 
      Read_enable  => Read_enable,  
      CMD_output   => CMD_output, 
      Empty        => Empty,     
      LED_states   => LED_states,
      Validity_out => Validity_out,
      Store_full   => Store_full    
      );
 
clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 10 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 10 ns signal is '1'.
   end process;

 
  simulation_process : process is
  begin
    wait until clk = '1';
    Write_enable <= '1';
    CMD_input <= "001";
    wait until clk = '1';
    Write_enable <= '0';
    wait until clk = '1';
    Write_enable <= '1';
    CMD_input <= "010";
    wait until clk = '1';
    Write_enable <= '0';
    wait until clk = '1';
    wait until clk = '1';
    LED_states <= "0000001";
    Read_enable <= '1';
    wait until clk = '1';
    Read_enable <= '0';
    wait until clk = '1';
    Read_enable <= '1';
    LED_states <= "0000000";
    wait until clk = '1';
    Read_enable <= '0';
    wait until clk = '1';
    wait for 100 ns; 
 
  end process;
   
   
end Behavioral;