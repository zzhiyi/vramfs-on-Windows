CC =  g++
CFLAGS = -Wall -std=c++11 -I include/ -I include/Dokanfuse/ -I"C:\Program Files\Dokan\DokanLibrary\include\dokan" -D_FILE_OFFSET_BITS=64
LDFLAGS = -Llib/x64/Nvidia/ -L"C:\Windows\System32" -lOpenCL64 -ldokan

ifeq ($(DEBUG), 1)
	CFLAGS += -g -DDEBUG -D_
else
	CFLAGS += -g -march=native -O2
endif

ifeq ($(OPENCL_1_1), 1)
	CFLAGS += -DOPENCL_1_1
endif

bin/vramfs: build/util.o build/memory.o build/entry.o build/file.o build/dir.o build/symlink.o build/vramfs.o build/docanfuse.o build/fuse_helpers.o build/fuse_opt.o build/fusemain.o build/utils.o | bin
	$(CC) -o $@ $^ $(LDFLAGS)

build bin:
	@mkdir -p $@

build/%.o: src/%.cpp | build
	$(CC) $(CFLAGS) -c -o $@ $<

build/%.o: src/Dokanfuse/%.cpp | build
	$(CC) $(CFLAGS) -c -o $@ $<

build/%.o: src/Dokanfuse/%.c | build
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -rf build/ bin/
