# (C) Jack Andrews 2008
# licensed under GPL 2.0
#
#  get cmake and run:
#    cmake -G "Visual Studio 8 2005"
#  in the same dir as this file
#  this will generate gc.sln
#

PROJECT(gc)

ADD_DEFINITIONS("-D_CRT_SECURE_NO_DEPRECATE
                 -D__STDC__
                 -DALL_INTERIOR_POINTERS
                 -DGC_BUILD
")

INCLUDE_DIRECTORIES(include)

SET(SRC alloc.c reclaim.c allchblk.c misc.c mach_dep.c os_dep.c
        mark_rts.c headers.c mark.c obj_map.c blacklst.c finalize.c
        new_hblk.c dbg_mlc.c malloc.c stubborn.c dyn_load.c
        typd_mlc.c ptr_chck.c gc_cpp.cc mallocx.c checksums.c
        win32_threads.c)

ADD_LIBRARY(          gc-lib   STATIC      ${SRC})
SET_TARGET_PROPERTIES(gc-lib   PROPERTIES
                      COMPILE_DEFINITIONS -DGC_NOT_DLL)

ADD_LIBRARY(          gcmt-lib STATIC      ${SRC})
SET_TARGET_PROPERTIES(gcmt-lib PROPERTIES
                      COMPILE_DEFINITIONS -DGC_THREADS
                      COMPILE_DEFINITIONS -DGC_NOT_DLL)

ADD_LIBRARY(          gcmt-dll  SHARED     ${SRC})
SET_TARGET_PROPERTIES(gcmt-dll  PROPERTIES
                      COMPILE_DEFINITIONS -DGC_THREADS)

ADD_EXECUTABLE(cord WIN32
               cord/cordbscs.c cord/cordxtra.c cord/de.c cord/de_win.c)
SET_TARGET_PROPERTIES(cord    PROPERTIES
                      COMPILE_DEFINITIONS -DGC_NOT_DLL)
TARGET_LINK_LIBRARIES(cord gc-lib)

ADD_SUBDIRECTORY(tests)
