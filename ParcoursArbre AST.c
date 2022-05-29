#include <stdio.h>
#include <stdlib.h>


struct racine {
    int data ; char caractere; char* expression ; double reel; bool verite;
};

struct bnode {
    struct racine root;
    struct bnode *left;
    struct bnode *right;
}

void  infix (struct  bnode *n)
{
    if (n != NULL) {
        infix (n->left) ;
        printf (*(n->root)) ;
        infix (n->right) ;
    }
}