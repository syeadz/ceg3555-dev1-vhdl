library ieee;
use ieee.std_logic_1164.all;

entity h3to8 is
  port
  (
    abc : in std_logic_vector(2 downto 0);
    y   : out std_logic_vector(7 downto 0);
    en  : in std_logic
  );
end;

architecture behav of h3to8 is
  signal ab       : std_logic_vector(1 to 0);
  signal c_and_en0 : std_logic;
  signal c_and_en1 : std_logic;
  signal y_out    : std_logic_vector(7 downto 0);
begin
  c_and_en0 <= (not abc(2)) and en;
  c_and_en1 <= abc(2) and en;
  

  decoder0 : entity work.if2to4
    port map
    (
      ab => abc(1 downto 0),
      en => c_and_en0,
      y  => y_out(3 downto 0)
    );

  decoder1 : entity work.if2to4
    port
    map (
    ab => abc(1 downto 0),
    en => c_and_en1,
    y  => y_out(7 downto 4)
    );

  y <= y_out;
end architecture;