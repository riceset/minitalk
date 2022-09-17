/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/20 07:10:08 by tkomeno           #+#    #+#             */
/*   Updated: 2022/08/21 05:00:00 by tkomeno          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	error(char *message)
{
	ft_putstr_fd(message, STDERR_FILENO);
	exit(EXIT_FAILURE);
}

void	send(pid_t pid, char *message)
{
	int	i;
	int	kill_status;
	int	bits_shifted_counter;

	i = 0;
	while (message[i] != '\0')
	{
		bits_shifted_counter = 0;
		while (bits_shifted_counter < 8)
		{
			if ((message[i] >> bits_shifted_counter) & 0b00000001)
				kill_status = kill(pid, SIGUSR1);
			else
				kill_status = kill(pid, SIGUSR2);
			if (kill_status == -1)
				error("kill error.\n");
			bits_shifted_counter++;
			usleep(500);
		}
		i++;
	}
}

int	main(int argc, char **argv)
{
	pid_t	pid;

	if (argc != 3)
		error("invalid arguments.\n");
	if (ft_strlen(argv[1]) > 7)
		error("invalid PID.\n");
	pid = ft_atoi(argv[1]);
	send(pid, argv[2]);
	return (0);
}
