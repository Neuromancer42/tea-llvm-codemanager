int foo(int x) {
    return x + 1;
}
int bar(int x) {
    return x - 1;
}
int main() {
    int a = 0;
    int b = foo(a);
    int (*p)(int);
    p = bar;
    p = foo;
    int c = p(b);
    return c;
}