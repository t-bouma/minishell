# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tiemen <tiemen@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2022/07/13 16:26:13 by tiemen        #+#    #+#                  #
#    Updated: 2022/07/13 16:37:58 by tiemen        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME := minishell
OBJFILES := obj/main.o
LIBFT := includes/libft/libft.a
HEADERS := -I libft/
CFLAGS := -Wall -Wextra -Werror
CC := gcc

all: $(LIBFT) $(NAME)

$(LIBFT): 
	make -C ./includes/libft

$(NAME): $(OBJFILES)
	cp $(LIBFT) $(NAME)
	$(CC) $(CFLAGS) $(OBJFILES) $(LIBFT) $(HEADERS) -o $(NAME) 

obj/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(OBJFILES)
	make clean -C ./includes/libft

fclean:	clean
	rm -f $(NAME)
	make fclean -C ./includes/libft

re: fclean all

.PHONY: clean all fclean re