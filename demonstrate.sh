#!/usr/bin/env sh

echo "Without -fvisibility=hidden:"
make clean && make && ./test
echo

echo "With -fvisibility=hidden:"
make clean && SO_CFLAGS=-fvisibility=hidden make && ./test
echo

echo "With -Bsymbolic-functions:"
make clean && SO_LDFLAGS=-Wl,-Bsymbolic-functions make && ./test
echo

echo "With -Bsymbolic:"
make clean && SO_LDFLAGS=-Wl,-Bsymbolic make && ./test
echo
