PROG= ppng
all:
	$(CC) -Wall -O3 -ObjC -framework AppKit -o ${PROG} ppng.m

install:
	install -g admin -m 555 ${PROG} /usr/local/bin
