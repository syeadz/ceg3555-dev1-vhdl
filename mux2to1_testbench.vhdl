library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_testbench is
end mux2to1_testbench;

architecture behav of mux2to1_testbench is
  component mux2to1 is
    port
    (
      s, a, b : in std_logic;
      f       : out std_logic
    );
  end component;
  signal sel  : std_logic;
  signal a_in  : std_logic;
  signal b_in  : std_logic;
  signal f_out : std_logic;
begin
    uut : mux2to1 port map (
        s => sel,
        a => a_in,
        b => b_in,
        f => f_out
    );

    stim_proc : process
    begin
        sel <= '0';
        a_in <= '0';
        b_in <= '0';
        wait for 10 ns;
        assert f_out = '0' report "m0 failed";
        sel <= '0';
        a_in <= '0';
        b_in <= '1';
        wait for 10 ns;
        assert f_out = '0' report "m1 failed";
        sel <= '0';
        a_in <= '1';
        b_in <= '0';
        wait for 10 ns;
        assert f_out = '1' report "m2 failed";
        sel <= '0';
        a_in <= '1';
        b_in <= '1';
        wait for 10 ns;
        assert f_out = '1' report "m3 failed";
        sel <= '1';
        a_in <= '0';
        b_in <= '0';
        wait for 10 ns;
        assert f_out = '0' report "m4 failed";
        sel <= '1';
        a_in <= '0';
        b_in <= '1';
        wait for 10 ns;
        assert f_out = '1' report "m5 failed";
        sel <= '1';
        a_in <= '1';
        b_in <= '0';
        wait for 10 ns;
        assert f_out = '0' report "m6 failed";
        sel <= '1';
        a_in <= '1';
        b_in <= '1';
        wait for 10 ns;
        assert f_out = '1' report "m7 failed";
        report "Mux2to1 testbench finished";
        wait;
    end process;
end architecture behav;