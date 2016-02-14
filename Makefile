CXX =  g++
CXXFLAGS = -Wall -std=c++11 -I include/ -I dokan_fuse/include -I"C:\Program Files\Dokan\Dokan Library-1.0.0\include\dokan" -D_FILE_OFFSET_BITS=64
LDFLAGS = -Llib/ -L"C:\Program Files\Dokan\Dokan Library-1.0.0" -lOpenCL -ldokan1

#ifeq ($(DEBUG), 1)
#	CXXFLAGS += -g -DDEBUG
#else
	CXXFLAGS += -g -ggdb -O2
#endif

ifeq ($(OPENCL_1_1), 1)
	CXXFLAGS += -DOPENCL_1_1
endif

bin/vramfs: build/util.o build/memory.o build/entry.o build/file.o build/dir.o build/symlink.o build/vramfs.o build/docanfuse.o build/fuse_helpers.o build/fuse_opt.o build/fusemain.o build/utils.o | bin
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

build bin:
	@mkdir -p $@

build/%.o: src/%.cpp | build
	$(CXX) $(CXXFLAGS) -c -o $@ $<

build/%.o: dokan_fuse/src/%.cpp | build
	$(CXX) $(CXXFLAGS) -c -o $@ $<

build/%.o: dokan_fuse/src/%.c | build
	$(CXX) $(CXXFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -rf build/ bin/
