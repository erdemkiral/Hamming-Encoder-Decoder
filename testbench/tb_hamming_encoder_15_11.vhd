-- Create Date: 17.08.2022 18:45:56
-- Module Name: tb_hamming_encoder_15_11 - Behavioral
-- Description: (15,11) HAMMING ENCODER  TESTBENCH


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb_hamming_encoder_15_11 is
end tb_hamming_encoder_15_11;

architecture Behavioral of tb_hamming_encoder_15_11 is

component hamming_encoder is
port ( 
		data_i    : in std_logic_vector(10 downto 0);
		hamming_o : out std_logic_vector(14 downto 0)
);
end component;

signal data_i    : std_logic_vector(10 downto 0) := (others => '0');
signal hamming_o : std_logic_vector(14 downto 0);


begin

uut : hamming_encoder 
port map ( 
		data_i    => data_i  ,  
		hamming_o => hamming_o 
);


P_SIM : process begin 

for i in 0 to 2047 loop 
	data_i <= conv_std_logic_vector(i,data_i'length); wait for 10 ns;
end loop;
data_i <= "00100100111"; wait for 10 ns;
data_i <= "01010010011"; wait for 10 ns;

assert false report "sim done" severity failure ;	

end process P_SIM;


end Behavioral;
