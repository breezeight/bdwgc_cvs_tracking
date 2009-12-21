# this one is important
SET(CMAKE_SYSTEM_NAME Mosync)

#  specify the cross compiler
INCLUDE(CMakeForceCompiler)
SET(CMAKE_C_COMPILER   xgcc.exe)
SET(CMAKE_CXX_COMPILER xgcc.exe)
#CMAKE_FORCE_C_COMPILER(xgcc.exe GNU)
#CMAKE_FORCE_CXX_COMPILER(xgcc.exe GNU)
SET(CMAKE_C_LINK_EXECUTABLE "c:\\MoSync\\bin\\pipe-tool.exe")


#SET(CMAKE_C_FLAGS -S -MMD -MF C:\\MoSync\\workspace\\Test1\\Output\\main.s.deps -DMAPIP)
ADD_DEFINITIONS("-S")
ADD_DEFINITIONS("-MMD")
#FIXME add -MF option  
#ADD_DEFINITIONS("-MF C:\\MoSync\\workspace\\Test1\\Output\\main.s.deps")
ADD_DEFINITIONS(-DMAPIP)

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


