<?php
/**
 * Plugin Name:     Shut I18n Doing It Wrong Messages
 * Description:     Filters _load_textdomain_just_in_time doing it wrong messages in 6.7
 * Author:          Move Your Digital, Inc.
 * Author URI:      https://moveyourdigital.com
 * Version:         0.0.1
 *
 * @package         SIDIWM
 */

/*
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

/**#@+
 * Shut messages!
 */
add_filter(
	'doing_it_wrong_trigger_error',
	function ( $value, $function_name ) {
		if ( '_load_textdomain_just_in_time' === $function_name ) {
			return false;
		}

		return $value;
	},
	10,
	4
);