#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

void* malloc_helper (size_t x) {
    void *str;
    str = malloc(x);
    return str;
}
