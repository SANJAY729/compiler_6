//Kadane Algorithm
int kadane( int X[], int n )
{
   int max_so_far = -10000, max_ending_here = 0; 
   int i = 0;
   for (i = 0; i < n; i = i + 1) 
   { 
      max_ending_here = max_ending_here + X[i]; 
      if (max_so_far < max_ending_here) 
      {
         max_so_far = max_ending_here; 
      }
      if (max_ending_here < 0) 
      {
         max_ending_here = 0; 
      }
   } 
   return max_so_far;
}
 
/* Driver program to test above function */
int main()
{
  int x[100];
  int n,i;
  int err=1;
  printStr("Kadane Algorithm\n");
  printStr("Enter the number of elements array\n");
  n=readInt(&err);
  printStr("Enter the elements of the first array (use new line for each element)\n");
  for(i=0;i<n;i++)
  {
	x[i]=readInt(&err);
  }
  int l;
  l=kadane(x,n);
  printStr("Largest Subarray Sum is : ");
  printInt(l);
  printStr("\n**********************************************\n");
  return 0;
}
