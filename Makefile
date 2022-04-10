# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c util.c
OBJ = ${SRC:.c=.o}
TARGET=dwm
CXX=clang
LIB=libdwm.a

all: $(TARGET)#$(OBJ)#$(SRC) 

.PHONY: $(SRC)
$(SRC):
	$(CXX) -c $@ -o $(@:.c=.o) $(INCS)
$(TARGET): $(LIB)
	$(CXX) $@.c -o $@  $(INCS) $(LDFLAGS) $(OBJ)

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"
clean: 
	rm -rf $(OBJ)
$(LIB):$(SRC)
	ar rcs $@ $^
final: $(LIB)
	rm -rf $(OBJ) 
uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwm\
		${DESTDIR}${PREFIX}/share/dwm/larbs.mom\
		${DESTDIR}${MANPREFIX}/man1/dwm.1

