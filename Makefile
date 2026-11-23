# Run the half-adder layered testbench with a commercial SystemVerilog simulator.
# Usage: make vcs | make questa | make xcelium | make clean

FILELIST := files.f
TOP      := tbench_top

.PHONY: vcs questa xcelium clean

vcs:
	vcs -full64 -sverilog -timescale=1ns/1ns -f $(FILELIST) -top $(TOP) -o simv
	./simv

questa:
	vlib work
	vlog -sv -timescale 1ns/1ns -f $(FILELIST)
	vsim -c $(TOP) -do "run -all; quit -f"

xcelium:
	xrun -sv -timescale 1ns/1ns -f $(FILELIST) -top $(TOP)

clean:
	rm -rf simv simv.daidir csrc ucli.key vc_hdrs.h *.vpd *.vcd \
	       work transcript vsim.wlf xcelium.d xrun.* *.log *.history
