library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
  port
  (
    s, a, b : in std_logic;
    f       : out std_logic
  );
end;

architecture behav of mux2to1 is
begin
  process (s, a, b)
  begin
    if (s = '0' and a = '1') then
      f <= '1';
    elsif (s = '1' and b = '1') then
        f <= '1';
    else
        f <= '0';
    end if;
  end process;
end architecture;