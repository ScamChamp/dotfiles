#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
//todo fix when only one todo item
//scanf("agenda,%c,",&chr); 
//scanf("agenda,%[^,]%*c", str)
//printf("You entered %c.", str);  
FILE *fp;
char path[600];
char str[16];
char root[100];
char str2[16];
char temp[6];
void todo(){
fp = popen("emacs -batch -l /home/pranshu/.emacs.d/todo.el -eval '(org-batch-agenda-csv \"a\" todo )'","r");
short i =0;
 while (fgets(path, sizeof(path), fp) != NULL) {	
    if (i==0)	
    sscanf(path,"agenda,%7[^,]",str);
    else {
    	strcpy(temp,str);
    sscanf(path,"agenda,%7[^,]",str);
 	strcpy(str2,str);  
    	strcpy(str, temp);		}
    ++i;
    if (i==2) break;
  }
 if (i==0)
 {
 strcpy(str,"[]");
 strcpy(str2,"<>");
 }
 pclose(fp);

}

int main(){


time_t t = time(NULL);
char buf[256];
struct tm *ptm = localtime(&t);
strftime(buf, 256, "%H:%M %d/%m/%Y", ptm);
short dumnum = ptm->tm_hour;

todo();
while(1){
	time(&t);
	ptm=localtime(&t);
	strftime(buf, 256, "%H:%M %d/%m/%Y", ptm);


	if(dumnum != ptm->tm_hour){
		dumnum=ptm->tm_hour;
		todo();
	}

	sprintf(root,"xsetroot -name ' %s %s %s'",str,str2, buf);

	system(root);
	
	sleep(60);
}


return 0;

}
