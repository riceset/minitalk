/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/20 06:21:22 by tkomeno           #+#    #+#             */
/*   Updated: 2022/08/21 05:02:49 by tkomeno          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

t_char	g_char;

void	init_char(void)
{
	g_char.bits_shifted_counter = 0;
	g_char.assembled_char = '\0';
}

void	print_pid(void)
{
	ft_putnbr_fd(getpid(), STDOUT_FILENO);
	ft_putchar_fd('\n', STDOUT_FILENO);
}

void	print_character(int signal)
{
	if (signal == SIGUSR1)
		g_char.assembled_char += (0b00000001 << g_char.bits_shifted_counter);
	if (g_char.bits_shifted_counter == 7)
	{
		ft_putchar_fd(g_char.assembled_char, STDOUT_FILENO);
		init_char();
		return ;
	}
	g_char.bits_shifted_counter++;
}

void	send_signals(void)
{
	signal(SIGUSR1, print_character);
	signal(SIGUSR2, print_character);
	while (true)
		pause();
}

int	main(void)
{
	init_char();
	print_pid();
	send_signals();
	return (0);
}
