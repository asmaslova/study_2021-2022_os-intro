#include "common.h"

int main()
{
  int readfd; /* дескриптор для чтения из FIFO */
  int n;
  char buff[MAX_BUFF]; /* буфер для чтения данных из FIFO */

  printf("FIFO Server...\n");

  if(mknod(FIFO_NAME, S_IFIFO | 0666, 0) < 0)
    {
      fprintf(stderr, "%s: Невозможно создать FIFO (%s)\n",
	      __FILE__, strerror(errno));
      exit(-1);
    }

  if((readfd = open(FIFO_NAME, O_RDONLY)) < 0)
    {
      fprintf(stderr, "%s: Невозможно открыть FIFO (%s)\n",
	      __FILE__, strerror(errno));
      exit(-2);
    }

  clock_t now=time(NULL), start=time(NULL);
  while(now-start<30)
    {
      while((n = read(readfd, buff, MAX_BUFF)) > 0)
	{
	  if(write(1, buff, n) != n)
	    {
	      fprintf(stderr, "%s: Ошибка вывода (%s)\n",
		      __FILE__, strerror(errno));
	      exit(-3);
	    }
	}
      now=time(NULL);
    }

  printf("\n-----\nserver timeout\n%li seconds passed!\n-----\n", now-start);
  close(readfd);
 
  if(unlink(FIFO_NAME) < 0)
    {
      fprintf(stderr, "%s: Невозможно удалить FIFO (%s)\n",
	      __FILE__, strerror(errno));
      exit(-4);
    }

  exit(0);
}
