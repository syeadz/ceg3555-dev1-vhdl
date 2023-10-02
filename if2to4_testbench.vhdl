library ieee;
use ieee.std_logic_1164.all;

entity if2to4_testbench is
end if2to4_testbench;

architecture behav of if2to4_testbench is
  component if2to4 is
    port
    (
      ab : in std_logic_vector(1 downto 0);
      y  : out std_logic_vector(3 downto 0);
      en : in std_logic
    );
  end component;
  signal ab_in : std_logic_vector(1 downto 0);
  signal y_out : std_logic_vector(3 downto 0);
  signal en_in : std_logic;
begin
  uut : if2to4 port map
  (
    ab => ab_in,
    y => y_out,
    en => en_in
  );

  stim_proc : process
  begin
    en_in <= '1';
    ab_in <= "00";
    wait for 10 ns;
    assert y_out = "0001" report "m0 failed";

    en_in <= '1';
    ab_in <= "01";
    wait for 10 ns;
    assert y_out = "0010" report "m1 failed";

    en_in <= '1';
    ab_in <= "10";
    wait for 10 ns;
    assert y_out = "0100" report "m2 failed";

    en_in <= '1';
    ab_in <= "11";
    wait for 10 ns;
    assert y_out = "1000" report "m3 failed";

    en_in <= '0';
    ab_in <= "11";
    wait for 10 ns;
    assert y_out = "0000" report "enable failed";

    report "If2to1 testbench finished";
    wait;
  end process;
end architecture behav;