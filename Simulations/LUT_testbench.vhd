library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_lut7to3 is
end tb_lut7to3;

architecture behavior of tb_lut7to3 is

    -- Component declaration of the unit under test (UUT)
    component lut7to3
        Port (
            input  : in  STD_LOGIC_VECTOR(6 downto 0);
            output : out STD_LOGIC_VECTOR(2 downto 0);
            ENA_LUT    : in STD_LOGIC
        );
    end component;

    -- Signals to connect to the UUT
    signal input : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal ENA_LUT : STD_LOGIC := '1';
    signal output : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: lut7to3 Port Map (
        input => input,
        output => output,
        ENA_LUT => ENA_LUT
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test x0
        input(0) <= '1'; wait for 10 ns;
        input(0) <= '0';

        -- Test x1
        input(1) <= '1'; wait for 10 ns;
        input(1) <= '0';

        -- Test x2
        input(2) <= '1'; wait for 10 ns;
        input(2) <= '0';

        -- Test x3
        input(3) <= '1'; wait for 10 ns;
        input(3) <= '0';

        -- Test x4
        input(4) <= '1'; wait for 10 ns;
        input(4) <= '0';

        -- Test x5
        input(5) <= '1'; wait for 10 ns;
        input(5) <= '0';

        -- Test x6
        input(6) <= '1'; wait for 10 ns;
        input(6) <= '0';

        -- Finish simulation
        wait;
    end process;

end behavior;
