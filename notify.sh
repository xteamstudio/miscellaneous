!/bin/bash

curl https://raw.githubusercontent.com/xteamstudio/miscellaneous/master/xteam-notify.txt > xteam-notify.txt

filename='xteam-notify.txt'
exec < $filename

goToWorkTitleArr=()
goToWorkTextArr=()
getOffWorkTitleArr=()
getOffWorkTextArr=()
IFS=''
while read line
do
    # echo $line
    if  [[ $line == goToWorkTitle:* ]] ;then
        goToWorkTitleArr+=(${line:14})
    fi
    if  [[ $line == goToWorkText:* ]] ;then
        goToWorkTextArr+=(${line:13})
    fi
    if  [[ $line == getOffWorkTitle:* ]] ;then
        getOffWorkTitleArr+=(${line:16})
    fi
    if  [[ $line == getOffWorkText:* ]] ;then
        getOffWorkTextArr+=(${line:15})
    fi
done

goToWorkTitle="${goToWorkTitleArr[$[$RANDOM % ${#goToWorkTitleArr[@]}]]}"
goToWorkText="${goToWorkTextArr[$[$RANDOM % ${#goToWorkTextArr[@]}]]}"
getOffWorkTitle="${getOffWorkTitleArr[$[$RANDOM % ${#getOffWorkTitleArr[@]}]]}"
getOffWorkText="${getOffWorkTextArr[$[$RANDOM % ${#getOffWorkTextArr[@]}]]}"

#echo $goToWorkTitle
#echo $goToWorkText
#echo $getOffWorkTitle
#echo $getOffWorkText

mode=$1
if [ "$mode" == 1 ]; then
    curl -d '{"text":"'"$goToWorkTitle"'","attachments":[{"title": "'"$goToWorkText"'"}]}' -H "Content-Type: application/json" -X POST https://hooks.slack.com/services/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
elif [ "$mode" == 2 ]; then
    curl -d '{"text":"'"$getOffWorkTitle"'","attachments":[{"title": "'"$getOffWorkText"'"}]}' -H "Content-Type: application/json" -X POST https://hooks.slack.com/services/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
fi
