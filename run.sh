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
 mv now.png old.png
 time=$(date +Month%mDay%dTime%H:%M)
 cat index_template.html | sed -e "s/TIME/$time/g" > index.html
 git commit -am "update at $time"
 git push
fi
