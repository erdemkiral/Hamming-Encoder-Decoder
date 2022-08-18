-- Create Date: 17.08.2022 00:35:51
-- Module Name: hamming_encoder_31_26 - Behavioral
-- Description: (31,26) HAMMING ENCODER 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hamming_encoder_31_26 is
port ( 
		data_i    : in std_logic_vector(25 downto 0);
		hamming_o : out std_logic_vector(30 downto 0)
);
end hamming_encoder_31_26;

architecture Behavioral of hamming_encoder_31_26 is

signal parity : std_logic_vector(4 downto 0);

-- signal parity1_layer1 : std_logic_vector(5 downto 0) ;
-- signal parity1_layer2 : std_logic_vector(2 downto 0) ;
													 
-- signal parity2_layer1 : std_logic_vector(5 downto 0) ;
-- signal parity2_layer2 : std_logic_vector(2 downto 0) ;

-- signal parity3_layer1 : std_logic_vector(4 downto 0);
-- signal parity3_layer2 : std_logic_vector(1 downto 0);

-- signal parity4_layer1 : std_logic_vector(4 downto 0);
-- signal parity4_layer2 : std_logic_vector(1 downto 0);

-- signal parity5_layer1 : std_logic_vector(4 downto 0);
-- signal parity5_layer2 : std_logic_vector(1 downto 0);

begin


---------------------------P1----------------------------------
-- parity1_layer1(0) <= data_i(0)  xor data_i(1);
-- parity1_layer1(1) <= data_i(3)  xor data_i(4);
-- parity1_layer1(2) <= data_i(6)  xor data_i(8);
-- parity1_layer1(3) <= data_i(10) xor data_i(11); 
-- parity1_layer1(4) <= data_i(13) xor data_i(15);
-- parity1_layer1(5) <= data_i(17) xor data_i(19);

-- parity1_layer2(0) <= parity1_layer1(0) xor parity1_layer1(1);
-- parity1_layer2(1) <= parity1_layer1(2) xor parity1_layer1(3);
-- parity1_layer2(2) <= parity1_layer1(4) xor parity1_layer1(5);
---------------------------------------------------------------

---------------------------P2----------------------------------
-- parity2_layer1(0) <= data_i(0)  xor data_i(2);
-- parity2_layer1(1) <= data_i(3)  xor data_i(5);
-- parity2_layer1(2) <= data_i(6)  xor data_i(9);
-- parity2_layer1(3) <= data_i(10) xor data_i(12); 
-- parity2_layer1(4) <= data_i(13) xor data_i(16);
-- parity2_layer1(5) <= data_i(17) xor data_i(20);

-- parity2_layer2(0) <= parity2_layer1(0) xor parity2_layer1(1);
-- parity2_layer2(1) <= parity2_layer1(2) xor parity2_layer1(3);
-- parity2_layer2(2) <= parity2_layer1(4) xor parity2_layer1(5);
---------------------------------------------------------------


---------------------------P3----------------------------------

-- parity3_layer1(0) <= data_i(1)  xor data_i(2);
-- parity3_layer1(1) <= data_i(3)  xor data_i(7);
-- parity3_layer1(2) <= data_i(8)  xor data_i(9);
-- parity3_layer1(3) <= data_i(10) xor data_i(14); 
-- parity3_layer1(4) <= data_i(15) xor data_i(16) xor data_i(17);

-- parity3_layer2(0) <= parity3_layer1(0) xor parity3_layer1(1);
-- parity3_layer2(1) <= parity3_layer1(2) xor parity3_layer1(3) xor parity3_layer1(4);

---------------------------------------------------------------

---------------------------P4----------------------------------

-- parity4_layer1(0) <= data_i(4)  xor  data_i(5);
-- parity4_layer1(1) <= data_i(6)  xor  data_i(7);
-- parity4_layer1(2) <= data_i(8)  xor  data_i(9);
-- parity4_layer1(3) <= data_i(10) xor data_i(18);
-- parity4_layer1(4) <= data_i(20) xor data_i(19);

-- parity4_layer2(0) <= parity4_layer1(0) xor parity4_layer1(1);
-- parity4_layer2(1) <= parity4_layer1(2) xor parity4_layer1(3) xor parity4_layer1(4);
                                                                 
---------------------------------------------------------------

---------------------------P4----------------------------------

-- parity5_layer1(0) <=  data_i(11) xor  data_i(12);
-- parity5_layer1(1) <=  data_i(13) xor  data_i(14);
-- parity5_layer1(2) <=  data_i(15) xor  data_i(16);
-- parity5_layer1(3) <=  data_i(17) xor data_i(18);
-- parity5_layer1(4) <=  data_i(19) xor data_i(20);

-- parity5_layer2(0) <= parity5_layer1(0) xor parity5_layer1(1);
-- parity5_layer2(1) <= parity5_layer1(2) xor parity5_layer1(3) xor parity5_layer1(4);

---------------------------------------------------------------


parity(0) <= data_i(0)  xor data_i(1) xor data_i(3)  xor data_i(4) xor data_i(6)  xor data_i(8) xor data_i(10) xor data_i(11) xor data_i(13) xor data_i(15) xor data_i(17) xor data_i(19);
parity(1) <= data_i(0)  xor data_i(2) xor data_i(3)  xor data_i(5) xor data_i(6)  xor data_i(9) xor data_i(10) xor data_i(12) xor data_i(13) xor data_i(16) xor data_i(17) xor data_i(20);
parity(2) <= data_i(1)  xor data_i(2) xor data_i(3)  xor data_i(7) xor data_i(8)  xor data_i(9) xor data_i(10) xor data_i(14) xor data_i(15) xor data_i(16) xor data_i(17);
parity(3) <= data_i(4)  xor  data_i(5) xor data_i(6)  xor  data_i(7) xor data_i(8)  xor  data_i(9) xor data_i(10) xor data_i(18) xor data_i(20) xor data_i(19);
parity(4) <= data_i(11) xor  data_i(12) xor data_i(13) xor  data_i(14) xor data_i(15) xor  data_i(16) xor data_i(17) xor data_i(18) xor data_i(19) xor data_i(20);


hamming_o <= data_i(25 downto 11) & parity(4) & data_i(10 downto 4) & parity(3) & data_i(3 downto 1) & parity(2) & data_i(0)& parity(1 downto 0);


end Behavioral;
