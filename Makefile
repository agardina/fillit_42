#FORMATTING

GREEN = "\\033[32m"
BOLD = "\\033[1m"
RESET_FORMAT = "\\033[0m"
ERASE_LINE = "\\033[A\\033[K\\033[A"

#COMPILATION

NAME = fillit

SRC_DIR = ./src/
SRC_FILES = build_tetris.c check_file.c check_grid.c fill_grid.c\
get_path.c main.c utils.c
SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))

OBJ_DIR = ./obj/
OBJ_FILES = $(SRC_FILES:.c=.o)
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))

HDR_FILE = fillit.h
HDR_DIR = ./inc/
HDR = $(addprefix $(HDR_DIR), $(HDR_FILE))

LIB_DIR = ./libft/
LIB_INC = ./libft/inc/
LIB_NAME = lft
LIB = $(LIB_DIR)libft.a

CC = gcc

FLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(LIB) $(OBJ)
	@echo "Object files related to fillit created"
	@$(CC) $(FLAGS) $(OBJ) -I$(LIB_INC) -I$(HDR_DIR) -L$(LIB_DIR) -$(LIB_NAME) -o $(NAME)
	@echo "$(BOLD)$(NAME)$(RESET_FORMAT) [$(GREEN)OK$(RESET_FORMAT)]"

$(LIB): FORCE
	@make -C $(LIB_DIR)

$(OBJ_DIR)%.o:$(SRC_DIR)%.c $(HDR)
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(FLAGS) -I$(LIB_INC) -I$(HDR_DIR) -c  $< -o $@
	@echo "Compiled: $*.o [$(GREEN)OK$(RESET_FORMAT)]"
	@echo "$(ERASE_LINE)"

clean:
	@make -C $(LIB_DIR) clean
	@rm -rf $(OBJ)
	@rm -rf $(OBJ_DIR)
	@echo "Object files related to fillit deleted"

fclean: clean
	@make -C $(LIB_DIR) fclean
	@rm -rf $(NAME)
	@echo "$(NAME) deleted"

re:
	@$(MAKE) fclean
	@echo ""
	@$(MAKE) all

FORCE:

.PHONY: all clean fclean re FORCE
