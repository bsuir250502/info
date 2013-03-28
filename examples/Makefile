OBJ = source.o
CFLAGS = -Wall -std=c99

all: bin

bin: $(OBJ)
	gcc $(CFLAGS) $(OBJ) -o bin

%.o : %.c
	gcc $(CFLAGS) -c $<

clean:
	rm bin $(OBJ)
