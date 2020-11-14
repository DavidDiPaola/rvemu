PREFIX ?= riscv64-unknown-elf-

TARGET_AS ?= $(PREFIX)as
_TARGET_AFLAGS = -march=rv32e $(TARGET_AFLAGS)

TARGET_OBJCOPY ?= $(PREFIX)objcopy
_TARGET_OCFLAGS = --output-target binary

TARGET_OBJDUMP ?= $(PREFIX)objdump
_TARGET_ODFLAGS = --disassemble-all

.PHONY: clean
clean:
	rm -f *.elf
	rm -f *.bin

.PHONY: %.dump
%.dump: %.elf
	$(TARGET_OBJDUMP) $(_TARGET_ODFLAGS) $<

%.elf: %.s
	$(TARGET_AS) $(_TARGET_AFLAGS) $< -o $@

%.bin: %.elf
	$(TARGET_OBJCOPY) $(_TARGET_OCFLAGS) $< $@
