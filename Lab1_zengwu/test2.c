#include "sylib.h"

float tempresult[10] = {};
float ComputePi()
{
	float pi = 0, term = 1;
	int n = 0;
	while (n < 50 && term >= 0.00000001f)
	{
		pi += term;
		if (n % 5 == 0)
			tempresult[n / 5] = 2 * pi;
		n++;
		term = term * n / (2 * n + 1);
	}
	return 2 * pi;
}
int main()
{
	float pi = ComputePi();
	putf("%f", pi);
	putch('\n');
	const int n = 10;
	int i = 0;
	while (i < n)
	{
		putf("%f", tempresult[i]);
		putch('\n');
		i++;
	}
	return 0;
}