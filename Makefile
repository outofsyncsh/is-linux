PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin

NASM    ?= nasm
LD      ?= ld

SRC     := is-linux.asm
BIN     := is-linux

all: $(BIN)

$(BIN): $(SRC)
	$(NASM) -f elf64 -o $(SRC:.asm=.o) $<
	$(LD) -o $@ $(SRC:.asm=.o)

install: $(BIN)
	install -Dm755 $(BIN) $(DESTDIR)$(BINDIR)/$(BIN)

clean:
	rm -f $(BIN) $(SRC:.asm=.o)

.PHONY: all install clean
