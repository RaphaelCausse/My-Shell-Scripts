# Directories set up
BINDIR = bin/
OBJDIR = obj/
SRCDIR = src/

# Executable name
TARGET = $(BINDIR)prog

# Project set up, compiler flags and linker flags
CC = g++ -fsanitize=address
CPPFLAGS = -g -O3 -Wall
LFLAGS = -lm

# Files set up
SRC := $(wildcard $(SRCDIR)*.cpp)
OBJ := $(SRC:$(SRCDIR)%.cpp=$(OBJDIR)%.o)

# Compile binary and object files and build target
all: $(TARGET) objclean
	
$(TARGET): $(OBJ)
	@mkdir -p $(BINDIR)
	$(CC) $(LFLAGS) $^ -o $@ 
	@echo "Compilation and linking completed !"

$(OBJDIR)%.o: $(SRCDIR)%.cpp
	@mkdir -p $(OBJDIR)
	$(CC) $(CPPFLAGS) -c $< -o $@

# Clean project directory
.PHONY: run clean
run: 
	./$(TARGET)
	
clean:
	@rm -rf $(BINDIR) $(OBJDIR)
	@echo "Cleanup completed !"

objclean:
	@rm -rf $(OBJDIR)
