#!/bin/bash


read -p "Which operation do you want to perform ? 
		1-Directory operation 
		2-File Operation": dir
echo -eq '/n'
case "$dir" in
	"1")
		read -p "Press 1-Create Dir, Press 2-Delete Dir, Press 3-List all the contents of a directory": press
		read -p "Choose the path where do you want these actions should performed": path
		cd $path

		case "$press" in

			"1")
				read -p "To Create a directory enter name": createdir
				mkdir $createdir
				echo "Directory has been created on path $path";;
			"2")	
				read -p "To delete a directory enter name ": deldir
				rm -rf $deldir
				echo "Directory has been deleted successfully from path $path";;
			"3")
				read -p "Type the directory name to list the content of that directory": listdir
				echo "Below are the directory list"
				ls $listdir;;

			esac;;		
	
	"2")
		echo "Choose the options below"
		read -p "1-Create File
			 2-Add content in file
			 3-Add content at begining in file
			 4-To view top n lines in file
			 5-To view last n lines in file
			 6-To view contents of a specific line number 
			 7-To view content of a specific line number range
			 8-Move file from one location to another
			 10-Copy file from one location to another
			 11-Delete file": press
		
		read -p "Choose the path where do you want these actions should performed": path
		cd $path

		case "$press" in

			"1")
				read -p "Enter the file name to create": name
				touch $name
				echo "File has been created successfully to that location $path";;
			"2")
				read -p "Enter the file name": filename
				#vim $filename
				read -p "Write the content in file": content
				echo "$content" >$path/$filename
				echo "These are the content $content of this file $filename";;
			"3")
				read -p "Enter the file name": filename2
				read -p "Write the content you want to enter at the begining $filename": content2
				#sed -i '1s/^/'$content2'\n/' $filename2
		 	        echo -e "$content2 \n $(cat $filename2)" > $path/$filename2
				echo "These are the content $content2 of this file $filename2";;
			"4")
				read -p "Enter the file name": filename3
				read -p "How many lines you want to see from top enter count ?": n
				echo "Below are the lines you want to view  from top$n"
				head -$n $filename3;;
			"5")
			        read -p "Enter the file name": filename4
                                read -p "How many lines you want to see from bottom enter count ?": n2
                                echo "Below are the lines you want to view from bottom$n"
                                tail -$n2 $filename4;;
			"6")
				read -p "Enter the file name": filename5
				read -p "Enter the line number you want to view": n3
				head -$n3 $filename5 | tail -1;; 	

			"7")
				read -p "Enter the file name to see content through range": filename6
				read -p "from": n4
				read -p "to": n5
				cat -n $filename6 |sed -n "${n4},${n5}p";;
			"8")
		
                        	read -p "Write  file name": filename6
                       		read -p "write current path": currentpath
                        	read -p "write destination path": destpath
                        	echo "copy of file done"
                        	cp -rf $currentpath/$filename6 $destpath;;
                	"9")
                        	read -p "write old file name": filename7
                        	read -p "write new file name": newname
                        	mv $filename7 $newname
                        	echo "file $filename7 renamed to $newname";;
              	
				




						

	esac;;	 
esac
