CC ?= gcc
CFLAGS ?= -O3

FC ?= gfortran
FFLAGS ?= -O3

stream2.exe:
	$(CC) $(CFLAGS) -c mysecond.c
	$(FC) $(FFLAGS) -c stream2.f
	$(FC) $(FFLAGS) stream2.o mysecond.o -o stream2.exe

# an example of a more complex build line for the Intel icc compiler
stream2.icc:
	icc -O3 -xHost -c mysecond.c
	ifort -O3 -xHost -c -ffreestanding -qopenmp -qopt-streaming-stores=always -mcmodel=medium stream2.f
	ifort -O3 -xHost -ffreestanding -qopenmp -qopt-streaming-stores=always -mcmodel=medium stream2.o mysecond.o -o stream2.icc

clean:
	rm -f stream2.exe stream2.icc *.o