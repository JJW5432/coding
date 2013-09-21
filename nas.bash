echo 'Please enter the path to your sparsebundle (/Volumes/{name of your network share}/{name of}.sparsebundle)'
read path
sudo -p "Please enter your admin password: " su
chflags -R nouchg $path
hdiutil attach -nomount -noverify -noautofsck $path
tail -f /var/log/fsck_hfs.log
hdiutil detach /dev/diskxs2