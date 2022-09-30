#!/bin/bash

sh=$1.sh

echo -e "#!/bin/bash\n" > $sh && chmod 755 $sh && nano +3 $sh
