library ieee;
use ieee.std_logic_1164.all;

entity h6to64 is
  port
  (
    abcdef : in std_logic_vector(5 downto 0);
    y      : out std_logic_vector(63 downto 0);
    en     : in std_logic
  );
end entity h6to64;

architecture behav of h6to64 is
  signal y_out : std_logic_vector(63 downto 0);
  signal y_en  : std_logic_vector(7 downto 0);
begin

  decoder0 : entity work.h3to8
    port map
    (
      abc => abcdef(5 downto 3),
      en  => en,
      y   => y_en
    );

  decoder1 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(0),
    y   => y_out(7 downto 0)
    );

  decoder2 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(1),
    y   => y_out(15 downto 8)
    );

  decoder3 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(2),
    y   => y_out(23 downto 16)
    );

  decoder4 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(3),
    y   => y_out(31 downto 24)
    );

  decoder5 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(4),
    y   => y_out(39 downto 32)
    );

  decoder6 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(5),
    y   => y_out(47 downto 40)
    );

  decoder7 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(6),
    y   => y_out(55 downto 48)
    );

  decoder8 : entity work.h3to8
    port
    map
    (
    abc => abcdef(2 downto 0),
    en  => y_en(7),
    y   => y_out(63 downto 56)
    );

  y <= y_out;
end architecture;