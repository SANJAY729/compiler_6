// Factorial Computation
int main()
{
    int n, ans, i, err;
    printStr("Factorial Computation\n");
    printStr("Enter the integer: ");
    int err;
    n = readInt(&err);

    ans  = 1;
    i = 1;
    while(i<=n){
        ans = ans * i;
        i = i + 1;
    }
    printStr("The factorial of given number is = \n");
    printInt(ans);
    printStr("\n**********************************************\n");
    return 0;
}