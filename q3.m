#include <Foundation/Foundation.h>


void allPermutation(NSMutableArray *nums, NSMutableArray *result, NSMutableArray *temp, int start, int end) {
    if (start == end) {
        [result addObject:[temp copy]];
    } else {
        for (int i = start; i <= end; i++) {
            [temp exchangeObjectAtIndex:start withObjectAtIndex:i];
            allPermutation(nums, result, temp, start + 1, end);
            [temp exchangeObjectAtIndex:start withObjectAtIndex:i];
        }
    }
}

int main() {
    NSMutableArray *nums = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
    NSMutableArray *result = [NSMutableArray array];
    NSMutableArray *temp = [NSMutableArray arrayWithArray:nums];
    allPermutation(nums, result, temp, 0, nums.count - 1);
    NSLog(@"%@", result);
    return 0;
}