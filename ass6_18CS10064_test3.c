//Computation of GCD
int GCD(int a, int b)       // Recursive function that will return the GCD 
{
    if(a == b)
    {
        return a;
    }
    if(a > b)
    {
        return GCD(a-b,b);
    }
    if(b > a)
    {
        return GCD(a,b-a);
    }
}

int main()
{
    int a,b,err;
    printStr("Computation of GCD\n");
    printStr("Enter First Integer\n"); 
    a = readInt(&err);
    printStr("Enter Seconnd Integer\n");
    b = readInt(&err);
    int s;
    s = GCD(a,b);
    printStr("The GCD is: ");
    printInt(s);
    printStr("\n**********************************************\n");
    return 0;
}
