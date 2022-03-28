#include <Foundation/Foundation.h>
#include "q1.h"

char board[3][4]= {
       {'a','b','c','e'},
       {'s','f','c','s'},
       {'a','d','e','e'},
};
@implementation Q1
-(bool)find: i:(int)i j:(int)j word:(NSString*)word {
    if([word length] == 0) return true;
    if(i-1>0) {
        if([board[i-1][j] isEqualToString:word]){
            board[i-1][j] = '-';
            if([self find:i-1 j:j word:[word substringFromIndex:1]]) return true;
            board[i-1][j] = [word substringFromIndex:0];
        }
    }
    if(i+1<3) {
        if([board[i+1][j] isEqualToString:word]){
            board[i+1][j] = '-';
            if([self find:i+1 j:j word:[word substringFromIndex:1]]) return true;
            board[i+1][j] = [word substringFromIndex:0];
        }
    }
    if(i-1>=0){
        if([board[i][j-1] isEqualToString:word]){
            board[i][j-1] = '-';
            if([self find:i j:j-1 word:[word substringFromIndex:1]]) return true;
            board[i][j-1] = [word substringFromIndex:0];
        }
    }
    if(i+1<4){
        if([board[i][j+1] isEqualToString:word]){
            board[i][j+1] = '-';
            if([self find:i j:j+1 word:[word substringFromIndex:1]]) return true;
            board[i][j+1] =  [word substringFromIndex:0];
        }
    }
    return false;


}

-(bool)solution: word:(NSString*)word {
    for(int i=0; i<3; i++) {
        for(int j=0; j<4; j++) {
            if([board[i][j] isEqualToString:word]){
                board[i][j] = '-';
                if([self find:i j:j word:[word substringFromIndex:1]]) return true;
                board[i][j] = [word substringFromIndex:0];
            }
        }
    }
    return false;
}
@end


int main(int argc, char **argv){
    @autoreleasepool{
        Q1 *q1 = [[Q1 alloc] init];
        NSLog(@"%d", [q1 solution:@"abce"]);

    }
}