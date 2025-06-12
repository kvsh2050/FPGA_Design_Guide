# Makefile

SRC       := src
TEST      := test
FPGA_DIR  := fpga
BUILD     := outputd

TOP       := test
WAVEFORM  := $(BUILD)/dump.vcd
OUTPUT    := $(BUILD)/sim.out

# All source files (SystemVerilog)
SRCS := $(wildcard $(SRC)/*.v $(SRC)/*.sv)
TB   := $(wildcard $(TEST)/*.v $(TEST)/*.sv)

all: $(OUTPUT)

$(BUILD):
	mkdir -p $(BUILD)

$(OUTPUT): $(BUILD) $(SRCS) $(TB)
	iverilog -g2012 -o $@ $(SRCS) $(TB)

run: all
	vvp $(OUTPUT)

wave: run
	gtkwave $(WAVEFORM)

clean:
	rm -rf $(BUILD)

