.PHONY: test-calc test-topostfix test-calcplus clean

test-calc:
	bison -d expr_calc.y
	gcc expr_calc.tab.c -o expr_calc
	./expr_calc

test-topostfix:
	bison -d expr_to_postfix.y
	gcc expr_to_postfix.tab.c -o expr_to_postfix
	./expr_to_postfix

test-calcplus:
	bison -d expr_calcplus.y
	gcc expr_calcplus.tab.c -o expr_calcplus
	./expr_calcplus

test-toassembly:
	bison -d expr_to_assembly.y
	gcc expr_to_assembly.tab.c -o expr_to_assembly
	./expr_to_assembly

clean:
	rm -rf *.tab.c *.tab.h expr_calc expr_to_postfix expr_calcplus expr_to_assembly