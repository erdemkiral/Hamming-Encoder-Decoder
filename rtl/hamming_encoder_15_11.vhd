-- Create Date: 16.08.2022 16:32:14
-- Module Name: hamming_encoder - Behavioral

-- Description: (15,11) HAMMING ENCODER 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hamming_encoder_15_11 is
port ( 
		data_i    : in std_logic_vector(10 downto 0);
		hamming_o : out std_logic_vector(14 downto 0)
);
end hamming_encoder_15_11;

architecture Behavioral of hamming_encoder_15_11 is

signal parity : std_logic_vector(3 downto 0);


begin

parity(0) <= data_i(0) xor data_i(1) xor data_i(3) xor data_i(4) xor data_i(6) xor data_i(8) xor data_i(10);
parity(1) <= data_i(0) xor data_i(2) xor data_i(3) xor data_i(5) xor data_i(6) xor data_i(9) xor data_i(10);
parity(2) <= data_i(1) xor data_i(2) xor data_i(3) xor data_i(7) xor data_i(8) xor data_i(9) xor data_i(10);
parity(3) <= data_i(4) xor data_i(5) xor data_i(6) xor data_i(7) xor data_i(8) xor data_i(9) xor data_i(10);

hamming_o <= data_i(10 downto 4) & parity(3) & data_i(3 downto 1) & parity(2) & data_i(0) & parity(1 downto 0);



end Behavioral;
