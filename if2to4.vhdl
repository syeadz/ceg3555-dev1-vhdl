library ieee;
use ieee.std_logic_1164.all;

entity if2to4 is
  port
  (
    ab : in std_logic_vector(1 downto 0);
    y  : out std_logic_vector(3 downto 0);
    en : in std_logic
  );
end;

architecture behav of if2to4 is
begin
  process (ab, en)
  begin
    if en = '0' then
      y <= "0000";
    elsif (ab = "00") then
      y <= "0001";
    elsif (ab = "01") then
      y <= "0010";
    elsif (ab = "10") then
      y <= "0100";
    elsif (ab = "11") then
      y <= "1000";
    else
      y <= "0000";
    end if;
  end process;
end architecture;