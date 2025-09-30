library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity FIFO_testbench is
end FIFO_testbench;
 
architecture Behavioral of FIFO_testbench is

component Register_FIFO is
    Generic ( 
        FIFO_SIZE  : integer;  -- Number of entries in the FIFO
        FIFO_WIDTH : integer   -- Data length in FIFO
    );
                  
    Port (
        clk         : in std_logic;        -- Clock signal
        reset       : in std_logic;        -- Reset signal
        data_in     : in std_logic_vector(2 downto 0); -- Data input
        write_en    : in std_logic;        -- Write enable
        read_en     : in std_logic;        -- Read enable
        data_out    : out std_logic_vector(2 downto 0); -- Data output
        full        : out std_logic;       -- Full flag
        empty       : out std_logic        -- Empty flag
    );
  end component Register_FIFO;
   
  signal clk         : std_logic := '0';
  signal reset       : std_logic := '0';
  signal data_in     : std_logic_vector(2 downto 0) := (others => '0'); 
  signal write_en    : std_logic := '0';
  signal read_en     : std_logic := '0';
  signal data_out    : std_logic_vector(2 downto 0);
  signal full        : std_logic;
  signal empty       : std_logic;
   
 
  constant FIFO_SIZE : integer := 2;  -- Number of entries in the FIFO
  constant FIFO_WIDTH : integer := 3;  -- Data length in FIFO
  constant clk_period         : time := 20 ns;                                        
 
   
begin
 
  uut: Register_FIFO
    generic map (
      FIFO_WIDTH => FIFO_WIDTH,
      FIFO_SIZE => FIFO_SIZE
      )
    port map (
      clk      => clk,     
      reset    => reset,    
      data_in  => data_in,  
      write_en => write_en, 
      read_en  => read_en,  
      data_out => data_out, 
      full     => full,     
      empty    => empty    
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
    write_en <= '1';
    data_in <= "001";
    wait until clk = '1';
    write_en <= '0';
    wait until clk = '1';
    write_en <= '1';
    data_in <= "010";
    wait until clk = '1';
    write_en <= '0';
    wait until clk = '1';
    wait until clk = '1';
    read_en <= '1';
    wait until clk = '1';
    read_en <= '0';
    wait until clk = '1';
    read_en <= '1';
    wait until clk = '1';
    read_en <= '0';
    wait until clk = '1';
 
  end process;
   
   
end Behavioral;