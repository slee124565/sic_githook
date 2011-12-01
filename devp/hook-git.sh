#!/bin/bash -x

top_src_list="platform kernel device"
#top_src_list="tmp"
base_dir="/data2/git/android"
time_stamp=`date +%Y%m%d.%H%M`
for top_src in $top_src_list
do
	find_hook_list=$(find $base_dir/$top_src/. -type d -name 'hooks')
	for git_hook_folder in $find_hook_list
	do
		cd $git_hook_folder
		if [ -f pre-receive ]; then
			mv pre-receive pre-receive-backup-$time_stamp
		fi
		ln -s /data2/git/android/githook/githook/release/pre-receive
		ln -s /data2/git/android/githook/githook/release/branch_req_pr_list
		cd -
	done
done
