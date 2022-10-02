// 学生结构体
typedef struct student{
    int num;
    float score;
} stu; 
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
void sort(int *arr, int n);
