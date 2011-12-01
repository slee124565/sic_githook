#!/bin/bash -x
time_stamp=$1
if [ -z $time_stamp ]; then
	echo "usage: $0 [time_stamp]"
	exit 1
fi
top_src_list="platform kernel device"
#top_src_list="tmp"
base_dir="/data2/git/android"
for top_src in $top_src_list
do
	find_hook_list=$(find $base_dir/$top_src/. -type d -name 'hooks')
	for git_hook_folder in $find_hook_list
	do
		cd $git_hook_folder
		if [ -f "pre-receive-backup-$time_stamp" ]; then
			mv pre-receive-backup-$time_stamp pre-receive
			rm branch_req_pr_list
		fi
		cd -
	done
done
