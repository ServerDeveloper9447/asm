How to run

USING WITHOUT DOCKER OR ISOLATED ENVIRONMENTS IS NOT RECOMMENDED

use docker
1. `docker run -it --name asm_sandbox -v "/${PWD}:/app" -w //app ubuntu:latest sh`

To resume work the next time
2. `docker start -ai asm_sandbox`