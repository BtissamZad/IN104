 #include <stdlib.h>
 #include <stdio.h>
 #include <stdbool.h>

 // fonctions arithmétiques
                double je_gagne (double a, double b){
                    double s= a+b;
                    return s;
                }

                double je_perds(double a,double b){
                    double s=a-b;
                    return s;
                }

                int quotient( int a,int b){
                    if (b!=0){
                    int q=a/b;
                    }
                    return q;
                }

                int reste (int a, int b){
                    int r=a%b;
                    return r;
                }

                double division( double a, double b){
                    if (b!=0){
                    double d= a./b.;
                    }
                    return d;
                }

                double min_tableau ( double* T,unsigned int n){
                    double min=T[0];
                    for (int i=0;i<n;i++){
                        if (T[i]<min){
                                min=T[i];
                        }
                    }
                    return min;
                }

                double max_tableau (double* T,unsigned int n){
                    double max=T[0];
                    for(int i=0;i<n;i++){
                        if(T[i] > max){
                                max=T[i];
                        }
                    }
                    return max;
                }

                double val_abs (double a){
                    if(a<0){ a=-a;}
                    return a;
                }

/* SUR LES LISTES  on traite des listes d'entiers ( reste à généraliser :) )*/
            typedef struct liste {
                int valeur;
                struct liste* suivant;
            }liste;

   // pour tester l'égalité entre 2 listes : cela renvoie soit 0 soit 1
            int list_egalite(liste* l , liste* m)
            {
                while(l != NULL && m != NULL)
                {
                    if(l->valeur != m->valeur)
                        return 0;
                    l = l->suivant;
                    m = m->suivant;
                }
                return (l == NULL && m == NULL);
            }

            liste ajout_en_tete( liste* l,int elem){
                liste* tmp =malloc(sizeof(struct liste));
                if ( tmp == NULL ) return ( NULL ) ;
                tmp -> valeur= elem ;
                tmp -> suivant = l ;
                return ( tmp ) ;
            }

            int pop(liste* l){
                int Val;
                liste* tmp;
                if(!l) { return -1;  } // cela renvoie -1 si la liste est déjà vide
                // à compléter pour après
            }

