
export GOPATH=$HOME/.go
[ -e $GOPATH ] || mkdir $GOPATH

path=(
  $path
  $GOPATH/bin
)
