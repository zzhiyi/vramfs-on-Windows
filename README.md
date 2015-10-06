vramfs on Windows
======
This project tries to port vramfs to Windows using dokan library (dokanfuse).  

vramfs: https://github.com/Overv/vramfs   
dokany: https://github.com/dokan-dev/dokany 

**Credit:**   
vramfs: Alexander Overvoorde et al.  
dokany: Hiroki Asakawa as original author
	 		 and now dokany team 

**WARNING:**  
I just got it pass compilation.So this project doesn't work yet.In fact, besides not working, it will cause your system BSOD as well. 

**Dependency:**

	msys2 64bit
	g++
	an graphic card that support OpenCL

**Usage:**

	$git clone https://github.com/x1596357/vramfs-on-Windows
	$cd vramfs-on-Windows
	$make (or make OPENCL_1_1=1)
	$./mount.sh
   
I use Windows 10 64-bit and my laptop uses Nvidia 840M with 2GiB memory. 
	So, the libs are for 64-bit system and I'm not going to work on 32bit system
	 and other graphic card besides Nvidia soon. I need to get it to work first, right?  
In lib/x64,there is OpenCL64.dll extracted from Nvidia driver, you may want to use
	yours to replace it. There is also dokanfuse.dll compiled from dokan library 0.8.0-RC1.


**Issues:**  

1. **It doesn't work and causes BSOD!!!**  
Well, I'm working to it.  

2. **parse_size() in vramfs.cpp always return 1**  
I changed it to return 1 to avoid error in the compiler.  
The g++ 4.9 on msys2 doesn't have std::stoul(), I need to find
another way. But it should be pretty easy, since it's just parsing unsigned long.
	`

**License**

    The MIT License (MIT)

    Copyright (c) 2015 Eric Zhang <gd.yi AT 139.com>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to
    deal in the Software without restriction, including without limitation the
    rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
    sell copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
    IN THE SOFTWARE.