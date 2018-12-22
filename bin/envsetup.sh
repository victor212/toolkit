#!/bin/bash

function help()
{
	echo "sos: options"
	echo " 	-h help"
	echo " 	tips"
	echo " 	markcs"
	echo " 	clearcs"
	echo " 	mkcscopefiles"
	echo " 	mktags"

}

function common_tips()
{
	echo "This is my common tips"
	echo "ctags -R"
	echo "  :set tags=xxx"
	echo "cscope -Rbkq"
	echo "  :cs add cscope.out"

}

function sos()
{
	# Need to clear builtin variables first
	OPTERR=""
	OPTIND=0
	OPTARG=""
	while getopts :h OPTION; do
		case $OPTION in
		h) 	#echo "optarg = " $OPTARG
			#echo "optind = " $OPTIND
			help
			;;
		?) 	echo "Invalid parameters"
			help
		   	exit 1;;
		esac
	done
# 	echo "optind = "$OPTIND

	# Keep rest parameters only 
	shift $(($OPTIND - 1))

	# The no leading opt parameters
	echo $1

}


export CS_SOURCE_FILE_DIR+=

function markcs()
{
	CS_SOURCE_FILE_DIR+=$(pwd)";"
	ALL_SRCS=${CS_SOURCE_FILE_DIR//;/ }
	for onepath in ${ALL_SRCS}
	do
		echo ${onepath}
	done
}

function clearcs()
{
	CS_SOURCE_FILE_DIR=""
}

function mkcscopefiles()
{
	ALL_SRCS=${CS_SOURCE_FILE_DIR//;/ }
	rm -rf cscope.files

	for onepath in ${ALL_SRCS}
	do
		echo ${onepath}
		find ${onepath} -name "*.[ch]" -o -name "*.cpp" >> cscope.files
	done

}

function mktags()
{
	rm -rf tags
	ALL_SRCS=${CS_SOURCE_FILE_DIR//;/ }
	for onepath in ${ALL_SRCS}
	do
		ctags -a -R ${onepath}
	done

	mkcscopefiles
	rm -rf cscope.in.out cscope.out cscope.po.out
	cscope -Rbqk -i cscope.files
}

