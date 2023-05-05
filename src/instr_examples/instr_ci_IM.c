#include "stdio.h"

void __tea__ci_IM(unsigned tid, void * called, void * target){
    FILE *tea_fp = fopen("tea_log.txt", "a+");
    int match = called == target;
    fprintf(tea_fp, "ci_IM %u %d\n", tid, match);
    fclose(tea_fp);
}