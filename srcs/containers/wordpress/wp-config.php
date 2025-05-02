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
// define( 'DB_NAME', 'my_database' );
define( 'DB_NAME', getenv( 'WORDPRESS_DB_NAME' ) );
/** Database username */
// define( 'DB_USER', 'my_user' );
define( 'DB_USER', getenv( 'WORDPRESS_DB_USER' ) );

/** Database password */
// define( 'DB_PASSWORD', 'my_password' );
define( 'DB_PASSWORD', getenv( 'WORDPRESS_DB_PASSWORD' ) );
/** Database hostname */
// define( 'DB_HOST', 'mariadb:3306' );
define( 'DB_HOST', getenv( 'WORDPRESS_DB_HOST' ) );
/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         '1?Nm*/=s/62em|:w#Ei87XL;fGM LcczN= k%`TJ8+_ ncRZB&nA&9Wj[jgb|[s$' );
define( 'SECURE_AUTH_KEY',  ']gGzsnF^0RNgx3z7O_TIk.xEKDoqkz4S6O79}F`aV$X5lX&=jUP|X8x<M:sR!3d7' );
define( 'LOGGED_IN_KEY',    ' PETE(y>f9}5-.JA9w$+]]UeSsbgFwEjhiF8nN^K{#AIDwS>rYuc3w)u[Tbuzx1L' );
define( 'NONCE_KEY',        'n=wP`cQfe|]7,7_Y)H$Euuy_+<Y|LgtjB:b*{8=E3%#O5Xb]*cgI?r%;$vczQ@b(' );
define( 'AUTH_SALT',        '3X*C3BP`BkuF!J9Fg5M:w*c:A?pJiF~bY&_4i71PES_F}<;)}|o8@LB$hb785n_i' );
define( 'SECURE_AUTH_SALT', 'qI-JwvUZ&xOu@?Uv3&:h)T+6U>[g?,xr*5ib)%eim<b}))e~--+T4>U]V] Wx=h(' );
define( 'LOGGED_IN_SALT',   '3{Tl-(<Ae-#o)9)tUD/,C0e$R!2z(q:m?o4`q*X4#x.[:j-06BGf%-HVc^Rq9$Ba' );
define( 'NONCE_SALT',       'j#{;&/Dzn;,];%*F(MN=byR$`j1F`N>KJ.-;p-d#;;9cC`+a;(L2${m^f!Lz:wzt' );

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
// define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);  // Hides errors from the frontend, logs them instead





/* Add any custom values between this line and the "stop editing" line. */

// Redis Cache Settings
define( 'WP_REDIS_HOST', 'redis' );  // The Redis service name defined in docker-compose.yml
define( 'WP_REDIS_PORT', 6379 );     // The port Redis is running on (default is 6379)
// define( 'WP_REDIS_DATABASE', 0 );    // Default Redis database is 0 (optional, use if needed)
// define( 'WP_REDIS_DISABLED', false );
define( 'WP_CONTENT_DIR', '/var/www/html/wordpress/wp-content' );
define('FS_METHOD', 'direct');  // Tells WordPress to use direct file access
// define('WP_REDIS_ENABLED', true); // Enable Redis Object Cache
//define( 'WP_CONTENT_URL', 'http://yourdomain.com/wordpress/wp-content' );


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
