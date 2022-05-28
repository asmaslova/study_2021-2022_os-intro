g++ -o cprog lab11-2.c
./cprog
case $? in
    0)echo "number is equal to zero";;
      1) echo "number is smaller than zero";;
	2) echo "number is bigger than zero";;
esac
