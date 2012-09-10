export LSDIR=$HOME/opt/landslide
export PYTHONPATH=$LSDIR/lib/python2.7/site-packages
export PATH=$LSDIR/bin:$PATH
landslide kubuntu.markdown -d kubuntu.html -t ~/doc/ref/landslide-themes/kubuntu $*
