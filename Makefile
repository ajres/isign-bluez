all:
	cc -g -o isign isign.c -lbluetooth

clean:
	rm -f isign
