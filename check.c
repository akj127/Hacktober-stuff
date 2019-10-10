#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct directory{
    struct directory *child;
    struct directory *next;
    char name[50];
}LIST;
 
LIST * addnode(char n[])
{
    LIST *new=(LIST *)malloc(sizeof(LIST));
    if(new!=NULL)
    {
        new->next=NULL;
        new->child=NULL;
        strcpy(new->name,n);
    }
    return new;
}

int main(void) {
    FILE *ptr_file;
    char c[30];
    char buf[1000];
    LIST *head;
    LIST *keep = addnode("/");
    LIST *root;
    root=keep;
    const char s[2] = "/";
    
    ptr_file =fopen("a.in","r");
    if (!ptr_file)
    {
        return 1;
    }
    int q=0;
    
    while (fgets(buf,1000, ptr_file)!=NULL)
    { 
        if(q==0){
            if(strcmp(buf,"\n")==0)
            {
                q=1;
                break;
            }
            char *token = strtok(buf, s);
            head= keep;  

            while(token!=NULL)
            {
                if(head->child==NULL)
                {
                    LIST *t= addnode(token);
                    head->child=t;
                    head=t;
                    root=t;
                    //printf("%s\n",head->name );
                }
                else
                {
                    //printf("hu%s\n",(head->child)->name );
                    head=head->child;
                    //printf("jj%s\n",head->name );
                    while(head->next!=NULL){
                        //printf("hh%s\n",head->name );
                        //printf("hh%s\n",token );
                        if(strcmp(head->name,token)!=0)
                        {
                            //printf("gg%s\n",head->name );
                            //printf("%s\n",token );
                            head=head->next;  
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (strcmp(head->name,token)!=0)
                    {
                        LIST *t= addnode(token);
                        head->next=t;
                        root=t;
                        head=t;
                        //printf("jji%s\n",head->name );
                    }
                }
                token = strtok(NULL, s);
            }        
        }  
        else{
            char tut[1000];
            strcpy(tut,buf);
            char *token = strtok(buf, s);
            head= keep; 
            int t=0;  
            while(token!=NULL)
            {
                t=0;
                //printf("%s\n",head->name );
                if(strcmp((head->child)->name,token)==0)
                {
                    t=1;
                    head=head->child;
                    break;

                }
                else
                {
                    
                    root=head->child;
                    while(head->next!=NULL){
                        if(strcmp((root->next)->name,token)!=0)
                        {
                            root=root->next;
                        }
                        
                        else
                        {
                            t=1;
                            head=root->next;
                            break;
                        }
                    }
                       
                }
                if (t==0)
                    {
                        break;
                    }
                else
                {
                    token = strtok(NULL, s);
                }
            }        
            if(t==1)
                printf("Yes : %s",tut );
            else
                printf("NO  : %s",tut );
        }
    }

    fclose(ptr_file);
    return 0;
}

