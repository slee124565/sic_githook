#!/bin/bash

top_src_list="platform kernel device project"
#top_src_list="tmp"
base_dir="/data2/git/android"
time_stamp=`date +%Y%m%d.%H%M`
for top_src in $top_src_list
do
	find_hook_list=$(find $base_dir/$top_src/. -type d -name 'hooks')
	for git_hook_folder in $find_hook_list
	do
		echo ">>>>>> cd $git_hook_folder"
		cd $git_hook_folder
		if `ls -l pre-receive | grep '/data2/git/android/githook/githook/release/pre-receive' 1>/dev/null 2>&1`
		then
			echo "pre-receive already linked"
		else
			if [ -f pre-receive ]; then
				mv pre-receive pre-receive-backup-$time_stamp
				echo "(backup) mv pre-receive pre-receive-backup-$time_stamp"
			fi
			ln -s /data2/git/android/githook/githook/release/pre-receive
			echo "(git-hook add) ln -s /data2/git/android/githook/githook/release/pre-receive"
		fi

                if `ls -l branch_req_pr_list | grep '/data2/git/android/githook/githook/release/branch_req_pr_list' 1>/dev/null 2>&1`
		then
			echo "branch_req_pr_list already linked"
		else
			if [ -f branch_req_pr_list ]; then
				ls -l branch_req_pr_list
				mv branch_req_pr_list branch_req_pr_list-backup-$time_stamp
				echo "(backup) mv branch_req_pr_list branch_req_pr_list-backup-$time_stamp"
			fi
			ln -s /data2/git/android/githook/githook/release/branch_req_pr_list
			echo "(git-hook add) ln -s /data2/git/android/githook/githook/release/branch_req_pr_list"
		fi
		cd -
		echo "<<<<<<< cd - "
	done
done
