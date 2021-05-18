
CFLAGS+=-g -Wall

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	FINAL_EXE_LDFLAGS+=-Wl,-rpath=.
endif

ALL: test

test: test.cpp libget_three.so libget_seven.so
	g++ $(CFLAGS) $(FINAL_EXE_LDFLAGS) -o test test.cpp -L. -lget_three -lget_seven -l:libinternal7.a






internal3.o: internal3.h internal3.cpp
	g++ $(CFLAGS) $(SO_CFLAGS) -o internal3.o -c -fPIC internal3.cpp
libinternal3.a: internal3.o
	ar -rcs libinternal3.a internal3.o

libget_three.so: get_three.o libinternal3.a
	g++ $(SO_LDFLAGS) -o libget_three.so -shared get_three.o -L. -l:libinternal3.a
get_three.o: get_three.cpp get_three.h
	g++ $(CFLAGS) $(SO_CFLAGS) -o get_three.o -c -fPIC get_three.cpp






internal7.o: internal7.h internal7.cpp
	g++ $(CFLAGS) $(SO_CFLAGS) -o internal7.o -c -fPIC internal7.cpp
libinternal7.a: internal7.o
	ar -rcs libinternal7.a internal7.o

libget_seven.so: get_seven.o libinternal7.a
	g++ $(SO_LDFLAGS) -o libget_seven.so -shared get_seven.o -L. -l:libinternal7.a
get_seven.o: get_seven.cpp get_seven.h
	g++ $(CFLAGS) $(SO_CFLAGS) -o get_seven.o -c -fPIC get_seven.cpp



clean:
	rm -f test libget_three.so libget_seven.so *.o *.a
