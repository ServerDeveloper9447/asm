How to run

USING WITHOUT DOCKER OR ISOLATED ENVIRONMENTS IS NOT RECOMMENDED

use docker
1. `docker run -it --name asm_sandbox -v "/${PWD}:/app" -w //app alpine:latest sh`

install deps
2. `apk add nasm binutils gdb`

To resume work the next time
3. `docker start -ai asm_sandbox`