git pull
FILES=mod_*.md
SIDE=${1:-'client'}
MCDIR=${2:-'.'}
echo "installing in $SIDE"
echo "working in $MCDIR"
[ ! -d $MCDIR/mods ] && echo "FATAL ERROR: you don't have folder mods in $MCDIR. have you intall and run minecraft forge?" && return 1
[ ! -d $MCDIR/config ] && echo "FATAL ERROR: you don't have folder config in $MCDIR. have you intall and run minecraft forge?" && return 1
printf "\n"
rm -rvf $MCDIR/config/*
rm -rvf $MCDIR/mods/*
printf "\n"
for f in $FILES
do
  echo "processing $f ..."
  MODE='path'
  if [ "$SIDE" = 'server' ]
  then
    MODE="$(cat $f | grep location_type_$SIDE | awk '{printf $3}')"
  fi
  LOC="$(cat $f | grep location_$SIDE | awk '{printf $3}')"
  NAME="$(cat $f | grep mod_name: | awk '{printf $3}')"
  if [ "$MODE" = 'url' ] 
  then
    echo "getting $MODE $LOC"
    BASENAME=$(basename $LOC)
    echo "downloading $LOC"
    wget $LOC
    mv $BASENAME $MCDIR/mods/$NAME.jar
  fi
  if [ "$MODE" = 'path' ] 
  then
    if [ "$LOC" != 'dummy' ]
    then
      echo "getting $MODE $LOC"
      cp mods/$LOC $MCDIR/mods/$NAME.jar
    fi
  fi
  for f2 in config/$NAME/*
  do
    if [ "$f2" != "config/$NAME/dummy" ]
    then
      echo "copying config from $f2"
      cp -rvf $f2 $MCDIR/config/
    fi
  done
  printf "\n"
done