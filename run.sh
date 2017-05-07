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
fi
