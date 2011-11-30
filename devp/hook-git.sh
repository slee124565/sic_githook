#!/bin/bash

#top_src_list="platform kernel device"
top_src_list="kernel"
base_dir="/data2/git/android"
for top_src in $top_src_list
do
	find_hook_list=$(find $base_dir/$top_src/. -type d -name 'hooks')
	for git_hook_folder in $find_hook_list
	do
		if [ -f $git_hook_folder/pre-receive ]; then
			cd $git_hook_folder
			echo "mv $git_hook_folder/pre-receive $git_hook_folder/pre-receive-`date +%Y%m%d.%H%M`"
			echo "ln -s /data2/git/android/githook/githook/release/pre-receive"
			echo "ln -s /data2/git/android/githook/githook/release/branch_req_pr_list"
			cd -
		fi
	done
done
