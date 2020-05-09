

int main () {
  bool t = true;
  bool f = false;
  bool silent1 = f && t;  // nothing
  bool silent2 = t || f;  // nothing
  bool noisy1  = t && t;  // 1
  bool noisy2  = f || t;  // 1
  return 0;
}
