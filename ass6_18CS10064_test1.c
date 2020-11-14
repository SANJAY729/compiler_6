// Calculate Product
int main()

{
    int a, b, pdt, c, err;
    printStr("Enter the 3 integers to be multiplied \n");
    a = readInt(&err);
    b = readInt(&err);
    c = readInt(&err);

    pdt = (a * b * c);

    printStr("Product = ");
    printInt(pdt);
    printStr("\n");
    printStr("\n**********************************************\n");
    return 0;

}