static int special_global[2] = { 7, 7 };

void internal_init() {
    special_global[0] += 7;
}

int internal_get() {
    return special_global[0];
}
