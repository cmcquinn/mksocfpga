library IEEE;
use IEEE.std_logic_1164.all;  -- defines std_logic types
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Copyright (C) 2007, Peter C. Wallace, Mesa Electronics
-- http://www.mesanet.com
--
-- Ported to Snickerdoodle 3D printer prototype board: 
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

package PIN_PROTOTYPE is
    constant ModuleID : ModuleIDType :=(
    --	Module			Version No.	Clock			NumInstances	BaseAddr					NumRegisters			Strides		BitMask
        (WatchDogTag,	x"00",		ClockLowTag,	x"01",			WatchDogTimeAddr&PadT,		WatchDogNumRegs,		x"00",		WatchDogMPBitMask),
        (IOPortTag,		x"00",		ClockLowTag,	x"01",			PortAddr&PadT,				IOPortNumRegs,			x"00",		IOPortMPBitMask),
        (StepGenTag,	x"02",		ClockLowTag,	x"02",			StepGenRateAddr&PadT,		StepGenNumRegs,		    x"00",		StepGenMPBitMask),
        (FWIDTag,       x"00",  	ClockLowTag,    x"01",  		FWIDAddr&PadT,        		FWIDNumRegs,            x"00",  	FWIDMPBitMask),
        (PWMTag,		x"00",		ClockHighTag,	x"02",			PWMValAddr&PadT,			PWMNumRegs,				x"00",		PWMMPBitMask),
        (LEDTag,		x"00",		ClockLowTag,	x"01",			LEDAddr&PadT,				LEDNumRegs,				x"00",		LEDMPBitMask),
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
    --	Prototyping board
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 00   JA1     4  in  GPIO
        IOPortTag & x"00" &   StepGenTag & StepGenDirPin,   -- I/O 01   JA1     5  out Dir
        IOPortTag & x"00" &   StepGenTag & StepGenStepPin,  -- I/O 02   JA1     6  out Step
        IOPortTag & x"01" &   StepGenTag & StepGenDirPin,   -- I/O 03   JA1     7  out Dir
        IOPortTag & x"01" &   StepGenTag & StepGenStepPin,  -- I/O 04   JA1     8  out Step
        IOPortTag & x"00" &   PWMTag     & PWMAOutPin,      -- I/O 05   JA1     11  out PWM
        IOPortTag & x"01" &   PWMTag     & PWMAOutPin,      -- I/O 06   JA1     12  out PWM
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 07   JA1     13  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 08   JA1     14  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 09   JA1     17  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 10   JA1     18  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 11   JA1     19  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 12   JA1     20  in  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 13   JA1     23  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 14   JA1     24  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 15   JA1     25  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 16   JA1     26  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 17   JA1     29  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 18   JA1     30  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 19   JA1     31  in  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 20   JA1     32  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 21   JA1     35  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 22   JA1     36  io  GPIO
        IOPortTag & x"00" &   NullTag    & NullPin,         -- I/O 23   JA1     37  io  GPIO
        

        -- Fill remaining 144 pins
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
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,
        emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin,emptypin);

end package PIN_PROTOTYPE;