#include <iostream>
int main(){
  int x;
  std::cin>>x;
  if (x==0) exit(0);
  else if(x<0) exit(1);
  else if(x>0) exit(2);
  return 3;

}
  
