
#define N 10
#define mutex (count <= 1)

bool locked = false;
int count = 0;

int nums[N] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};


active[N] proctype swap() {
    NTS: printf("Noncritical section starts");

    /* Randomly generate a number */
    byte random;
    do
    :: random++
    :: random--
    :: break
    od;

    /* Assign i and j values */
    int i = _pid;
    int j = random % N;

    /* Get the lock */
    atomic {
        locked == false ->
            locked = true;
            count++;
    }

    /* Critical section start */
    bool cs = true;
    
    assert(count == 1);
    printf("Process %d has the lock\n", _pid);

    printf("Process %d is swapping %d and %d\n", _pid, nums[i], nums[j]);

    /* Swap the numbers */
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;

    /* Critical section end */
    cs = false;
    count--;
    locked = false;

    progress: goto NTS;
}
