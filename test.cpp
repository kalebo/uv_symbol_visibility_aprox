#include <stdio.h>

#include "get_three.h" // julia
#include "get_seven.h" // node
#include "internal7.h"


int MyOwnGet() {
        return internal_do_calculation();
}

int main() {
    printf("myOwnGet returned %d\n", MyOwnGet());
    printf("PublicGetThree returned %d\n", PublicGetThree());
    printf("PublicGetSeven returned %d\n", PublicGetSeven());
}
