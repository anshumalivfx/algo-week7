#include <Foundation/Foundation.h>
int score(NSString *s) {
    int score = 0;
    int left = 0;
    for (int i = 0; i < s.length; i++) {
        if ([s characterAtIndex:i] == '(') {
            left++;
        } else {
            left--;
        }
        score += left;
    }
    return score;
}

int main() {
    NSString *s = @"())((()))()(())";
    NSLog(@"%d", score(s));
    return 0;
}