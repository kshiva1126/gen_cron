#! /usr/bin/zsh
. ./common.lib
typeset -g -A hash
hash=(min \* hour \* day \* month \* week \*)

typeset -a isErrday
while [ "${isErrday}" != y ] && [ "${isErrday}" != N ]
do
  echo "毎日を指定しますか? y/N [ y ]"
  read isErrday
  if [ -z "${isErrday}" ]; then
    isErrday=y
  fi
  if [ "${isErrday}" != y ] && [ "${isErrday}" != N ]; then
    echo "y/Nで選択してください"
  fi
done

if [ "${isErrday}" = N  ]; then
  checkDateOrWeek hash
fi

setTime hash

typeset -a command
while [ -z "${command}" ]
do
  echo "設定したいコマンドを入力してください"
  read command
done

cron="${hash[min]} ${hash[hour]} ${hash[day]} ${hash[month]} ${hash[week]} ${command}"
echo "${cron}"