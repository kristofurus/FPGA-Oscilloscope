----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2023 12:41:54 PM
-- Design Name: 
-- Module Name: dataFIFO - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.image_generation_pkg.all;

entity dataFIFO is
    Generic (
        ARRAY_WIDTH : natural := PLOT_WIDTH
        -- data width should be taken from image_generation_pkg
--        DATA_WIDTH : natural := 8
    );
    Port ( clk : in STD_LOGIC;  -- clock that updates FIFO every time there is new sample ready
           rst : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
--           din_valid : in STD_LOGIC;
           values : out t_data(0 to ARRAY_WIDTH - 1) := (others=>(others=> '0'))
--           valid : out std_logic_vector(ARRAY_WIDTH - 1 downto 0) := (others=> '0')
           ); -- new data
           
end dataFIFO;

architecture Behavioral of dataFIFO is

    -- create fifo register that updates its values 
    signal fifo : t_data(0 to ARRAY_WIDTH - 1) := (others=>(others=>'0'));
--    signal valid_tmp : std_logic_vector(ARRAY_WIDTH - 1 downto 0) := (others => '0');
--signal fifo : t_data(0 to ARRAY_WIDTH - 1)(DATA_WIDTH-1 downto 0);

begin

    
    process(clk) 
    begin
    
        if rst = '1' then
            -- on reset clear all values and make them invalid
            fifo <= (others=>(others=>'0'));
--            valid_tmp <= (others => '0'); 
        
        elsif rising_edge(clk) then
    
--            for i in 0 to ARRAY_WIDTH - 2 loop
----            fifo 
--            end loop;
            -- we push new data to the last place in array
            
            for i in 1 to ARRAY_WIDTH - 1 loop
                fifo(i) <= fifo(i - 1);
--                valid_tmp(i-1) <= valid_tmp(i);
            end loop;
            
            fifo(0) <= data;
--            valid_tmp(ARRAY_WIDTH - 1) <= din_valid;
            
--            fifo(1 to ARRAY_WIDTH - 1) <= fifo(0 to ARRAY_WIDTH - 2);
--            fifo(0) <= data;
            -- since the oldest one was just pushed he should check if new data is valid or not
            -- if not we wont plot it 
--            valid_tmp <= valid_tmp(ARRAY_WIDTH - 2 downto 0) & din_valid;
            
        end if;
    
    end process;

    values <= fifo;
--    valid <= valid_tmp;

end Behavioral;
