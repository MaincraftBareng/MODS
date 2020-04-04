git pull
FILES=mod_*.md
SIDE=${1:-'client'}
MCDIR=${2:-'.'}
echo "installing in $SIDE"
echo "working in $MCDIR"
rm -rvf $MCDIR/config/*
rm -rvf $MCDIR/mods/*
for f in $FILES
do
  echo "processing $f ..."
  MODE="$(cat $f | grep location_type_$SIDE | awk '{printf $3}')"
  LOC="$(cat $f | grep location_$SIDE | awk '{printf $3}')"
  NAME="$(cat $f | grep mod_name: | awk '{printf $3}')"
  echo "getting $MODE $LOC"
  if [ "$MODE" = 'url' ] 
  then
    BASENAME=$(basename $LOC)
    echo "downloading $LOC"
    wget $LOC
    mv $BASENAME $MCDIR/mods/$NAME.jar
  fi
  if [ "$MODE" = 'path' ] 
  then
    cp $LOC $MCDIR/mods/$NAME.jar
  fi
  for f in config/$NAME/*
  do
    echo "copying config from $f"
    cp -rvf $f $MCDIR/config/
  done
done
rm -rvf $MCDIR/mods/dummy.jar
rm -rvf $MCDIR/config/dummy.txt