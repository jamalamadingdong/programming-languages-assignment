CC = g++
CFLAGS = -Wall -g -Werror
OBJ = QuickSort.o Book.o
EXEC = sort

$(EXEC) : $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

QuickSort.o : QuickSort.cpp Book.hpp
	$(CC) -c QuickSort.cpp $(CFLAGS)

Book.o : Book.cpp Book.hpp
	$(CC) -c Book.cpp $(CFLAGS)

clean :
	rm -rf $(EXEC) $(OBJ)
