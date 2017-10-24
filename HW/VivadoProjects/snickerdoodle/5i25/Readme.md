# Building the snickerdoodle project

The way I am currently developing the snickerdoodle project is using a combination of Vivado 2015.4 and 2017.2. I am using 2015.4 to generate the project file and IP using make_bitfile.sh, and then I open the resulting project in 2017.2, let Vivado bring the IP up to date, and fix any missing connections in the block diagram. From there, I can make any changes I want. I prefer using 2017.2 because the UI is much nicer.

The snickerdoodle_bd_2017.tcl script should be able to recreate the design in its current state in Vivado 2017.2, without having to go through the process described above, but I'm not certain that it works.

That's the current state of things. Sorry about the mess!

- Cameron
