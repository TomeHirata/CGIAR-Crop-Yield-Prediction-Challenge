#!/bin/sh

FILE_ID=1OD7cINKbpKPmrjqV7ohrSGujMNlmy-tf
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=${FILE_ID}" -o data
echo "Download Success!!!"
unzip -q data/image_arrays_train.zip
unzip -q data/image_arrays_test.zip
echo "Unzip Success!!!"
