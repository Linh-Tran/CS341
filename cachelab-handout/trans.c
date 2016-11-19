/* Linh Tran
 * litran11794
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
  int r, rb, c, cb,tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8;
  //  if(M == 32 && N == 32){
    for(cb = 0; cb < M; cb+=8){
      for(rb = 0; rb < N; rb+=8){
	for(r = rb; r < rb + 8; r++){
	  for(c = cb; c < cb + 8; c++){
	    tmp1= A[rb+r][cb+0];
	    tmp2= A[rb+r][cb+1];
	    tmp3= A[rb+r][cb+2];
	    tmp4= A[rb+r][cb+3];
	    tmp5= A[rb+r][cb+4];
	    tmp6= A[rb+r][cb+5];
	    tmp7= A[rb+r][cb+6];
	    tmp8= A[rb+r][rb+7];
	    B[cb+0][rb+r] = tmp1;
	    B[cb+1][rb+r] = tmp2;
	    B[cb+2][rb+r] = tmp3;
	    B[cb+3][rb+r] = tmp4;
	    B[cb+4][rb+r] = tmp5;
	    B[cb+5][rb+r] = tmp6;
	    B[cb+6][rb+r] = tmp7;
	    B[cb+7][rb+r] = tmp8;
	    //  A[r][c] = B[c][r];
	  }
	}
      }
    }
    //  }
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

