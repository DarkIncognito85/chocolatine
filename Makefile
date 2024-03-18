
NAME	=	chocolatine

SOURCE	=	./src/main.c				 		\

OBJ	=	$(SOURCE:.c=.o)

CFLAGS	+=	-Wall -Wextra -I ./include -g

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(SOURCE) $(CFLAGS) -o $(NAME) -Wall -Wextra -I ./include
	@ echo -e "\033[1;32m$(NAME) successfully created!\033[0m"
clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	rm *.o -f
	rm vgcore.* -f
	rm -f test
re: fclean all

tests_run:
	@ gcc -o my_tests -lcriterion --coverage $(CFLAGS)
	./my_tests
