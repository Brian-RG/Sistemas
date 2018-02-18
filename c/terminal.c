#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>

int main(){
		pid_t pid;
		char read[40];	
		char* arg0;
		char* arg1;
		char *s=" ";
		char *n="\n";
		//printf("Welcome to my terminal! Commands: ls, ls -la, cat file, exit\n");
		start:
		printf("#");
		fgets(read,40,stdin);
		strtok(read,n);
		arg0 =strtok(read,s);
		arg1 =strtok(NULL,s);
		if(strcmp(arg0,"exit")==0){
			return 0;
		}	
		pid = fork();
		if(pid<0) {
			/*esto es si ocurre un error*/
			printf(stderr, " Error al hacer el fork()");
			exit(-1);
		}
		else if(pid == 0) {
			printf("***********************************************************\n");
			char path[]="/bin/";
			strcat(path,arg0);		
			execl(path,arg0,arg1,NULL);
		}
			wait(NULL);
			goto start;			
}
