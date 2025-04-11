<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'my_database' );

/** Database username */
define( 'DB_USER', 'my_user' );

/** Database password */
define( 'DB_PASSWORD', 'my_password' );
// define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'EY4[Q9Dh&GR-mJ31;+u-!LMX,8rRNw6/k-: cB|2|?G@ic7k<eKFRLPAB**i6sJe');
define('SECURE_AUTH_KEY',  '|_YCL[QL^6Fp|_:# /h5-.(P|eQml0x.NiL.,+]WBls}T4NGo/aHDGOGk1/19ANH');
define('LOGGED_IN_KEY',    'O</}hKygkP,z4aqS.(QK1)x-7r|gc8Z5n8OSD$x-~xk<GV~jc]es^m}+gf8=w+v&');
define('NONCE_KEY',        'J/EHI$sv0t|^,&h6wEY#^Ivo2N>$L_T>XL)>40L9!3[W#8FMNw+/-*47&qQf7-XI');
define('AUTH_SALT',        'H?_?*RjK<|9P_4(I6,+_(4%r[yC/QbF|-8EXnj|)H1-+3c.`#tXk8nnlM=.|.+R{');
define('SECURE_AUTH_SALT', 'yfasXUx/*SHoE@&Zh)UDvU#LBRNVh&72rC2k+7ba&MoT-+#.UD3T52-^Kv(N{9/5');
define('LOGGED_IN_SALT',   '+q[*5DJtC-<SA72s+BPcQ1>9|u*jPX1h^|5K}X=`/:SI|(V1E+,mBLY9.a^MF#Vh');
define('NONCE_SALT',       '60aYJX_sX<-W!5Slf^}3PsQGH`K);FzU}AMX,Mjg+>l+BTy!CLHIbP|R?5Gim5-I');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */

define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', '6379' );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
