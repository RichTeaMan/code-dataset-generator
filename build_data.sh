#!/bin/bash

OUT_FILE="code"
rm $OUT_FILE

CODE_FILES=$(find repos -name '*.cs')

for CODE_FILE in $CODE_FILES; do
    if [[ $CODE_FILE =~ "Orchard" ]]; then
        continue
    fi
    echo "$CODE_FILE"
    cat $CODE_FILE >> $OUT_FILE
    echo -e "\n" >> $OUT_FILE
done

# remove BOM character
sed -i 's/\xef\xbb\xbf//' $OUT_FILE

echo "Complete."
wc $OUT_FILE
