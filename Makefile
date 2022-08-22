# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/21 03:50:11 by tkomeno           #+#    #+#              #
#    Updated: 2022/08/21 04:46:59 by tkomeno          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC			=	gcc
NAME		=	minitalk
CFLAGS		=	-Wall -Wextra -Werror
SERVER_SRCS =	server.c helpers.c
CLIENT_SRCS =	client.c helpers.c
SERVER_OBJS =	$(SERVER_SRCS:.c=.o)
CLIENT_OBJS =	$(CLIENT_SRCS:.c=.o)

all: $(NAME)

$(NAME): server client

server: $(SERVER_OBJS)
	$(CC) $(SERVER_OBJS) -o server

client: $(CLIENT_OBJS)
	$(CC) $(CLIENT_OBJS) -o client

clean:
	$(RM) $(SERVER_OBJS) $(CLIENT_OBJS)

fclean: clean
	$(RM) server client

re: fclean all

.PHONY: all server client clean fclean re
