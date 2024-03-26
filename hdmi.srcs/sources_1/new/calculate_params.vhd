----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 11:11:08
-- Design Name: 
-- Module Name: calculate_params - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.image_generation_pkg.all;
use work.font_pkg.all;

entity calculate_params is
    Generic (
        ARRAY_WIDTH : natural := PLOT_WIDTH
--        DATA_WIDTH : natural := 8 -- data width should be taken from image_generation_pkg
    );
    Port ( 
        clk_reg : in std_logic;
        values : in t_data(0 to ARRAY_WIDTH - 1) := (others=>(others=> '0'));
        valid : in std_logic;
--        vpp : out unsigned(DATA_WIDTH - 1 downto 0)
        ch1 : out t_font;
        ch2 : out t_font;
        ch3 : out t_font
    );
end calculate_params;

architecture Behavioral of calculate_params is

    signal max_val, min_val : unsigned(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal vpp : unsigned(DATA_WIDTH - 1 downto 0) := (others => '0');

begin

    max: process(clk_reg)
        variable max_v : unsigned(DATA_WIDTH - 1 downto 0) := (others => '0');
    begin
        if rising_edge(clk_reg) then
            max_v := (others => '0');
            for i in values'range loop
                compare: if unsigned(values(i)) > max_v then
                    max_v := unsigned(values(i));
                end if;
            end loop;
            max_val <= max_v;
        end if;
    end process;
    
    min: process(clk_reg)
        variable min_v : unsigned(DATA_WIDTH - 1 downto 0) := (others => '1');
    begin
        if rising_edge(clk_reg) then
            min_v := (others => '1');
            for i in values'range loop
                compare: if unsigned(values(i)) < min_v then
                    min_v := unsigned(values(i));
                end if;
            end loop;
            min_val <= min_v;
        end if;
    end process;

    vpp <= max_val - min_val;
    
    process(clk_reg) 
        variable number: unsigned(DATA_WIDTH - 1 downto 0) := (others=>'0');
        variable substract : unsigned(DATA_WIDTH - 1 downto 0) := (others=>'0');
    begin
        
        if rising_edge(clk_reg) then
            if valid = '1' then
                number := vpp;
                if number >= 200 then
                    ch1 <= CHARACTER_2; 
                    number := number - 200;
                elsif number >= 100 then
                    ch1 <= CHARACTER_1;
                    number := number - 100;
                else 
                    ch1 <= CHARACTER_0; 
                end if;
                
                for i in 0 to 9 loop
                    if number >= i*10 and number <= (i+1) * 10 then
                        ch2 <= NUMBERS(i);
                        substract := to_unsigned(i*10, DATA_WIDTH);
                    end if;
                end loop;
                number := number - substract;
                
                for i in 0 to 9 loop
                    if number >= i and number <= (i+1) then
                        ch3 <= NUMBERS(i);
        --                substract := number;
                    end if;
                end loop;
            else 
                ch1 <= CHARACTER_45;
                ch2 <= CHARACTER_45;
                ch3 <= CHARACTER_45;
            end if;
        end if;
    end process;

end Behavioral;
