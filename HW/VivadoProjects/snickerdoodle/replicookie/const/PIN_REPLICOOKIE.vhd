library IEEE;
use IEEE.std_logic_1164.all;  -- defines std_logic types
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Copyright (C) 2007, Peter C. Wallace, Mesa Electronics
-- http://www.mesanet.com
--
-- Ported to Replicookie Snickerdoodle baseboard: 
-- Copyright (C) 2017, Cameron McQuinn
-- http://www.github.com/cmcquinn
--
-- This program is is licensed under a disjunctive dual license giving you
-- the choice of one of the two following sets of free software/open source
-- licensing terms:
--
--    * GNU General Public License (GPL), version 2.0 or later
--    * 3-clause BSD License
--
--
-- The GNU GPL License:
--
--     This program is free software; you can redistribute it and/or modify
--     it under the terms of the GNU General Public License as published by
--     the Free Software Foundation; either version 2 of the License, or
--     (at your option) any later version.
--
--     This program is distributed in the hope that it will be useful,
--     but WITHOUT ANY WARRANTY; without even the implied warranty of
--     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--     GNU General Public License for more details.
--
--     You should have received a copy of the GNU General Public License
--     along with this program; if not, write to the Free Software
--     Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
--
--
-- The 3-clause BSD License:
--
--     Redistribution and use in source and binary forms, with or without
--     modification, are permitted provided that the following conditions
--     are met:
--
--   * Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--
--   * Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--
--   * Neither the name of Mesa Electronics nor the names of its
--     contributors may be used to endorse or promote products
--     derived from this software without specific prior written
--     permission.
--
--
-- Disclaimer:
--
--     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
--     "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
--     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
--     FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--     COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
--     INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
--     BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
--     CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
--     LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
--     ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
--     POSSIBILITY OF SUCH DAMAGE.
--

use work.IDROMConst.all;

-- Module list
-- The ModuleID declaration is an array of ModuleRecords that defines which HM2 
-- modules are included in this configuration. The ModuleRecord type is defined in
-- IDROMConst.vhd, and tells HM2 information about each module such as its address,
-- pinout, and number of registers.

package PIN_REPLICOOKIE is
    constant ModuleID : ModuleIDType :=(
    --	Module			Version No.	Clock			NumInstances	BaseAddr					NumRegisters			Strides		BitMask
        (WatchDogTag,	x"00",		ClockLowTag,	x"01",			WatchDogTimeAddr&PadT,		WatchDogNumRegs,		x"00",		WatchDogMPBitMask),
        (HM2DPLLTag,	x"00",	    ClockLowTag,	x"01",	        HM2DPLLBaseRateAddr&PadT,	HM2DPLLNumRegs,		    x"00",	    HM2DPLLMPBitMask),
        (IOPortTag,		x"00",		ClockLowTag,	x"02",			PortAddr&PadT,				IOPortNumRegs,			x"00",		IOPortMPBitMask),
        (StepGenTag,	x"02",		ClockLowTag,	x"08",			StepGenRateAddr&PadT,		StepGenNumRegs,		    x"00",		StepGenMPBitMask),
        (FWIDTag,       x"00",  	ClockLowTag,    x"01",  		FWIDAddr&PadT,        		FWIDNumRegs,            x"00",  	FWIDMPBitMask),
        (PWMTag,		x"00",		ClockHighTag,	x"03",			PWMValAddr&PadT,			PWMNumRegs,				x"00",		PWMMPBitMask),
        (LEDTag,		x"00",		ClockLowTag,	x"02",			LEDAddr&PadT,				LEDNumRegs,				x"00",		LEDMPBitMask),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000"),
        (NullTag,		x"00",		NullTag,		x"00",			NullAddr&PadT,				x"00",					x"00",		x"00000000")
        );

    -- PinDesc
    -- The PinDesk declaration is an array that controls how the pins of the modules are
    -- ordered. The order in which the the pins appear here determines the order in which
    -- they are assigned in the HM2 IOBits bus, with the first pin in the array being bit 0
    -- of IOBits, and the last pin being bit n-1.

    constant PinDesc : PinDescType :=(
    -- 	PrimaryTag	SecUnit   SecTag	   SecPin			-- hostmot2 Header	Pin Dir	Func
    --	X axis
        IOPortTag & x"00" 	& StepGenTag & StepGenDirPin,   -- I/O 00	JA1		05	out	X Dir
        IOPortTag & x"00" 	& StepGenTag & StepGenStepPin,	-- I/O 01	JA1		06	out	X Step
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 02	JA1		07  out	GPIO - X enable
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 03	JA1		08  in	GPIO - X Home/limit

    --	Y axis
        IOPortTag & x"01" 	& StepGenTag & StepGenDirPin, 	-- I/O 04	JA1		11	out	Y Dir
        IOPortTag & x"01" 	& StepGenTag & StepGenStepPin,	-- I/O 05	JA1		12	out	Y Step
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 06	JA1		13  out	GPIO - Y enable
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 07	JA1		14  in	GPIO - Y Home/limit

    --	Z axis
        IOPortTag & x"02" 	& StepGenTag & StepGenDirPin,	-- I/O 08	JA1		17 	out	Z Dir
        IOPortTag & x"02" 	& StepGenTag & StepGenStepPin,	-- I/O 09	JA1		18	out	Z Step
        IOPortTag & x"00" 	& NullTag    & NullPin,    		-- I/O 10	JA1		19	out	GPIO - Z enable
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 11	JA1		20	in	GPIO - Z Home/limit

    --	Extruder A
        IOPortTag & x"03" 	& StepGenTag & StepGenDirPin,	-- I/O 12	JA1		23	out	A Dir
        IOPortTag & x"03" 	& StepGenTag & StepGenStepPin,	-- I/O 13	JA1		24  out	A Step
        IOPortTag & x"00" 	& NullTag    & NullPin,    		-- I/O 14	JA1		25	out	GPIO - Extruder A enable
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 15	JA1		04 	in	GPIO - Extruder A filament loaded
        IOPortTag & x"00" 	& PWMTag     & PWMAOutPin,		-- I/O 16	JA1		35  out	PWM - Extruder A heater
        IOPortTag & x"01" 	& PWMTag     & PWMAOutPin,		-- I/O 17	JA1		36	out	PWM - Extruder A fan control

    --	Extruder B
        IOPortTag & x"04" 	& StepGenTag & StepGenDirPin,	-- I/O 18	JA1		29  out	B Dir
        IOPortTag & x"04" 	& StepGenTag & StepGenStepPin,  -- I/O 19	JA1		30  out	B Step
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 20	JA1		31	out	GPIO - Extruder B enable
        IOPortTag & x"00" 	& NullTag    & NullPin,			-- I/O 21	JA2		04	in	GPIO - Extruder B filament loaded
        IOPortTag & x"02" 	& PWMTag     & PWMAOutPin,		-- I/O 22	JA1		37	out	PWM - Extruder B heater
        IOPortTag & x"03" 	& PWMTag     & PWMAOutPin, 		-- I/O 23	JA1		38	out	PWM - Extruder B fan control
        
    -- 	PrimaryTag	SecUnit   SecTag	   SecPin			-- hostmot2 Header	Pin Dir	Func
        
        IOPortTag & x"04" 	& PWMTag     & PWMAOutPin,    	-- I/O 24	JA2		05	out	PWM - bed heater
        IOPortTag & x"00" 	& NullTag    & NullPin,	        -- I/O 25	JA2		6	io	GPIO - hardware ESTOP in
        IOPortTag & x"00" 	& NullTag    & NullPin, 		-- I/O 26	JA2		7	io	GPIO - software ESTOP out
        IOPortTag & x"00" 	& NullTag    & NullPin, 		-- I/O 27	JA2		8	io	GPIO
        IOPortTag & x"00" 	& NullTag    & NullPin,    		-- I/O 28	JA2		11	io	GPIO
        IOPortTag & x"00" 	& NullTag    & NullPin,  		-- I/O 29	JA2		12	io	GPIO
        IOPortTag & x"00" 	& NullTag    & NullPin,   	    -- I/O 30	JA2		13	io	GPIO
        IOPortTag & x"00" 	& NullTag    & NullPin,   	    -- I/O 31	JA2		14	io	GPIO
        IOPortTag & x"00" 	& NullTag    & NullPin,   	    -- I/O 32	JA2		17	io	GPIO
        IOPortTag & x"00" 	& NullTag    & NullPin,   	    -- I/O 33	JA2		18	io	GPIO
        

        -- Fill remaining pins
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin, 
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,

        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,

        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin);

end package PIN_REPLICOOKIE;