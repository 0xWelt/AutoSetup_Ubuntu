FILE=$(readlink -f "$(dirname "$0")")

wget -c -P $FILE/../tmp/ https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
sh $FILE/../tmp/Anaconda3-2021.05-Linux-x86_64.sh -b -p