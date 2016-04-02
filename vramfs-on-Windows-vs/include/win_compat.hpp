#pragma once
#include <fuse_win.h>
uid_t geteuid();

gid_t getegid();

LARGE_INTEGER getFILETIMEoffset();

int clock_gettime(int X, struct timespec *tv);