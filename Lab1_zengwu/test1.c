#include <stdio.h>
#include "test1.h"
// 最大数量数
#ifndef MAXNUM
#define MAXNUM 5
#endif
// 获取最大值
#ifndef MAX
#define MAX(a, b) (((a) > (b)) ? (a) : (b))
#endif
// 如果a是负数则执行下一条语句
#ifndef IFNEGATIVE
#define IFNEGATIVE(a) if ((a) < 0)
#endif

stu s;
float score1, score2;
int main(){
    printf("input num, score1 and score2:\n");
    scanf("%d%f%f", &s.num, &score1, &score2);
    s.score = MAX(score1, score2);
    printf("Num:%d\nMaxScore(.2f):%.2f\n\n", s.num, s.score);
    /*
    以下代码对数组进行排序
    然后对结果进行输出
    */
    int b[MAXNUM] = {8, 4, 10, 2, 6};
    const int n = 5;
    sort(b, n);
    int i = n - 1;
    while (1){
        printf("%d\n", b[i--]);
        IFNEGATIVE(i)
        break;
    }
    return 0;
}

void sort(int *arr, int n){
    for (int i = 0; i < n; i++){
        int k = i;
        for (int j = i + 1; j < n; j++)
            if (arr[k] > arr[j])
                k = j;
        if (k != i){
            int temp = arr[i];
            arr[i] = arr[k];
            arr[k] = temp;
        }
    }
}