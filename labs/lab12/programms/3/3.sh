
for symbol in {A..Z} {a..z}
do SYMBOLS=$SYMBOLS$symbol;
done
STR_LEN=20
STR=""
for i in seq 1 $STR_LEN
do
    STR=$STR${SYMBOLS:$(expr $RANDOM % ${#SYMBOLS}):1}
done
echo $STR
