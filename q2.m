#include<Foundation/Foundation.h>

int maze[10][10]= {
   { 1,1,1,1,1,0,0,1,1,1},
   { 0,1,1,1,1,1,0,1,0,1},
   { 0,0,1,0,1,1,1,0,0,1},
   { 1,0,1,1,1,0,1,1,0,1},
   { 0,0,0,1,0,0,0,1,0,1},
   { 1,0,1,1,1,0,0,1,1,0},
   { 0,0,0,0,1,0,0,1,0,1},
   { 0,1,1,1,1,1,1,1,0,0},
   { 1,1,1,1,1,0,0,1,1,1},
   { 0,0,1,0,0,1,1,0,0,1},
};

int n=10;
int m=10;

int shortestPath(int i, int j, int desti, int destj) {
    if(i==desti && j==destj) return 0;
    int m=99999;
    if(i+1<n && maze[i+1][j]==0) {
        maze[i+1][j]=1;
        int temp=shortestPath(i+1,j,desti,destj);
        if(temp!=INT_MAX) m=1;
        if(temp!=-1){
            if(m>temp) m=temp;
        }
    }

    if(i-1>=0 && maze[i-1][j]==0) {
        maze[i-1][j]=1;
        int temp=shortestPath(i-1,j,desti,destj);
        if(temp!=INT_MAX) m=1;
        if(temp!=-1){
            if(m>temp) m=temp;
        }
    }

    if(j+1<m && maze[i][j+1]==0) {
        maze[i][j+1]=1;
        int temp=shortestPath(i,j+1,desti,destj);
        if(temp!=INT_MAX) m=1;
        if(temp!=-1){
            if(m>temp) m=temp;
        }
    }

    if(j-1>=0 && maze[i][j-1]==0) {
        maze[i][j-1]=1;
        int temp=shortestPath(i,j-1,desti,destj);
        if(temp!=INT_MAX) m=1;
        if(temp!=-1){
            if(m>temp) m=temp;
        }
    }

    return m;
}
int main(int argc, char **argv){
    int i=0,j=0,desti=7,destj=5;
    printf("%d\n",shortestPath(i,j,desti,destj));
    return 0;
}