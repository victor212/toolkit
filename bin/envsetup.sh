#!/bin/bash

function sos()
{
	echo "This is my help sos"
	echo "ctags -R"
	echo "  :set tags=xxx"
	echo "cscope -Rbkq"
	echo "  :cs add cscope.out"

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

