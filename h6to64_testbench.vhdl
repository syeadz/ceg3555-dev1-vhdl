library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity h6to64_testbench is
end entity h6to64_testbench;

architecture tb_behav of h6to64_testbench is
  -- Signals for the testbench
  signal abcdef_in    : std_logic_vector(5 downto 0);
  signal en_in        : std_logic;
  signal y_out        : std_logic_vector(63 downto 0);
  signal should_equal : std_logic_vector(63 downto 0);

begin
  -- Instantiate the h6to64 decoder
  uut : entity work.h6to64
    port map
    (
      abcdef => abcdef_in,
      en     => en_in,
      y      => y_out
    );

  -- Stimulus process
  stimulus : process
  begin
    en_in     <= '0';
    abcdef_in <= "101010";
    wait for 10 ns;
    assert y_out = x"0000000000000000" report "y_out is not all zeros";

    en_in     <= '1';
    abcdef_in <= "000000";
    wait for 10 ns;
    assert y_out = x"0000000000000001" report "y_out is not all zeros";

    for i in 1 to 63 loop
        abcdef_in <= std_logic_vector(to_unsigned(i, 6));  -- Set abcdef_in to the value of i
        wait for 10 ns;
    end loop;

    wait;
  end process;
end architecture tb_behav;