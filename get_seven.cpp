#include "get_seven.h"
#include "internal7.h"

int PublicGetSeven() {
    return internal_get();
}

void PublicInitSeven() {
    internal_init();
}
