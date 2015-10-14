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
Now the program is barely working. But the partition shows at explorer and
has information like free space. Partition size parsing is now working with
msys toolchain. Other function like creating file is not working yet.

**Dependency:**

	dokan library
	msys2 64bit
	g++
	an graphic card or CPU that support OpenCL

**Usage:**

	$git clone https://github.com/x1596357/vramfs-on-Windows
	$cd vramfs-on-Windows
	$make (or make OPENCL_1_1=1)
	$./mount.sh
   
	I use Windows 10 64-bit and my laptop uses Nvidia 840M with 2GiB memory. 
	So, the libs are for 64-bit system and I'm not going to work on 32bit system
	 and other graphic card besides Nvidia soon. I need to get it to work first, right?  
	In lib/x64,there is OpenCL64.dll extracted from Nvidia driver, you may want to use
	yours to replace it. There is also dokanfuse.dll compiled from my dokany fork.

	For debugging purpuse, this program now uses CPU as the backend device. This means
	you can run it regardles of your graphic card vendor so long as you have OpenCL support.
	You may want to install OpenCL runtime support for your CPU from CPU vendors.
	You can change it to use your GPU easily by changing the CL_DEVICE_TYPE_CPU to 
	CL_DEVICE_TYPE_GPU. Later I might add command line options to change it at runtime.

**Issues:**  

1. **It doesn't work and causes BSOD!!!**  
	Well, I'm working to it. This project is just got started. Please be patient.


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