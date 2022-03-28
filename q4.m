#include<Foundation/Foundation.h>

/*
The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.
*/
void printBoard(NSMutableArray *board) {
    for (int i = 0; i < board.count; i++) {
        for (int j = 0; j < board.count; j++) {
            printf("%c", [board[i][j] intValue] == 1 ? 'Q' : '.');
        }
        printf("\n");
    }
    printf("\n");
}

bool isSafe(NSMutableArray *board, int row, int col) {
    for (int i = 0; i < col; i++) {
        if ([board[row][i] intValue] == 1) {
            return false;
        }
    }
    for (int i = row, j = col; i >= 0 && j >= 0; i--, j--) {
        if ([board[i][j] intValue] == 1) {
            return false;
        }
    }
    for (int i = row, j = col; j >= 0 && i < board.count; i++, j--) {
        if ([board[i][j] intValue] == 1) {
            return false;
        }
    }
    return true;
}

bool nqueen(NSMutableArray *board, int col) {
    if (col >= board.count) {
        return true;
    }
    for (int i = 0; i < board.count; i++) {
        if (isSafe(board, i, col)) {
            board[i][col] = @1;
            if (nqueen(board, col + 1)) {
                return true;
            }
            board[i][col] = @0;
        }
    }
    return false;
}
int main() {
    NSMutableArray *board = [NSMutableArray array];
    for (int i = 0; i < 8; i++) {
        NSMutableArray *row = [NSMutableArray array];
        for (int j = 0; j < 8; j++) {
            [row addObject:@0];
        }
        [board addObject:row];
    }
    nqueen(board, 0);
    printBoard(board);
    return 0;
}
