#!/bin/bash
if test -z "$1"; then
	echo "Argument 1 must be the treasure tables PDF"
	exit 1
fi

INPUT_PDF="$1"
EXPECTED_MD5SUM="fafe4527b594751ca03777cadcce83ef"

FOUND_MD5SUM=$(md5sum "$INPUT_PDF" | cut -d' ' -f1)

if ! "$EXPECTED_MD5SUM" = "$FOUND_MD5SUM"; then
	echo "WARNING: md5sum doesn't match what was expected. parsing may not work!"
fi

PAGE_COUNT="$(pdfinfo "$1" | grep "^Pages:" | sed 's/Pages: \+//')"

# Convert the PDF into text files of individual pages
mkdir -p pages
for n in `seq -w 1 $PAGE_COUNT`; do
	pdftotext -layout -f "$n" -l "$n" "$INPUT_PDF" pages/${n}.txt
done
