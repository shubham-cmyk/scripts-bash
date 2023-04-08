#!/bin/bash

# Save the volume id's in the file named civo
civo volume ls  | awk '{print $2}' > civo


# Delete all the volume one by one by force
while read id; do
  echo $id
  civo volume remove $id --yes
done < civo

# Delete the file at the end
rm civo

