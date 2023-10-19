library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port
  (
    clk, reset : in std_logic;
    load       : in std_logic;
    w1, w2     : in std_logic;
    z          : out std_logic
  );
end;

architecture mealy of fsm is
  component enARdFF_2
    port
    (
      i_resetBar : in std_logic;
      i_d        : in std_logic;
      i_enable   : in std_logic;
      i_clock    : in std_logic;
      o_q        : out std_logic;
      o_qBar     : out std_logic
    );
  end component;

  signal not_reset              : std_logic;
  signal w                      : std_logic;
  signal y0, y1, y2             : std_logic;
  signal ff0_on, ff1_on, ff2_on : std_logic;
begin
  not_reset <= not reset;
  w         <= w1 and w2;

  ff2_on <= (w and y2) or (w and y0 and y1);
  ff2 : enARdFF_2
  port map
  (
    i_resetBar => not_reset,
    i_d        => ff2_on,
    i_enable   => load,
    i_clock    => clk,
    o_q        => y2,
    o_qBar     => open
  );

  ff1_on <= (w and y0 and (not y1)) or (w and (not y0) and y1);
  ff1 : enARdFF_2
  port
  map (
  i_resetBar => not_reset,
  i_d        => ff1_on,
  i_enable   => load,
  i_clock    => clk,
  o_q        => y1,
  o_qBar     => open
  );

  ff0_on <= (w and (not y0) and (not y2));
  ff0 : enARdFF_2
  port
  map (
  i_resetBar => not_reset,
  i_d        => ff0_on,
  i_enable   => load,
  i_clock    => clk,
  o_q        => y0,
  o_qBar     => open
  );

  z <= y2;
end;
