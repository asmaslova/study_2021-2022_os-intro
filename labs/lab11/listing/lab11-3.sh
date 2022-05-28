while getopts c:r optletter
do case $optletter in
       c) cflag=1; cval=$OPTARG;;
       r) rflag=1; rval=$OPTARG;;
   esac
done
if ((cflag==1)&&(rflag==0))
then for ((a=1; a<(${cval}+1); a++))
     do touch ${a}.tmp
     done
fi

if ((cflag==0)&&(rflag==1))
     then for ((b=1; b<(${rval}+1); b++))
	  do rm ${b}.tmp
	  done
	  else break
fi

	
	
