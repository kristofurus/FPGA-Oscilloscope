----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 09:21:59
-- Design Name: 
-- Module Name: signal_register - Behavioral
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

entity signal_register is
    Generic(
    DIN_WIDTH : natural := 12;
    ARRAY_WIDTH : natural := PLOT_WIDTH
    -- data out width should be taken from image_generation_pkg
    );
    Port ( 
        clk_fifo  : in STD_LOGIC;
        clk_reg   : in STD_LOGIC;
        rst       : in STD_LOGIC;
        din       : in STD_LOGIC_VECTOR (DIN_WIDTH - 1 downto 0);
--        valid_in  : in STD_LOGIC;
        dout      : out t_data(0 to ARRAY_WIDTH - 1)
--        valid_out : out STD_LOGIC_VECTOR(ARRAY_WIDTH - 1 downto 0)
        );
end signal_register;

architecture Behavioral of signal_register is

component inputDivider is
    Generic(
    DIN_WIDTH : natural := 12
    -- data out width should be taken from image_generation_pkg
--    DOUT_WIDTH: natural := DATA_WIDTH
    );
    Port ( din : in STD_LOGIC_VECTOR (DIN_WIDTH - 1 downto 0);
           dout : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0));
end component;

component dataFIFO is
    Generic (
        ARRAY_WIDTH : natural := PLOT_WIDTH
        -- data width should be taken from image_generation_pkg
--        DATA_WIDTH : natural := 8
    );
    Port ( clk : in STD_LOGIC;  -- clock that updates FIFO every time there is new sample ready
           rst : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
--           din_valid : in STD_LOGIC;
           values : out t_data(0 to ARRAY_WIDTH - 1)
--           valid : out std_logic_vector(ARRAY_WIDTH - 1 downto 0)
           ); -- new data
           
end component;

component values_register is
    Generic (
        ARRAY_WIDTH : natural := PLOT_WIDTH
--        DATA_WIDTH : natural := 8 -- data width should be taken from image_generation_pkg
    );
    Port ( clk : in STD_LOGIC; -- end or the beginning of frame signal
           rst : in STD_LOGIC;
           values_in : in t_data(0 to ARRAY_WIDTH - 1);
--           valid_in : in std_logic_vector(ARRAY_WIDTH - 1 downto 0);
           values_out : out t_data(0 to ARRAY_WIDTH - 1)
--           valid_out : out std_logic_vector(ARRAY_WIDTH - 1 downto 0)
    );
end component;

signal conv_to_fifo      : STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
signal fifo_to_reg       : t_data(0 to ARRAY_WIDTH - 1);
--signal valid_fifo_to_reg : STD_LOGIC_VECTOR(ARRAY_WIDTH - 1 downto 0);

begin

    converter: inputDivider port map (din=>din, dout=>conv_to_fifo);
    
    FIFO: dataFIFO port map (
        clk => clk_fifo,
        rst => rst,
        data => conv_to_fifo,
--        din_valid => valid_in,
        values => fifo_to_reg
--        valid => valid_fifo_to_reg
    );
    
    reg: values_register port map (
        clk => clk_reg,
        rst=> rst,
        values_in => fifo_to_reg,
--        valid_in => valid_fifo_to_reg,
        values_out => dout
--        valid_out => valid_out
    );

end Behavioral;
