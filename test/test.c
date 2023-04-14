#include <stdio.h>
int foo(int x) {
    printf("%lu\n", &foo);
    return x + 1;
}
int main() {
    int a = 0;
    int b = foo(a);
    int (*p)(int) = &foo;
    printf("%lu\n", p);
    int c = p(b);
    printf("%s\n", __func__);
    return b;
}