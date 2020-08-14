int board[4][4];
int x[4][4], y[4][4], z[4][4], w[4][4];



struct node* np;
np = malloc(sizeof(struct node));
np->board[4][4];


struct node {
    int board[N+1][N];
    struct node *next();
}

int main(int argc, char **argv) {
    int iter, count, total;
    struct node *tsucc, *csucc, *copen, *topen, *open, *closed, *succ;
}

struct node *expand(struct node *cp) {
    struct node *succ = NULL;
    int N = sizeof(cp->board) / sizeof(cp->board[0]);
    struct node *newp = malloc(sizeof(struct node));
    int row, col;
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (cp->board[i][j] == "") {
                row = i;
                col = j;
                // break the loop and move this to a seperate func
            }
            newp->board[i][j] = cp->board[i][j];
        }
    }
    // Create Down Option | row+1 col
    newp->board[row+1][col] = cp->board[row][col];
    newp->board[row][col] = cp->board[row+1][col];
    succ[0] = newp->board;
    // Reset newp

    // Create Right Option | row col+1
    newp->board[row][col+1] = cp->board[row][col];
    newp->board[row][col] = cp->board[row][col+1];

    // up = row-1 col
    // left = row col-1


    // How it should be running with several funcs
    // if row < N - 1 {
    // down: np = move(cp, i, j, i+1, j)
    succ = append(np, succ);
    // if col < N - 1 {
    // right: np = move(cp, i, j, i, j+1)
    succ = append(np, succ);
    // if col > 0 {
    // left: np = move(cp, i, j, i, j-1)
    succ = append(np, succ);
    // if row > 0 {
    // up: np = move(cp, i, j, i-1, j)
    succ = append(np, succ);

    return succ;
}

// Finish Watching July 7th Class to finish