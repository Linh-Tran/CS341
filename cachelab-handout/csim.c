
  
/*
 * Cachelab Assignment: Stimulates a cache stimalation
 * Linh Tran
 * Litran11794
 */
#include "cachelab.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//S rows
//E  columns

struct cacheLine{
  int  valid_bit; //dirty-bit
  long long tag_bits; 
  long long time_lru;  //least replaced unit
};

int s, E, b = 0;
int S, B = 0;
int verbose, help; 
int hit, miss, eviction = 0;
long long set_indx_mask, time_lru_tracker = 0;
FILE *file = NULL;

//Pointer to pointer to cacheElements struct 
struct cacheLine **cache = NULL; 

void parse_file();
void printVerbose();
void printHelp();
void initCache();
void checkCache(unsigned long address);
void freeCache();

void parse_file()
{
  char line[64];
  while(fgets(line, 64, file) != NULL){ 
    unsigned long address = 0; //unsigned for log shift range 0 to 4.2 million 
    int size_Bytes = 0;
    if(line[1] == 'M' || line[1] == 'L' || line[1] == 'S'){
      sscanf(line+3, "%lx, %d", &address, &size_Bytes);
  
      if(verbose) printf("%c %lx, %d ", line[1], address, size_Bytes);
      checkCache(address);
      
      if(line[1] == 'M') checkCache(address);
      if(verbose) printf("\n");
    }
  }
}

void printHelp()
{
  printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
  printf("Options:\n");
  printf(" -h         Print this help message.\n");
  printf(" -v         Optional verbose flag.\n");
  printf(" -s <num>   Number of set index bits.\n");
  printf(" -E <num>   Number of lines per set.\n");
  printf(" -b <num>   Number of block offset bits.\n");
  printf(" -t <file>  Trace file.\n\n");
  printf("Examples:\n");
  printf(" linux>  ./csim -s 4 -E 1 -b 4 -t traces/yi.trace\n");
  printf(" linux>  ./csim -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");
}

void initCache(){

  S = 1 <<s; // computes # of sets S = 2^s
  B = 1 <<b; // computes # of offset bytes B = 2^b
  
  //malloc vs. calloc: 
  //http://cs-fundamentals.com/tech-interview/c/difference-between-malloc-and-calloc.php
  
  //malloc 2D arrays:
  //https://www.eskimo.com/~scs/cclass/int/sx9b.html
  //Allocates memory so that we have pointer that points to an array of S(rows) number of elements
  cache = malloc(S*sizeof(*cache));
  
  if(cache == NULL){
    fprintf(stderr, "Not enough space\n");
  }

  int i;
  for(i = 0; i<S; i++){
    //Allocates memory so that we have each row of pointers holds a pointer to E(columns) 
    //number of cacheElement struct type and initialize them to be zero.  
    cache[i] = calloc(E, sizeof(*cache[i])); 
  }
  
  /* 
   *set_indx_mask = S -1
   * because cache we want values continous block of on bits for set_indx  
   * ex.
   *     Where S = 8 => s = 3, B = 4 => b = 2
   *      s = CI (index_bits), b = CO (offset_bits)
   *     |CT |CT |CT |CT |CT |CT |CT |CT |CI |CI |CI |CO |CO 
   *      12  11  10  9   8   7   6   5   4   3   2   1   0                                        
   *      address >> b 
   *             |CT |CT |CT |CT |CT |CT |CT |CT |CI |CI |CI 
   *                                              2   1   0   
   *      address >> b & set_indx_mask (address >> 2 & 7)    
   *      0 0000 0000 0111 
   */
  set_indx_mask = S - 1; 
 
  //printf("set_indx_mask %llu \n", set_indx_mask);
  //cache = malloc(S*E*sizeof(**cache));
}

void checkCache(unsigned long address)
{
  //ex. address: 0x6000A8C, tagBits = 0x30054, setIndx = 3, b = 2, s= 3
  //    0000 0000 0110 0000 0000 1010 1000 1100 (address)
  //    0000 0000 0001 1000 0000 0010 1010 0011 (address >> b)
  //    0000 0000 0000 0000 0000 0000 0000 0011 (address >> b & set_indx_mask)
  
  //    0000 0000 0110 0000 0000 1010 1000 1100 (address)
  //    0000 0000 0000 0011 0000 0000 0101 0100 (address >> s+b)
  
  long long setIndx = address >> b & set_indx_mask;
  long long tagBits = address >> (b+s); //logarithmic shift
  // printf("address: %lx, setIndx %llx\n\n", address, setIndx); 
  // printf("tagBits %llx\n\n", tagBits);

  int i;
  for(i=0; i<E; i++){
    if(cache[setIndx][i].tag_bits == tagBits && cache[setIndx][i].valid_bit){
      if(verbose) printf("hit ");
      hit++;
      
      //assign the time of the current cache line to be time_lru_tracker
      cache[setIndx][i].time_lru = time_lru_tracker;
      time_lru_tracker++; 
      //      printf("address: %lx, setIndx %llx, tagBits %llx\n, time.lru: %llu \n\n", address,setIndx,tagBits,cache[setIndx][i].time_lru);
      return;
    }
  }

  miss++;
  long long lru_min = 0xffffffff; 
  int evict_line = 0;
  if(verbose) printf("miss ");
  for(i = 0; i<E; i++){
    //compare the current cach line to the least access line
    // printf("address: %lx, setIndx %llx, tagBits %llx\n, time.lru: %llu, lru_min:%llu \n\n",  address,setIndx,tagBits, cache[setIndx][i].time_lru, lru_min);
    //printf("time.lru: %llu, lru_min:%llu \n\n", cache[setIndx][i].time_lru, lru_min);
    if(cache[setIndx][i].time_lru < lru_min){
      //set this line to be evicted
      evict_line = i;
      //reset the new minimum least access time to be the current time
      //cache line that was missed.
      lru_min = cache[setIndx][i].time_lru;
    }
  }

  //check if the evicted line is valid
  if(cache[setIndx][evict_line].valid_bit){
    eviction++;
    if(verbose) printf("eviction ");
  }
  
  //replace the old information placed in that line
  //set the evicted line to be valid
  //set he tag bits to the equal to the current address
  //and incrm its timer
  cache[setIndx][evict_line].valid_bit = 1;
  cache[setIndx][evict_line].tag_bits = tagBits;
  cache[setIndx][evict_line].time_lru = time_lru_tracker;
  time_lru_tracker++;
}


void freeCache(){
  int i;
  for(i=0; i<S; i++){
    free(cache[i]);
  }
  free(cache);
}

int main(int argc, char *argv[])
{
  int flag = 0; //gets the numbers to the right of string arguments (-v,-h,-hv,-s,-E,-b)
  if(argc <9) {
    fprintf(stderr,"Not enough arguments\n");
    return 1;
  }
  else if(!strcmp(argv[1], "-v")) {
    verbose = 1;
    flag = 1;
  }
  else if(!strcmp(argv[1], "-h")){
    help = 1;
    flag = 1;
  }
  else if(!strcmp(argv[1], "-hv") || !strcmp(argv[1], "-vh")){
    verbose = 1;
    help = 1;
    flag = 1;
  }

  sscanf(argv[flag+2],"%d",&s); //s could be at position argv[1] or argv[2]
  sscanf(argv[flag+4],"%d",&E); //E "                   "argv[3] or argv[4]
  sscanf(argv[flag+6],"%d",&b); //b "                   "argv[5] or argv[6]
  
  //printf("s = %d E = %d b = %d S = %d\n",s,E,b,S);
  file = fopen(argv[flag+8], "r");

  if(file != NULL){
    initCache(); 
    parse_file();
    freeCache();
    fclose(file);
    if(help) printHelp();
  }

  else{
    fprintf(stderr,"Couldn't open file\n");
    return 1;
  }
  
  if(!help) printSummary(hit, miss, eviction);
  return 0;
}
