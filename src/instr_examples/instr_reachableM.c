#include "stdio.h"

void __tea__reachableM(unsigned tid){
    FILE *tea_fp = fopen("tea_log.txt", "a+");
    fprintf(tea_fp, "reachableM %u\n", tid);
    fclose(tea_fp);
}
