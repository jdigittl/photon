INCLUDE = -I/usr/include/
LIBDIR  = -L/usr/X11R6/lib 

COMPILERFLAGS = -Wall  -O3 -DOPENGL_DEPRECATED
CC = gcc
CFLAGS = $(COMPILERFLAGS) $(INCLUDE) 
COMMON_LIBRARIES=
LINUX_LIBRARIES = -lX11 -lXmu -lGL -lGLU -lm  -lglut
MAC_LIBRARIES=-framework GLUT -framework OpenGL -framework Cocoa -framework CoreAudio -framework AudioUnit -framework AudioToolbox -framework OpenCL
SRC=main.c gl.c tracer.c wireframe.c
PROG=photon
FPACK=file_pack/fpack

mac: $(SRC)
	$(CC) $(SRC) $(CFLAGS) -o $(PROG) -DMAC $(COMMON_LIBRARIES) $(MAC_LIBRARIES)

dist:
	strip $(PROG)
	upx -9 $(PROG)

linux: $(SRC)
	$(CC) $(SRC) $(CFLAGS) -o $(PROG) $(LIBDIR) $(LIBRARIES)

clean:
	rm -f $(PROG)


