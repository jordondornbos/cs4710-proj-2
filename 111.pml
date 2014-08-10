#define N 5
int array[N] = {1, 2, 3, 4, 5} 	
bool lock[N] = {false, false, false, false, false}
int turn = 0;
	
 active [N] proctype P() {

   NTS: printf("Noncritical section \n"); 
	lock[_pid] = true; turn = 1;
	int i = 0;
	bool lockother = false;
	do
		::i != _pid && lock[i] == true -> lockother = true; i++
		:: i == N -> break
	od;
		

 byte temp; printf("i is %d, temp is %d\n",_pid, temp);
	do		
		:: temp++
		:: temp--
		:: break
	od;	
byte j = temp % N;

TS: !lockother || turn ==0;

CS: printf("Critical section \n");
	array[_pid]= array[j];
	lock[_pid] = false;
	printf("i is %d, j is %d\n", _pid, j);

	progress: goto NTS;
}



