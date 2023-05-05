#include "stdio.h"

void __tea__ci_Vval(unsigned tid, int val){
    FILE *tea_fp = fopen("tea_log.txt", "a+");
    fprintf(tea_fp, "ci_Vval %u %d\n", tid, val);
    fclose(tea_fp);
}