# Macros para compilacao
CC = gcc
CFLAGS = -Wextra
DIR = src
FILENAME = $(DIR)/main.c
TARGET = ./main
SRCS := $(shell find $(DIR) -name '*.c')
OBJS = $(SRCS:.c=.o)


# Macros para teste
BASH = sh
TEST_SCRIPT = test.sh
VERBOSE ?= 1

# Macros para construcao do zip
ZIP = zip
USERNAME ?= $(USER)
ZIPFILE = $(USERNAME).zip
EXTENSIONS = *.c *.h *.in *.out *.sh

.PHONY: depend clean

all:$(TARGET)

$(TARGET):$(OBJS)
	$(CC) -o$(TARGET) $(OBJS) $(CFLAGS)

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -c $< -o $@


test:all
	$(BASH) $(TEST_SCRIPT) $(TARGET) $(VERBOSE)

zip:clean
	$(ZIP) -R $(ZIPFILE)  Makefile $(EXTENSIONS)

clean:
	$(RM) ./$(TARGET)
	$(RM) $(DIR)/*.o
	$(RM) ./$(ZIPFILE)
