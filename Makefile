# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.o util.o
OBJ = ${SRC:.c=.o}
TARGET=dwn
CXX=clang
LIB=libdwn.a

all: final #$(OBJ)#$(SRC) 

.PHONY: clean 
$(SRC): 
	$(CXX) -c $(@:.o=.c) -o $(@) $(INCS)
src:$(SRC)
$(LIB): $(SRC)
	ar rcs $@ $^

$(TARGET):  % : lib%.a
	$(CXX) $@.c -o $@  $(INCS) $(LDFLAGS) $^
target:$(TARGET)

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"
clean: 
	rm -rf $(OBJ) $(TARGET)
final: $(LIB) $(TARGET)
uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwm\
		${DESTDIR}${PREFIX}/share/dwm/larbs.mom\
		${DESTDIR}${MANPREFIX}/man1/dwm.1

