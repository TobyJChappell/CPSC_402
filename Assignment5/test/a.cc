int main() {
  double r = 5.0; // just to test blocks
  {
    int r = 1;
    printInt(r);
  }
  printDouble(r);
  return 0 ;
}
