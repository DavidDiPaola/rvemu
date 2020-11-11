TARGET_AS ?= riscv64-unknown-elf-as
_TARGET_AFLAGS = -march=rv32e $(TARGET_AFLAGS)

TARGET_OBJCOPY ?= riscv64-unknown-elf-objcopy
_TARGET_OCFLAGS = --output-target binary

.PHONY: clean
clean:
	rm -f *.elf
	rm -f *.bin

%.elf: %.s
	$(TARGET_AS) $(_TARGET_AFLAGS) $< -o $@

%.bin: %.elf
	$(TARGET_OBJCOPY) $(_TARGET_OCFLAGS) $< $@
