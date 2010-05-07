svnserve -d -r /home/dustin/svn/
kill -9 $(ps -ef | grep 'ruby advance_cron'|awk '{print $2}')
kill -9 $(ps -ef | grep 'ruby ./script/server'|awk '{print $2}')
./script/server -p 3000 -e development 



