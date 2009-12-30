# this one is important: providing this the platform is not win32
SET(CMAKE_SYSTEM_NAME Mosync)
SET(MOSYNC true)

IF(MOSYNC)
	MESSAGE("Building with MoSync toolchain")
ENDIF(MOSYNC)

#  specify the cross compiler
INCLUDE(CMakeForceCompiler)
#SET(CMAKE_C_COMPILER   xgcc.exe)
#SET(CMAKE_CXX_COMPILER xgcc.exe)
CMAKE_FORCE_C_COMPILER(xgcc.exe GNU)
CMAKE_FORCE_CXX_COMPILER(xgcc.exe GNU)
SET(CMAKE_C_LINK_EXECUTABLE "c:/MoSync/bin/pipe-tool.exe")
FILE(TO_NATIVE_PATH path result)

SET(MOSYNC_PIPE_TOOL "")
FILE(TO_NATIVE_PATH "c:/MoSync/bin/pipe-tool.exe" MOSYNC_PIPE_TOOL)
SET(CMAKE_STATIC_LIBRARY_SUFFIX ".lib")

SET(STATIC_LIBRARY_FLAGS "-collect-stabs -sld -sc:/MoSync/lib/pipe")
#HACK: I need to override the default build lib rule becouse it doesn't use CMAKE_AR variable
SET(CMAKE_C_CREATE_STATIC_LIBRARY "${MOSYNC_PIPE_TOOL} ${STATIC_LIBRARY_FLAGS} -L <TARGET> <OBJECTS>")
SET(CMAKE_CXX_CREATE_STATIC_LIBRARY "${MOSYNC_PIPE_TOOL} ${STATIC_LIBRARY_FLAGS} -L <TARGET> <OBJECTS>")

#SET(CMAKE_C_CREATE_STATIC_LIBRARY "${MOSYNC_PIPE_TOOL} cr <TARGET> <LINK_FLAGS> <OBJECTS>")

MESSAGE("C ${CMAKE_C_CREATE_STATIC_LIBRARY}")
MESSAGE("CXX ${CMAKE_CXX_CREATE_STATIC_LIBRARY}")


#SET(CMAKE_C_FLAGS -S -MMD -MF C:\\MoSync\\workspace\\Test1\\Output\\main.s.deps -DMAPIP)
ADD_DEFINITIONS("-S")
ADD_DEFINITIONS("-MMD")
#FIXME add -MF option  
#ADD_DEFINITIONS("-MF C:\\MoSync\\workspace\\Test1\\Output\\main.s.deps")
ADD_DEFINITIONS(-DMAPIP)

#FIXME DO we need clock?
ADD_DEFINITIONS(-DNO_CLOCK)

#FIXME this force a generic i386 GNU machine. It compile but I think it needs further investigation.
ADD_DEFINITIONS(-D__GNU__)
ADD_DEFINITIONS(-D__i386__)
#FIXME HACK using this macro we exclude clock_t functions.
ADD_DEFINITIONS(-DSMALL_CONFIG)


SET (SDKROOT "c:\\MoSync\\")
#Set system includes
INCLUDE_DIRECTORIES(SYSTEM "${SDKROOT}/include")

# where is the target environment 
#SET(CMAKE_FIND_ROOT_PATH  /opt/eldk-2007-01-19/ppc_74xx /home/alex/eldk-ppc74xx-inst)

# search for programs in the build host directories
#SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


