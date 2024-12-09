// ** PLEASE ONLY CHANGE THIS FILE WHERE INDICATED **
// In particular, do not change the names of the variables.

int                    D = ...;
int              n[1..D] = ...;
int                    N = ...;
int              d[1..N] = ...;
float      m[1..N][1..N] = ...;


// Define here your decision variables and
// any other auxiliary program variables you need.
// You can run an execute block if needed.

dvar boolean x[1..N]; // x[i] = 1 if member i is part of the committee, 0 otherwise


// Write here the objective function.

maximize sum(i, j in 1..N: i < j) m[i][j] * x[i] * x[j];


subject to {
    // Exactly n[p] members must be selected for each department p
    forall(p in 1..D)
        sum(i in 1..N: d[i] == p) x[i] == n[p];

    // No pair with zero compatibility can be in the committee
    forall(i, j in 1..N: i < j && m[i][j] == 0)
        x[i] + x[j] <= 1;

    // Mediation rule: if 0 < m[i][j] < 0.15, there must exist a k with m[i][k] > 0.85 and m[j][k] > 0.85
    forall(i, j in 1..N: i < j && m[i][j] > 0 && m[i][j] < 0.15) {
        sum(k in 1..N: m[i][k] > 0.85 && m[j][k] > 0.85) x[k] >= x[i] * x[j]; //x[i] + x[j] - 1;
    }
}

// You can run an execute block if needed.

//>>>>>>>>>>>>>>>>

//<<<<<<<<<<<<<<<<
