cd ~/tutorial
while :
do
   files=`find . -newermt "-3 secs"`

   for file in $files
   do
          scp "$file" "root@host01://var/projects/$file"
   done
   
   files=`ssh host01 bash -c "cd /var/projects; find . -newermt \"-3 secs\""`

   for file in $files
   do
          scp "root@host01:/var/projects/$file" "$file"
   done
   
   sleep 1
done