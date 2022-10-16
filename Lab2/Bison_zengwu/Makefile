.PHONY: s1 s2 s3 s4 clean

s1:
	bison -d ./1.y
	gcc 1.tab.c -o 1
	./1
s2:
	bison -d ./2.y -o 2.tab.cpp
	g++ 2.tab.cpp -o 2
	./2
s3:
	bison -d ./3.y -o 3.tab.cpp
	g++ 3.tab.cpp -o 3
	./3
s4:
	bison -d ./4.y -o 4.tab.cpp
	g++ 4.tab.cpp -o 4
	./4


clean:
	rm -rf *.tab.c *.tab.h 1 2 3 4