#!/bin/bash

# USER/PASS
user='hogehoge'
pass='fugafuga'
# wgetで取得
wget --delete-after --http-user=${user} --http-passwd=${pass} -O -  http://www.mydns.jp/login.html &> /dev/null
# 結果を格納
result=$?
if [ ${result} -eq 0 ]; then
  msg="dynamic dns notice is success."
elif [ ${result} -eq 1 ]; then
  msg="Generic error code."
elif [ ${result} -eq 2 ]; then
  msg="Parse error—for instance, when parsing command-line options, the ‘.wgetrc’ or ‘.netrc’..."
elif [ ${result} -eq 3 ]; then
  msg="File I/O error."
elif [ ${result} -eq 4 ]; then
  msg="Network failure."
elif [ ${result} -eq 5 ]; then
  msg="SSL verification failure."
elif [ ${result} -eq 6 ]; then
  msg="Username/password authentication failure."
elif [ ${result} -eq 7 ]; then
  msg="Protocol errors."
elif [ ${result} -eq 8 ]; then
  msg="Server issued an error response."
else
  msg="Unknow status. (status=${result})"
fi
# Logger
logger -i $msg
