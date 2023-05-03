#include <stdio.h>
#include <inttypes.h>

extern "C"{

void tea_reachable(int tid, uint8_t *methName){
    FILE *tea_fp = fopen("tea_log.txt", "a+");
    fprintf(tea_fp, "%d,0,%s\n", tid, methName);
    fclose(tea_fp);
}

void tea_ci(int tid, uint64_t *ci_addr){
    FILE *tea_fp = fopen("tea_log.txt", "a+");
    fprintf(tea_fp, "%d,1,%lu\n", tid, (unsigned long)ci_addr);
    fclose(tea_fp);
}

void tea_im(int tid, uint64_t *im_addr){
    FILE *tea_fp = fopen("tea_log.txt", "a+");
    fprintf(tea_fp, "%d,2,%lu\n", tid, (unsigned long)im_addr);
    fclose(tea_fp);
}

void tea_phval(int tid, uint8_t *varName, uint32_t *PHVal){
    FILE *tea_fp = fopen("tea_log.txt", "a+");
    fprintf(tea_fp, "%d,3,%u,%s\n", tid, *PHVal, varName);
    fclose(tea_fp);
}

}