-- Create Date: 18.08.2022 01:52:38
-- Module Name: hamming_decoder_ecc_7_4 - Behavioral
-- Description: Hamming decoder(7,4) and error detector and corrector.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity hamming_decoder_ecc_7_4 is
port ( 
			hamming_i  : in std_logic_vector(6 downto 0);
			data_o	   : out std_logic_vector(3 downto 0)
);
end hamming_decoder_ecc_7_4;

architecture Behavioral of hamming_decoder_ecc_7_4 is

signal detectionbits : std_logic_vector(2 downto 0);
signal hamming_carry : std_logic := '0' ;
signal logic0noop    : std_logic := '0' ;

begin



detectionbits(0) <=  hamming_i(0) xor hamming_i(2) xor hamming_i(4) xor hamming_i(6);
detectionbits(1) <=  hamming_i(1) xor hamming_i(2) xor hamming_i(5) xor hamming_i(6);
detectionbits(2) <=  hamming_i(3) xor hamming_i(4) xor hamming_i(5) xor hamming_i(6);


with detectionbits select  hamming_carry <= logic0noop     when "000", 
											logic0noop     when "001", 
											logic0noop     when "010", 
											logic0noop     when "100", 
											
											not hamming_i(2)  when "011",  				    
											not hamming_i(4)  when "101",  
											not hamming_i(5)  when "110",  
											not hamming_i(6)  when "111",  
											logic0noop        when others;
		
with detectionbits select  data_o <= hamming_i(6 downto 4) & hamming_i(3)						 when "000", 
									 hamming_i(6 downto 4) & hamming_i(3)						 when "001", 
									 hamming_i(6 downto 4) & hamming_i(3)						 when "010", 
									 hamming_i(6 downto 4) & hamming_i(3)						 when "100", 

									 hamming_i(6 downto 4) & hamming_carry                       when "011",
									 hamming_i(6 downto 5) & hamming_carry & hamming_i(2)        when "101",
									 hamming_i(6) & hamming_carry & hamming_i(4) & hamming_i(2)  when "110",
									 hamming_carry & hamming_i(5 downto 4) & hamming_i(2)        when "111",
									 hamming_i(6 downto 4) & hamming_i(3)						 when others;


end Behavioral;
