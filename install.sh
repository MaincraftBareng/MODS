FILES=mod_*.md
MCDIR=$1||'.'
echo "working in $MCDIR"
for f in $FILES
do
  echo "processing $f ..."
  MODE="$(cat $f | grep location_type_server | awk '{printf $3}')"
  LOC="$(cat $f | grep location_server | awk '{printf $3}')"
  CFG="$(cat $f | grep config: | awk '{printf $3}')"
  echo "getting $MODE $LOC"
  if [ "$MODE" = 'url' ] 
  then
    echo "downloading $LOC"
    wget $LOC -P $MCDIR 
  fi
  echo "copying config from $CFG"
  cp -rvf config/$CFG $MCDIR/config
done