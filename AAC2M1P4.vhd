--------------------------------------------------------------------------------
--                                                                            --
--               Application Assignment 4 Module 1 Course 2                   --
--                                                                            --
--------------------------------------------------------------------------------
--
-- @file AAC2M1P4solved.vhd
-- @brief Application Assignment 2-001 Majority Vote Code 
-- @version: 1.0 
-- Date of current revision:  @date [2018-08-13]  
-- Target FPGA: [Intel Altera MAX10] 
-- Tools used: [Quartus Prime 16.1] for editing and synthesis 
--             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
--             [Quartus Prime 16.1]  for place and route if applied
--             
--  Functional Description:  This file contains the VHDL which describes the 
--               FPGA implementation of a Majority Vote Circuit. The inputs are  
--               signals A, B, C with one output Y that is true only if at  
--               least 2 of the inputs are true.
 
--  Hierarchy:  There is only one level in this simple design.
--  
--  Designed for: Coursera 
--                
--  Designed by:  @author Tim Scherr
--                University of Colorado
-- 
--      Copyright (c) 2018 by Tim Scherr
--
-- Redistribution, modification or use of this software in source or binary
-- forms is permitted as long as the files maintain this copyright. Users are
-- permitted to modify this and use it to learn about the field of HDl code.
-- Tim Scherr and the University of Colorado are not liable for any misuse
-- of this material.
------------------------------------------------------------------------------
-- 
library ieee;                                	
use ieee.std_logic_1164.all;           	
                                             		
entity Majority is port (                 	
    A, B, C: in std_logic; 			
    Y: out std_logic);            		
end Majority;                   	

architecture behavioral of Majority is 

component and2
	port (
		i1,i2 : in std_logic;
		o1 : out std_logic
);
end component;
component or2 port (
	i1,i2 : in std_logic;
	o1 : out std_logic
);
end component;

signal sig1,sig2,sig3,sig4 : std_logic;

begin
unit1 : and2
	port map ( i1=>A, i2=>B, o1=>sig1 );
unit2 : and2	
	port map ( i1=>B, i2=>C, o1=>sig2 );
unit3 : and2
	port map ( i1=>A, i2=>C, o1=>sig3 );
unit4 : or2
	port map ( i1=>sig1, i2=>sig2, o1=>sig4);
unit5 : or2
	port map ( i1=>sig4, i2=>sig3, o1=>Y);

end behavioral;
-- we have to assume that there is a library with predesigned part which perform AND and or functions.
--This is structural description.
