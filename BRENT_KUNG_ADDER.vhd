library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.gates.all;
entity brent_kung_adder is
port(A,B: in std_logic_vector(31 downto 0);
cin:in std_logic;
sum:out std_logic_vector(31 downto 0);
cout:out std_logic);
end entity;

architecture arch of brent_kung_adder is
signal p0,g0:std_logic_vector(31 downto 0);
signal p1,g1:std_logic_vector(15 downto 0);
signal p2,g2:std_logic_vector(7 downto 0);
signal p3,g3:std_logic_vector(3 downto 0);
signal p4,g4:std_logic_vector(1 downto 0);
signal carry:std_logic_vector(31 downto 1);
signal p5,g5:std_logic;

begin
GP0:for i in 0 to 31 generate 
G_0: andgate port map (a(i),b(i),g0(i));
P_0: xorgate port map( a(i),b(i),p0(i));
end generate GP0;

GP1: for i in 0 to 15 generate
G_1:xyzgate port map (g0(2*i+1),p0(2*i+1),g0(2*i),g1(i));
P_1:andgate port map(p0(2*i),p0(2*i+1),p1(i));
end generate GP1;

GP2: for i in 0 to 7 generate
G_2:xyzgate port map (g1(2*i+1),p1(2*i+1),g1(2*i),g2(i));
P_2:andgate port map(p1(2*i),p1(2*i+1),p2(i));
end generate GP2;

GP3: for i in 0 to 3 generate
G_1:xyzgate port map (g2(2*i+1),p2(2*i+1),g2(2*i),g3(i));
P_1:andgate port map(p2(2*i),p2(2*i+1),p3(i));
end generate GP3;

GP4: for i in 0 to 1 generate
G_1:xyzgate port map (g3(2*i+1),p3(2*i+1),g3(2*i),g4(i));
P_1:andgate port map(p3(2*i),p3(2*i+1),p4(i));
end generate GP4;

G_5:xyzgate port map(g4(1),p4(1),g4(0),g5);
P_5:andgate port map (p4(1),p4(0),p5);
 
carry1:xyzgate port map(g0(0),p0(0),cin,carry(1));
carry2:xyzgate port map(g1(0),p1(0),cin,carry(2));
carry3:xyzgate port map(g2(0),p2(0),cin,carry(4));
carry4:xyzgate port map(g3(0),p3(0),cin,carry(8));
carry5:xyzgate port map(g4(0),p4(0),cin,carry(16));
carry6:xyzgate port map(g5,p5,cin,cout);
carry7:xyzgate port map(g0(2),p0(2),carry(2),carry(3));
carry8:xyzgate port map(g0(4),p0(4),carry(4),carry(5));
carry9:xyzgate port map(g1(2),p1(2),carry(4),carry(6));
carry10:xyzgate port map (g0(6),p0(6),carry(6),carry(7));
carry11:xyzgate port map (g0(8),p0(8),carry(8),carry(9));
carry12:xyzgate port map(g1(4),p1(4),carry(8),carry(10));
carry13:xyzgate port map (g0(10),p0(10),carry(10),carry(11));
carry14:xyzgate port map (g2(2),p2(2),carry(8),carry(12));
carry15:xyzgate port map(g0(12),p0(12),carry(12),carry(13));
carry16:xyzgate port map (g1(6),p1(6),carry(12),carry(14));
carry17:xyzgate port map (g0(14),p0(14),carry(14),carry(15));

carry19:xyzgate port map(g0(16),p0(16),carry(16),carry(17));
carry20:xyzgate port map (g1(8),p1(8),carry(16),carry(18));
carry21:xyzgate port map (g0(18),p0(18),carry(18),carry(19));
carry22:xyzgate port map (g1(9),p1(9),carry(18),carry(20));
carry23:xyzgate port map (g0(20),p0(20),carry(20),carry(21));
carry24:xyzgate port map (g1(10),p1(10),carry(20),carry(22));
carry25:xyzgate port map(g0(22),p0(22),carry(22),carry(23));
carry26:xyzgate port map (g1(12),p1(12),carry(22),carry(24));
carry27:xyzgate port map (g0(24),p0(24),carry(24),carry(25));
carry28:xyzgate port map (g1(13),p1(13),carry(25),carry(26));
carry29:xyzgate port map (g0(26),p0(26),carry(26),carry(27));
carry30:xyzgate port map (g1(14),p1(14),carry(26),carry(28));
carry31:xyzgate port map(g0(29),p0(29),carry(28),carry(29));
carry32:xyzgate port map(g1(15),p1(15),carry(28),carry(30));
carry33:xyzgate port map(g0(30),p0(30),carry(30),carry(31));

sum1: for i in 1 to 31 generate 
psum:xorgate port map (p0(i),carry(i),sum(i));
end generate sum1;
psum1:xorgate port map (p0(0),cin,sum(0));
end architecture arch;




 
