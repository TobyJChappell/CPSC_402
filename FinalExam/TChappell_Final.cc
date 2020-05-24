#include "env.h"

int main()
{
	int x, y;
	{
		y = 9;
		int y;
		y = 0;
	}
	x = ++y/2;
	while(x > 0) y = y+x--;
	printInt(y);
	return 0;
}
