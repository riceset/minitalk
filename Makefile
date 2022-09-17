# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/21 03:50:11 by tkomeno           #+#    #+#              #
#    Updated: 2022/09/17 16:32:49 by tkomeno          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	minitalk
LIBFT		=	libft.a
INCLUDES	=	-I includes -I libft/includes
CFLAGS		=	-Wall -Wextra -Werror $(INCLUDES)

SERVER_SRCS =	sources/server.c
CLIENT_SRCS =	sources/client.c

SERVER_OBJS =	$(SERVER_SRCS:.c=.o)
CLIENT_OBJS =	$(CLIENT_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(LIBFT) server client

server: $(SERVER_OBJS) $(LIBFT)
	$(CC) $(SERVER_OBJS) -o server -L./libft -lft

client: $(CLIENT_OBJS) $(LIBFT)
	$(CC) $(CLIENT_OBJS) -o client -L./libft -lft

clean:
	$(RM) $(SERVER_OBJS) $(CLIENT_OBJS)
	$(MAKE) clean -C ./libft

fclean:
	$(RM) $(SERVER_OBJS) $(CLIENT_OBJS)
	$(RM) server client
	$(MAKE) fclean -C ./libft

re: fclean all

$(LIBFT):
	$(MAKE) -C ./libft

.PHONY: all server client clean fclean re
