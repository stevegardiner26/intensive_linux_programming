#include <stdio.h>

int main() {
    const int n = 10;
    int lst[n] = { 0x0000, 0x4c7f, 0xcd80, 0x41fc, 0x782c, 0x8b74, 0x7eb1, 0x9a03, 0xaa01, 0x73f1 };
    int buf[n] = {};

    int bits = 32;
    int radix = 4;

    int buckets = 1 << radix;
    int mask = buckets - 1;
    int group = radix;
    int rounds = bits / radix;

    int n = bits;

    int *src[n];
    int *dst[n];

    for (int i=0; i < n; i=i+group) {
        *src = lst;
        *dst = buf;

        /* Counting */
        int count[buckets];
        for (int j=0; j < buckets; j++) {
            count[j] = 0;
        }
        for (int j=0; j < n; j++) {
            count[((src[j] >> i) & mask)]++;
        }

        /* Mapping */
        int map[buckets];
        for (int j=1; j < buckets; j++) {
            map[j] = (map[j-1] + count[j-1]);
        }

        /* Moving */
        for (int j=0; j < n; j++) {
            /*printf("lst %d %x \n", i, lst[i]);*/
            dst[map[((src[j] >> i) & mask)]] = src[j];
            map[((src[j] >> i) & mask)]++;
        }

        for (int j=0; j < n; j++) {
            /*printf("%d) %x \n", i, buf[i]);*/
            printf("%x", buf[j]);
        }
    }
    return 0;
}