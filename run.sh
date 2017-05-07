#! /bin/bash

echo "running..."
imagesnap now.png
echo "took pic"
diff=$(imagediff -e -t 201 now.png old.png)
echo "the diff $diff"
if [ $diff == "true" ];
then
 echo "not much changed, abort"
else
 echo "different!"
 time=$(date +Month%mDay%dTime%H:%M)
 picname=$(echo "${RANDOM}_pic.png")
 mv now.png $picname
 cat index_template.html | sed -e "s/TIME/$time/g" | sed -e "s/PIC/$picname/g" > index.html
 git commit -am "update at $time"
 git push
fi
