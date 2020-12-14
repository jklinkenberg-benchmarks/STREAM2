CC ?= gcc
CFLAGS ?= -O3

FC ?= gfortran
FFLAGS ?= -O3
FLAGS_ICC=-O3 -xHost -qopt-zmm-usage=high -qopt-streaming-stores=never

stream2.exe:
	$(CC) $(CFLAGS) -c mysecond.c
	$(FC) $(FFLAGS) -c stream2.f
	$(FC) $(FFLAGS) stream2.o mysecond.o -o stream2.exe

# an example of a more complex build line for the Intel icc compiler
stream2.icc:
	icc $(FLAGS_ICC) -c mysecond.c
	ifort $(FLAGS_ICC) -c -mcmodel=medium stream2.f
	ifort $(FLAGS_ICC) -mcmodel=medium stream2.o mysecond.o -o stream2.icc

clean:
	rm -f stream2.exe stream2.icc *.o
