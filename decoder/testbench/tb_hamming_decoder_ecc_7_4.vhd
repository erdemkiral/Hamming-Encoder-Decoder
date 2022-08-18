-- Create Date: 18.08.2022 17:09:34
-- Module Name: tb_hamming_decoder_ecc_7_4 - Behavioral
-- Description: (7,4) HAMMING DECODER TESTBENCH



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;



entity tb_hamming_decoder_ecc_7_4 is

end tb_hamming_decoder_ecc_7_4;

architecture Behavioral of tb_hamming_decoder_ecc_7_4 is

component hamming_decoder_ecc_7_4 is
port ( 
			hamming_i  : in std_logic_vector(6 downto 0);
			data_o	   : out std_logic_vector(3 downto 0)
);
end component;

signal  hamming_i  : std_logic_vector(6 downto 0) := (others => '0');
signal  data_o	   : std_logic_vector(3 downto 0) ;



begin


uut : hamming_decoder_ecc_7_4 
port map ( 
			hamming_i  => hamming_i,
			data_o	   => data_o	 
);


P_SIM : process begin 

for i in 0 to 127 loop 
	hamming_i <= conv_std_logic_vector(i,hamming_i'length); wait for 10 ns;
end loop;




assert false report "sim done" severity failure ;	

end process P_SIM;


end Behavioral;
