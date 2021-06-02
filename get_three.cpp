#include "get_three.h"
#include "internal3.h"

int PublicGetThree() {
    return internal_get();
}

void PublicInitSeven() {
    internal_init();
}
