/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agardina <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/27 14:23:34 by agardina          #+#    #+#             */
/*   Updated: 2020/01/27 14:23:41 by agardina         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fillit.h"

void	change_cursor(t_point *cursor, char mv)
{
	if (mv == MV_N || mv == MV_NW || mv == MV_NE)
		cursor->y--;
	else if (mv == MV_S || mv == MV_SW || mv == MV_SE)
		cursor->y++;
	if (mv == MV_W || mv == MV_NW || mv == MV_SW)
		cursor->x--;
	else if (mv == MV_E || mv == MV_NE || mv == MV_SE)
		cursor->x++;
}

t_point	move_fw(int size, t_point cursor)
{
	if (cursor.x + 1 > size - 1)
	{
		cursor.x = 0;
		(cursor.y)++;
	}
	else
		(cursor.x)++;
	return (cursor);
}

t_point	reset_cursor(t_point cursor)
{
	cursor.x = 0;
	cursor.y = 0;
	return (cursor);
}

void	get_tail(t_tetri **tail, t_tetri *head)
{
	*tail = head;
	while ((*tail)->next)
		*tail = (*tail)->next;
}

void	free_tetri_list(t_tetri *head)
{
	t_tetri *next;

	while (head)
	{
		next = head->next;
		free(head);
		head = next;
	}
}
