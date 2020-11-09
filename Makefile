tinyc: y.tab.o lex.yy.o ass6_18CS10064_translator.o ass6_18CS10064_target_translator.o 
	@g++ -g ass6_18CS10064_translator.o ass6_18CS10064_target_translator.o lex.yy.o y.tab.o  -o tinyc
	@./tinyc < ass6_18CS10064_test1.c
	@./tinyc < ass6_18CS10064_test2.c 
	@./tinyc < ass6_18CS10064_test3.c
	@./tinyc < ass6_18CS10064_test4.c
	@./tinyc < ass6_18CS10064_test5.c
	@echo " make run to execute all the test files at once"
lex.yy.c: ass6_18CS10064.l
	@flex ass6_18CS10064.l
y.tab.c: ass6_18CS10064.y
	@yacc -dtv ass6_18CS10064.y
ass6_18CS10064_target_translator.o: ass6_18CS10064_target_translator.cxx
	@g++ -g -c ass6_18CS10064_target_translator.cxx
ass6_18CS10064_translator.o: ass6_18CS10064_translator.cxx
	@g++ -g -c ass6_18CS10064_translator.cxx
lex.yy.o: lex.yy.c
	@g++ -g -c lex.yy.c
y.tab.o:    y.tab.c
	@g++ -g -DYYDEBUG -c y.tab.c
libass2_18CS10064.a: ass2_18CS10064.o
	@ar -rcs libass2_18CS10064.a ass2_18CS10064.o

ass2_18CS10064.o: ass2_18CS10064.c myl.h
	@gcc -Wall  -c ass2_18CS10064.c
clean:
	@rm test1 test2 test3 test4 test5 lex.yy.c y.tab.h y.output y.tab.c lex.yy.o y.tab.o ass2_18CS10064.o ass6_18CS10064_translator.o ass6_18CS10064_target_translator.o ass6_18CS10064_quad1.out ass6_18CS10064_quad2.out ass6_18CS10064_quad3.out ass6_18CS10064_quad4.out ass6_18CS10064_quad5.out tinyc


# test1: ass6_18CS10064_test1.o libass2_18CS10064.a
# 	@gcc -g ass6_18CS10064_test1.o -o test1 -L. -lass2_18CS10064
test1: ass6_18CS10064_test1.s myl.h libass2_18CS10064.a
	@gcc -no-pie ass6_18CS10064_test1.s -o test1 -L. -lass2_18CS10064

test2: ass6_18CS10064_test1.s myl.h
	@gcc -no-pie ass6_18CS10064_test2.s -o test2 -L. -lass2_18CS10064

test3: ass6_18CS10064_test1.s myl.h
	@gcc -no-pie ass6_18CS10064_test3.s -o test3 -L. -lass2_18CS10064

test4: ass6_18CS10064_test1.s myl.h
	@gcc -no-pie ass6_18CS10064_test4.s -o test4 -L. -lass2_18CS10064

test5: ass6_18CS10064_test1.s myl.h
	@gcc -no-pie ass6_18CS10064_test5.s -o test5 -L. -lass2_18CS10064

#output: output.o
output: output.o libass2_18CS10064.a
	@gcc -g  output.o -o output -L. -lass2_18CS10064
output.o: output.s myl.h
	@gcc -g -Wall -c output.s

run: 
		
	@./tinyc < ass6_18CS10064_test1.c > ass6_18CS10064_quad1.out
	@echo " make run to execute all the test files at once"
	
	@mv output.s ass6_18CS10064_test1.s
	
	@make test1
	
	@./tinyc < ass6_18CS10064_test2.c > ass6_18CS10064_quad2.out

	@mv output.s ass6_18CS10064_test2.s
	
	@make test2

	@./tinyc < ass6_18CS10064_test3.c > ass6_18CS10064_quad3.out

	@mv output.s ass6_18CS10064_test3.s

	@make test3

	@./tinyc < ass6_18CS10064_test4.c > ass6_18CS10064_quad4.out
	
	@mv output.s ass6_18CS10064_test4.s

	@make test4

	@./tinyc < ass6_18CS10064_test5.c > ass6_18CS10064_quad5.out
	
	@mv output.s ass6_18CS10064_test5.s

	@make test5
	@echo ""
	@echo "Commands for Test Cases"
	@echo "Test Case 1 : Calculate Interest    Command : ./test1"
	@echo "Test Case 2 : Palindrome or Not     Command : ./test2"
	@echo "Test Case 3 : Sum of Digits         Command : ./test3"
	@echo "Test Case 4 : Longest Common Subse. Command : ./test4"
	@echo "Test Case 5 : Merge Sort            Command : ./test5"
