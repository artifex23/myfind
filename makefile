OPTFLAGS        = -O3 -Wall -Werror -Wextra -pedantic -g -Xlinker -Map=output.map
CC              = gcc
MAKE            = make
RM              = rm -f
DOXYGEN         = doxygen doxygen.dcf

%.o : %.c
	$(CC) $(OPTFLAGS) -o $@ -c $<

all: myfind

myfind: myfind.o
	$(CC) $(OPTFLAGS) myfind.o -o myfind

clean:
	$(RM) *.o *.h.gch myfind

clean_doc:
	$(RM) -r doc/

doc: clean_doc
	$(DOXYGEN)

clean_all: clean clean_doc

