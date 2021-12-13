#include <stdio.h>

int main() {
	FILE *file;
	if(file = fopen("bin/user.txt", "r"))
	{
		char c = fgetc(file);
		// print Hello for first user
		if(c != EOF)
		{
			printf("Hello ");
		}
    		while (c != EOF)
    		{
			// print Hello for other user
			if (c == '\n' && c != '\0')
			{
				printf("\nHello ");
				c = fgetc(file);
				continue;
			}
        		printf("%c",c);
        		c = fgetc(file);
    		}
		fclose(file);
	}
	else
	{
		puts("Hello World!");
	}
}
