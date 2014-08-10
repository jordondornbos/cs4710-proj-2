
#define N 5

int numArray[N] = {1, 2, 3, 4, 5};
bool lockArray[N];

active[N] proctype swap() {
    int i = _pid;
    int j;

    /* Randomly generate a number */
    byte temp;
    do
    :: temp++
    :: temp--
    :: break
    od;

    /* Assign it to j */
    j = temp % N;

    printf("%d\n", numArray[j]);
    printf("%d\n", lockArray[j]);
}
