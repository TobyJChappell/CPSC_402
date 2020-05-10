int main() {
  double r ; // just to test blocks
  {
    int n = 10;
    int r = 1;
    while (n>0) {
      r = r * n;
      n = n - 1;
    }
    printInt(r);
  }
  return 0 ;
}

