library ieee;
use ieee.std_logic_1164.all;

entity JK_FF_sim is
end JK_FF_sim;

architecture testbench of JK_FF_sim is

component JK_FF is
port(J, K, clk, rst : in std_logic;
Q, Qbar : out std_logic
);
end component;

signal J, K, clk, rst : std_logic;
signal Q, Qbar : std_logic;

begin
uut: JK_FF port map(
J => J,
K => K,
clk => clk,
rst => rst,
Q => Q,
Qbar => Qbar);

clock: process
begin
clk <= '1';
wait for 10 ns;
clk <= '0';
wait for 10 ns;
end process;

Force: process
begin
J <= '0';
K <= '0';
rst <= '0';
wait for 20 ns;

J <= '0';
K <= '1';
rst <= '0';
wait for 20 ns;

J <= '1';
K <= '0';
rst <= '0';
wait for 20 ns;

J <= '1';
K <= '1';
rst <= '0';
wait for 40 ns;

J <= '1';
K <= '1';
rst <= '0';
wait for 40 ns;

J <= '0';
K <= '0';
rst <= '0';
wait for 20 ns;

J <= '0';
K <= '0';
rst <= '1';
wait for 20 ns;
end process;
end testbench;