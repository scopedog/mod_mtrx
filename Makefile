CC		= cc
EXECUTABLE	= test
MAIN		= main.c
INTERFACES	= mod_mtrx.c mod.c log.c util.c
SRCS		= $(MAIN) $(INTERFACES)
OBJS		= $(SRCS:.c=.o)
LIBS		= 
LIBPATH		= 
INCPATH		= -I../../common/
OPTFLAGS	= -O3 -ffast-math
CFLAGS		= -Wall $(OPTFLAGS) $(INCPATH)

##################################################################

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

$(EXECUTABLE): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBPATH) $(LIBS)

all: $(EXECUTABLE)

clean:
	rm -f *.o *.core $(EXECUTABLE) $(LIBRARAY)

depend:
	$(MKDEP) $(CFLAGS) $(SRCS)

bench: $(EXECUTABLE)
	@basename `pwd`
	@./$(EXECUTABLE)

