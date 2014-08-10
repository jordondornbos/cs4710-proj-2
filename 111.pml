#define N 5
int array[N] = {1, 2, 3, 4, 5} 	
bool lock[N] = {false, false, false, false, false}
int turn[N] = {0, 0, 0, 0, 0};

	
 active [N] proctype P() {

   NTS: printf("Noncritical section \n"); 
	lock[_pid] = true; turn[_pid] = 1;
	int i = 0; int k = 0; 
	int ai_temp = 0;
	bool turnother = true;
	bool lockother = false;
	do
	   
		:: i < N && i == _pid -> i++
		:: i < N && i != _pid && lock[i]  -> lockother = true; break
		:: i < N && i != _pid && !lock[i]  -> i++
		:: i == N -> break 
	od;
	
	do 	
		:: k < N && k == _pid -> k++
		:: k < N && k !=_pid && turn[k] == 0 -> turnother = false; break
		:: k < N && k !=_pid && turn[k] == 1 -> k++
		:: k == N -> break
	od;	

 byte temp; printf("i is %d, temp is %d\n",_pid, temp);
	do		
		:: temp++
		:: temp--
		:: break
	od;	
byte j = temp % N;

TS: !lockother || turnother;

CS: printf("Critical section \n");
	ai_temp = array[_pid]
	array[_pid]= array[j];
	array[j] = ai_temp;
	lock[_pid] = false;
	printf("i is %d, j is %d\n", _pid, j);

	progress: goto NTS;
}



