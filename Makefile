#
# Student makefile for Cache Lab
# Note: requires a 64-bit x86-64 system 
#
CC = gcc
CFLAGS = -g -Wall -Werror -std=c99 -m64

all: csim test-trans tracegen
	# Generate a handin tar file each time you compile
	-tar -cvf ${USER}-handin.tar  csim.c trans.c 

csim: csim.c lab3.c lab3.h
	$(CC) $(CFLAGS) -o csim csim.c lab3.c -lm 

test-trans: test-trans.c trans.o lab3.c lab3.h
	$(CC) $(CFLAGS) -o test-trans test-trans.c lab3.c trans.o 

tracegen: tracegen.c trans.o lab3.c
	$(CC) $(CFLAGS) -O0 -o tracegen tracegen.c trans.o lab3.c

trans.o: trans.c
	$(CC) $(CFLAGS) -O0 -c trans.c

#
# Clean the src dirctory
#
clean:
	rm -rf *.o
	rm -f *.tar
	rm -f csim
	rm -f test-trans tracegen
	rm -f trace.all trace.f*
	rm -f .csim_results .marker
