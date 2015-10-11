CC =  g++
CFLAGS = -Wall -Werror -std=c++11 -I include/ -I"C:\Program Files\Dokan\DokanLibrary\include\fuse" -D_FILE_OFFSET_BITS=64
LDFLAGS = -Llib/x64/Nvidia/ -Llib/x64 -lOpenCL64 -ldokanfuse

ifeq ($(DEBUG), 1)
	CFLAGS += -g -DDEBUG
else
	CFLAGS += -g -march=native -O2
endif

ifeq ($(OPENCL_1_1), 1)
	CFLAGS += -DOPENCL_1_1
endif

bin/vramfs: build/util.o build/memory.o build/entry.o build/file.o build/dir.o build/symlink.o build/vramfs.o | bin
	$(CC) -o $@ $^ $(LDFLAGS)
	cp lib/x64/dokanfuse.dll bin/

build bin:
	@mkdir -p $@

build/%.o: src/%.cpp | build
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -rf build/ bin/
