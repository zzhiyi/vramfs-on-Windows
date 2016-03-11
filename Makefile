CXX =  g++
CXXFLAGS = -Wall -std=c++11 -Iinclude/ -I"C:\Program Files\Dokan\Dokan Library-1.0.0\include\dokan" -Idokan_fuse/include -D_FILE_OFFSET_BITS=64
LDFLAGS = -Llib/x64/Nvidia/ -lOpenCL64 -L"C:\Program Files\Dokan\Dokan Library-1.0.0" -ldokan1

CXXFLAGS += -g -Og -DOPENCL_1_1

bin/vramfs: build/util.o build/memory.o build/entry.o build/file.o build/dir.o build/symlink.o build/vramfs.o build/docanfuse.o build/fuse_helpers.o build/fuse_opt.o build/fusemain.o build/utils.o | bin
	$(CXX) -o $@ $^ $(LDFLAGS)

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
