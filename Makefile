all:
	cc -g -o isign isign.c -lbluetooth
	cc -g -o ibeacon-extended ibeacon-extended.c -lbluetooth

clean:
	rm -f isign
	rm -f ibeacon-extended
