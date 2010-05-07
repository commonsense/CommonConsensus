svnserve -d -r /home/dustin/svn/
kill -9 $(ps -ef | grep 'ruby advance_cron'|awk '{print $2}')
kill -9 $(ps -ef | grep 'ruby ./wiki/instiki'|awk '{print $2}')
kill -9 $(ps -ef | grep 'ruby1.8 ./script/server'|awk '{print $2}')
#../gluenet-0.5/gluenet -x &
./wiki/instiki -p 7070 -e production --daemon
./script/server -p 3000 -e production --daemon


