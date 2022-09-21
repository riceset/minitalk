# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/21 03:50:11 by tkomeno           #+#    #+#              #
#    Updated: 2022/09/21 15:37:11 by tkomeno          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	minitalk
LIBFT_PATH 	= 	./libft
LIBFT		=	$(LIBFT_PATH)/libft.a
INCLUDES	=	-I ./includes -I $(LIBFT_PATH)/includes
CFLAGS		=	-Wall -Wextra -Werror $(INCLUDES)

SERVER_SRCS =	sources/server.c
CLIENT_SRCS =	sources/client.c

SERVER_OBJS = 	$(SERVER_SRCS:.c=.o)
CLIENT_OBJS = 	$(CLIENT_SRCS:.c=.o)

SERVER 		= 	server
CLIENT 		= 	client

all: $(NAME)

$(NAME): $(SERVER) $(CLIENT)

$(SERVER): $(SERVER_OBJS) $(LIBFT)
	$(CC) $< -o $@ -L$(LIBFT_PATH) -lft

$(CLIENT): $(CLIENT_OBJS) $(LIBFT)
	$(CC) $< -o $@ -L$(LIBFT_PATH) -lft

clean:
	$(RM) $(SERVER_OBJS) $(CLIENT_OBJS)
	$(MAKE) clean -C $(LIBFT_PATH)

fclean:
	$(RM) $(SERVER_OBJS) $(CLIENT_OBJS)
	$(RM) $(SERVER) $(CLIENT)
	$(MAKE) fclean -C $(LIBFT_PATH)

re: fclean all

$(LIBFT):
	$(MAKE) -C $(LIBFT_PATH)

.PHONY: all clean fclean re
