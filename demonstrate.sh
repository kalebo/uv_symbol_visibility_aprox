#!/usr/bin/env bash
set -x

function SUPL {
	readelf -Was test | c++filt | grep internal_init
	readelf -Was test | c++filt | grep special_global
	readelf -Was internal7.o | c++filt | grep internal_init
	readelf -Was internal7.o | c++filt | grep special_global
}

# echo "Without -fvisibility=hidden:"
# make clean && make && ./test
# SUPL
# echo
# 
echo "With -Bsymbolic-functions:"
make clean && SO_LDFLAGS=-Wl,-Bsymbolic-functions make && ./test && LD_PRELOAD=libget_seven.so:libget_three.so ./test
SUPL
echo

echo "With -Bsymbolic:"
make clean && SO_LDFLAGS=-Wl,-Bsymbolic make && ./test && LD_PRELOAD=libget_seven.so:libget_three.so ./test
SUPL
echo

echo "With .so -fvisibility=hidden:"
make clean && SO_CFLAGS=-fvisibility=hidden make && ./test && LD_PRELOAD=libget_seven.so:libget_three.so ./test
SUPL
echo

echo "With .a -fvisibility=hidden:"
make clean && A_CFLAGS=-fvisibility=hidden make && ./test && LD_PRELOAD=libget_seven.so:libget_three.so ./test
SUPL
echo

echo "With .a and .so -fvisibility=hidden:"
make clean && A_CFLAGS=-fvisibility=hidden SO_CFLAGS=-fvisibility=hidden make && ./test && LD_PRELOAD=libget_seven.so:libget_three.so ./test
SUPL
echo

