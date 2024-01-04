library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
  
entity Clock_Divider is
port ( clk,reset: in std_logic;
clock_out: out std_logic;
led:out std_logic);
end Clock_Divider;
  
architecture bhv of Clock_Divider is
  
signal count: integer:=1;
signal count_1:std_logic_vector(3 downto 0):="0000";
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset)
begin
if(reset='1') then
count<=1;
tmp<='0';
elsif(clk'event and clk='1') then
count <=count+1;
if (count =62500000) then
tmp <= NOT tmp;
count <=1;
end if;
end if;
clock_out <= tmp;
end process;

--process(tmp,count_1)
--begin

--if(tmp'event and tmp='1')then
--count_1<=count_1 +"0001";
--if(count_1="1111")then
--count_1<="0000";
--end if;
----else
----count_1<="0000";
--end if;
--led<=count_1;
--end process;


process(tmp)
begin
if(tmp='1')then
led<='1';

else
led<='0';

end if;
end process;
end bhv;