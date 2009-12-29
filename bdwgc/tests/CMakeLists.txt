# (C) Jack Andrews 2008
# licensed under GPL 2.0

ADD_DEFINITIONS(-DGC_NOT_DLL)
IF(WIN32)
	ADD_EXECUTABLE(gctest WIN32 test.c)
ELSE()
	ADD_EXECUTABLE(gctest test.c)
ENDIF(WIN32)

TARGET_LINK_LIBRARIES(gctest gc)
