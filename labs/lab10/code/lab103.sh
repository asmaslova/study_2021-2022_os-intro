for i in *
do if test -d $i
   then echo $i: is a directory
   else echo -n $i: is a file
	if test -w $i
	then echo " that cannot be written"
	elif test -r $i
	then echo " that can be read"
	else echo " that cannot be read or written"
	fi
   fi
done
