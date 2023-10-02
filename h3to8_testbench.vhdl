library ieee;
use ieee.std_logic_1164.all;

entity h3to8_testbench is
end entity h3to8_testbench;

architecture testbench of h3to8_testbench is
  signal abc_tb : std_logic_vector(2 downto 0);
  signal en_tb  : std_logic;
  signal y_tb   : std_logic_vector(7 downto 0);
begin
  uut : entity work.h3to8
    port map
    (
      abc => abc_tb,
      en  => en_tb,
      y   => y_tb
    );

  stimulus : process
  begin
    -- Test case 1: en = '1', abc = "000"
    en_tb  <= '1';
    abc_tb <= "000";
    wait for 10 ns;
    assert y_tb = "00000001" report "Test case 1 failed";

    -- Test case 2: en = '1', abc = "001"
    abc_tb <= "001";
    wait for 10 ns;
    assert y_tb = "00000010" report "Test case 2 failed";

    -- Test case 2: en = '1', abc = "001"
    abc_tb <= "010";
    wait for 10 ns;
    assert y_tb = "00000100" report "Test case 3 failed";

    -- Test case 2: en = '1', abc = "001"
    abc_tb <= "011";
    wait for 10 ns;
    assert y_tb = "00001000" report "Test case 4 failed";

    -- Test case 2: en = '1', abc = "001"
    abc_tb <= "100";
    wait for 10 ns;
    assert y_tb = "00010000" report "Test case 5 failed";

    -- Test case 2: en = '1', abc = "001"
    abc_tb <= "101";
    wait for 10 ns;
    assert y_tb = "00100000" report "Test case 6 failed";

    -- Test case 2: en = '1', abc = "001"
    abc_tb <= "110";
    wait for 10 ns;
    assert y_tb = "01000000" report "Test case 7 failed";

    -- Test case 2: en = '1', abc = "001"
    abc_tb <= "111";
    wait for 10 ns;
    assert y_tb = "10000000" report "Test case 8 failed";

    -- Test case 9: en = '0', abc = "110"
    en_tb  <= '0';
    abc_tb <= "110";
    wait for 10 ns;
    assert y_tb = "00000000" report "Test case 9 failed";

    wait;
  end process;
end architecture testbench;