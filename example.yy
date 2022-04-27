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
