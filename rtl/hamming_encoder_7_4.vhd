-- Create Date: 17.08.2022 18:41:07
-- Module Name: hamming_encoder_7_4 - Behavioral
-- Description: (7,4) HAMMING ENCODER 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hamming_encoder_7_4 is
port ( 
		data_i    : in std_logic_vector(3 downto 0);
		hamming_o : out std_logic_vector(6 downto 0)
		
);
end hamming_encoder_7_4;

architecture Behavioral of hamming_encoder_7_4 is

signal parity : std_logic_vector(2 downto 0);

begin

parity(0) <= data_i(0)  xor  data_i(1) xor data_i(3);
parity(1) <= data_i(0)  xor  data_i(2) xor data_i(3);
parity(2) <= data_i(1)  xor  data_i(2) xor data_i(3);


hamming_o <= data_i(3 downto 1) & parity(2) & data_i(0) & parity(1 downto 0);


end Behavioral;
