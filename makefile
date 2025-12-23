OBJS=candia.o partonww.o a02m.o hplog.o xpns2p.o xpij2p.o
CC=gcc
FC=gfortran

.c.o:
	$(CC) -c $*.c

.f.o:
	$(FC) -std=legacy -c -w -O3 $*.f -fPIC

candia: $(OBJS)
	$(FC) -std=legacy -O3 -o candia.x $(OBJS) -fPIE

clean:
	rm -f *.o  *.x

candia.o: candia.c constants.h
hplog.o: hplog.f
xpns2p.o: xpns2p.f
xpij2p.o: xpij2p.f
partonww.o: partonww.f
a02m.o: a02m.f
