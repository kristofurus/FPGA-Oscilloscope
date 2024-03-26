----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2023 04:30:40 PM
-- Design Name: 
-- Module Name: tmds_encoder - Behavioral
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

entity tmds_encoder is
    Generic (
            DIN_WIDTH : natural := 8;
            DOUT_WIDTH : natural := 10
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en  : in STD_LOGIC;
           draw_en : in STD_LOGIC;
           ctrl : in STD_LOGIC_VECTOR (1 downto 0);
           din : in STD_LOGIC_VECTOR (DIN_WIDTH-1 downto 0);
           dout : out STD_LOGIC_VECTOR (DOUT_WIDTH-1 downto 0));
end tmds_encoder;

architecture Behavioral of tmds_encoder is

    signal dtmp      : STD_LOGIC_VECTOR (DOUT_WIDTH-1 downto 0) := (others => '0');
    signal ones      : natural range 0 to 15 := 0;
    signal ones_tmp  : natural range 0 to 15 := 0;
    signal zeros_tmp : natural range 0 to 15 := 0;
    signal count     : natural range 0 to 15 := 0;
    
    ------------------------------------------------------------------------------------------------------
--    signal ones, ones_count, zeros_count : integer range -8 to 8 := 0;
--    signal disparity, diff : integer range -16 to 16 := 0;
--    signal cout : std_logic_vector(DOUT_WIDTH-1 downto 0);

begin

--process(clk)
--    variable tmp : integer := 0;
--begin
--    if rising_edge(clk) then
--        tmp := 0;
--        for i in 0 to 7 loop
--            if din(i) = '1' then
--                tmp := tmp + 1;
--            end if;
--        end loop;
--        ones <= tmp;
--    end if;
--end process;

--process(din, cout)
--    variable tmp_ones : natural range 1 to 8 := 1;
--    variable tmp_zeros : natural range 1 to 8 := 1;
--begin
--    tmp_ones := 1;
--    tmp_zeros := 1;
    
--    for i in 0 to 7 loop
--        if cout(i) = '1' then
--            tmp_ones := tmp_ones + 1;
--        else
--            tmp_zeros := tmp_zeros + 1;
--        end if;
--    end loop;
--    ones_count <= tmp_ones;
--    zeros_count <= tmp_zeros;
--    diff <= ones_count - zeros_count;
--end process;

---------------------------------------------------------------------------------------------------------------------------------

    -- on updating input data recalculate number of ones
    count_in: process(din, dtmp)
        variable count : natural range 0 to 15 := 0;
    begin
        count := 0;
        for i in din'range loop 
            if din(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        ones <= count;
    end process;
    
    count_tmp: process(dtmp)
        variable count : natural range 0 to 15 := 0;
    begin
        count := 0;
        for i in 0 to 7 loop
            if dtmp(i) = '1' then
                count := count + 1;
            end if;
        end loop;
        ones_tmp <= count;
        zeros_tmp <= dtmp'length - count;
    end process;
    
    dtmp(0) <= din(0);
    dtmp(1) <= din(1) xnor dtmp(0) when (ones>4 or (ones=4 and din(0)='0')) else din(1) xor dtmp(0);
    dtmp(2) <= din(2) xnor dtmp(1) when (ones>4 or (ones=4 and din(0)='0')) else din(2) xor dtmp(1);
    dtmp(3) <= din(3) xnor dtmp(2) when (ones>4 or (ones=4 and din(0)='0')) else din(3) xor dtmp(2);
    dtmp(4) <= din(4) xnor dtmp(3) when (ones>4 or (ones=4 and din(0)='0')) else din(4) xor dtmp(3);
    dtmp(5) <= din(5) xnor dtmp(4) when (ones>4 or (ones=4 and din(0)='0')) else din(5) xor dtmp(4);
    dtmp(6) <= din(6) xnor dtmp(5) when (ones>4 or (ones=4 and din(0)='0')) else din(6) xor dtmp(5);
    dtmp(7) <= din(7) xnor dtmp(6) when (ones>4 or (ones=4 and din(0)='0')) else din(7) xor dtmp(6);
    dtmp(8) <= '0' when (ones>4 or (ones=4 and din(0)='0')) else '1';
    
--    process(din, dtmp, ones_in)
--    begin
--        update_dtmp: if (ones_in > 4 or (ones_in = 4 and din(0) = '0')) then
--            dtmp(0) <= din(0);
--            dtmp(1) <= dtmp(0) xnor din(1);
--            dtmp(2) <= dtmp(1) xnor din(2);
--            dtmp(3) <= dtmp(2) xnor din(3);
--            dtmp(4) <= dtmp(3) xnor din(4);
--            dtmp(5) <= dtmp(4) xnor din(5);
--            dtmp(6) <= dtmp(5) xnor din(6);
--            dtmp(7) <= dtmp(6) xnor din(7);
--            dtmp(8) <= '0';
--        else
--            dtmp(0) <= din(0);
--            dtmp(1) <= dtmp(0) xor din(1);
--            dtmp(2) <= dtmp(1) xor din(2);
--            dtmp(3) <= dtmp(2) xor din(3);
--            dtmp(4) <= dtmp(3) xor din(4);
--            dtmp(5) <= dtmp(4) xor din(5);
--            dtmp(6) <= dtmp(5) xor din(6);
--            dtmp(7) <= dtmp(6) xor din(7);
--            dtmp(8) <= '1';
--        end if update_dtmp; 
--    end process;
     
   
    encode: process(clk)
    begin
        if rising_edge(clk) and en = '1' then
            drawing: if draw_en = '0' then
            
                case ctrl is
                when "00" => dout <= "1101010100";
                when "01" => dout <= "0010101011";
                when "10" => dout <= "0101010100";
                when "11" => dout <= "1010101011";
                when others => NULL;
                end case;
                count <= 0;
                
            else
            
                first: if count = 0 or (ones_tmp = zeros_tmp) then
                
                    dout(9) <= not dtmp(8);
                    dout(8) <= dtmp(8);
                    if dtmp(8) = '1' then
                        dout(7 downto 0) <= dtmp(7 downto 0);
                        count <= count + (ones_tmp - zeros_tmp);
                    else 
                        dout(7 downto 0) <= not dtmp(7 downto 0);
                        count <= count + (zeros_tmp - ones_tmp);
                    end if;
                    
                else
                    
                    second: if (count > 0 and ones_tmp > zeros_tmp) or (count < 0 and zeros_tmp > ones_tmp) then 
                        dout(9) <= '1';
                        dout(8) <= dtmp(8);
                        dout(7 downto 0) <= not dtmp(7 downto 0);
                        count <= count + 2 + (zeros_tmp - ones_tmp);
                    else 
                        dout(9) <= '0';
                        dout(8) <= dtmp(8);
                        dout(7 downto 0) <= dtmp(7 downto 0);
                        count <= count - 2 + (ones_tmp - zeros_tmp);
                    end if second;
                    
                end if first;
            
            end if drawing;
            
        end if;
        
    end process;

end Behavioral;
