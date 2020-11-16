#!/bin/sh

mkdir data
FILE_ID='12VANjv1bf1Alj2utOmVuOw5dUuqVwsOo'
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=${FILE_ID}" -o data/image_arrays_test.zip
FILE_ID='1Bku37-ZlhYJBRYklR5vlO8ET0bCulrtV'
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=${FILE_ID}" -o data/image_arrays_train.zip
echo "Download Success!!!"
unzip -q data/image_arrays_train.zip
unzip -q data/image_arrays_test.zip
echo "Unzip Success!!!"
