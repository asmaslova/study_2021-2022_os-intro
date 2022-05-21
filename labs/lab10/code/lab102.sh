#task 4

x=0
echo "Enter the path to the directory: "
read path
echo "Enter the format of the file: "
read format
cd ${path}
find ${path} -name "*${format}" -type f | wc -l

