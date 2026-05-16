How to run

USING WITHOUT DOCKER OR ISOLATED ENVIRONMENTS IS NOT RECOMMENDED


1. use docker: `docker run -it --name asm_sandbox -v "/${PWD}:/app" -w //app alpine:latest sh`
2. install deps `apk add nasm binutils gdb`
3. to resume work: `docker start -ai asm_sandbox`
4. optionally install base-build for gcc based programs `apk install base-build`

Things to remember when linking with gcc
1. Either write pie compliant code. See [ioInC.asm](ioInC.asm). or pass `-no-pie` to gcc.
2. the run.sh script DOES NOT INCLUDE the `-no-pie` flag for gcc so you need to write PIE compliant code