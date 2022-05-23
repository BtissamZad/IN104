#include <stdio.h>
#include <stdlib.h>

/*
struct bnode {
    int root;
    struct bnode *left;
    struct bnode *right;
}
*/

void  infix (struct  bnode *n)
{
    if (n != NULL) {
        infix (n->left) ;
        printf (n->root) ;
        infix (n->right) ;
    }
}

