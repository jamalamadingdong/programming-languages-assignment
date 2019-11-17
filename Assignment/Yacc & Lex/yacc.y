%{
    #include <stdio.h>
    #include <math.h>

    int count = 0;
    int array[1000000];


    void yyerror(const char *str)
    {
        fprintf(stderr,"error: %s\n",str);
    }
%}
%union
{
    int value;
}

%type <value> element 
%token <value> NUMBER
%token OSBRACKET CSBRACKET COMMA 

%%
list:
      OSBRACKET elements CSBRACKET
    
elements:
      elements COMMA element { array[count++] = $3; }
    | element { array[count++] = $1; }
    |
    
element: 
    NUMBER { $$ = $1; }
%%

int yywrap()
{
    return 1;
}

main()
{
    yyparse();
    int i, temp, sorted = 0;

    printf("Unsorted: [");
    for(i = 0; i < count; i++)
    {
        printf("%d,", array[i]);
    }

    printf("]\n");
    do
    {
        sorted = 1;
        for(i = 0; i < count; i++)
        {
            if(array[i] > array[i+1])
            {
                temp = array[i];
                array[i] = array[i+1];
                array[i+1] = temp;
                sorted = 0;
            }
        }
    }while(sorted != 1);

    printf("Sorted: [");
    for(i = 1; i < count + 1; i++)
    {
        printf("%d,", array[i]);
    }
    printf("]\n");
}
