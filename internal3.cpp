static int special_global[2] = { 3, 3 };

void internal_init() {
    special_global[0] += 3;
}

int internal_get() {
    return special_global[0];
}
