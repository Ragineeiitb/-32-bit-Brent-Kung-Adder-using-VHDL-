library IEEE;
use IEEE.std_logic_1164.all;
package gates is


component andgate is
port (A, B: in std_logic;
prod: out std_logic);

end component andgate;

component xorgate is
port (A, B: in std_logic; uneq: out std_logic);
end component xorgate;

component xyzgate is
port (A, B,C: in std_logic; abc: out std_logic);
end component xyzgate;

component Cin_map_G is
port (A, B,cin: in std_logic; Bit0_G: out std_logic);
end component Cin_map_G;
end package ;

library IEEE;
use IEEE.std_logic_1164.all;
entity andgate is
port (A, B: in std_logic;
prod: out std_logic);
end entity andgate;
architecture arch of andgate is
begin
prod <= A AND B AFTER 62 ps;
end architecture arch;

library IEEE;
use IEEE.std_logic_1164.all;
entity xorgate is
port (A, B: in std_logic;
uneq: out std_logic);
end entity xorgate;
architecture arch of xorgate is
begin
uneq <= A XOR B AFTER 104 ps;
end architecture arch;

library IEEE;
use IEEE.std_logic_1164.all;
entity xyzgate is
port (A, B, C: in std_logic;
abc: out std_logic);
end entity xyzgate;
architecture arch of xyzgate is
begin
abc <= A OR (B AND C) AFTER 94 ps;
end architecture arch;
-- A + C.(A+B) with a arch architecture

library IEEE;
use IEEE.std_logic_1164.all;
entity Cin_map_G is
port(A, B, Cin: in std_logic;
Bit0_G: out std_logic);
end entity Cin_map_G;
architecture arch of Cin_map_G is
begin
Bit0_G <= (A AND B) OR (Cin AND (A OR B)) AFTER 104 ps;
end architecture arch;
