comma := ,
empty:=
space:= $(empty) $(empty)
destdir ?=
prefix ?= /usr
installdir := ${destdir}${prefix}
.DEFAULT_GOAL := all

all: napi-bones-node napi-bones-node-rename

build/napi-bones/obj/napi-bones-node/src/napi.c.o: build/napi-bones/obj/napi-bones-node/%.o: %
	@mkdir -p ${dir $@}
	@gcc -fPIC -DPIC -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DEV_MULTIPLICITY=0 -I/usr/include/node -c $< -o $@

napi-bones-node: build/napi-bones/obj/napi-bones-node/src/napi.c.o
	@mkdir -p build/napi-bones/lib
	@gcc -shared -fPIC -Wl,-soname,libnapi-bones.so.0 -DPIC -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DEV_MULTIPLICITY=0 -l:libv8.so build/napi-bones/obj/napi-bones-node/src/napi.c.o -o build/napi-bones/lib/libnapi-bones.so.0.0.1
	@ln -sf libnapi-bones.so.0.0.1 build/napi-bones/lib/libnapi-bones.so
	@ln -sf libnapi-bones.so.0.0.1 build/napi-bones/lib/libnapi-bones.so.0
	@ln -sf libnapi-bones.so.0.0.1 build/napi-bones/lib/libnapi-bones.so.0.0

clean-napi-bones-node: 
	@rm -rf build/napi-bones/lib

napi-bones-node-rename: 
	@cd build/napi-bones/lib; cp -f libnapi-bones.so napi-bones.node

clean: clean-napi-bones-node