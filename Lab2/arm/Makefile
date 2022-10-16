.PHONY: arm clean

c:
	gcc sylib.c test.c -O0 -o ctest -static
	./ctest

arm:
	arm-linux-gnueabihf-gcc sylib.c test.S -o armtest -static
	qemu-arm ./armtest

clean:
	rm -rf ctest armtest