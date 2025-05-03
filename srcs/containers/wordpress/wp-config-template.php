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
define( 'DB_NAME', '${WORDPRESS_DB_NAME}' );

/** Database username */
define( 'DB_USER', '${WORDPRESS_DB_USER}' );

/** Database password */
define( 'DB_PASSWORD', '${WORDPRESS_DB_PASSWORD}' );

/** Database hostname */
define( 'DB_HOST', '${WORDPRESS_DB_HOST}' );

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
define( 'AUTH_KEY',         '${AUTH_KEY}' );
define( 'SECURE_AUTH_KEY',  '${SECURE_AUTH_KEY}' );
define( 'LOGGED_IN_KEY',    '${LOGGED_IN_KEY}' );
define( 'NONCE_KEY',        '${NONCE_KEY}' );
define( 'AUTH_SALT',        '${AUTH_SALT}' );
define( 'SECURE_AUTH_SALT', '${SECURE_AUTH_SALT}' );
define( 'LOGGED_IN_SALT',   '${LOGGED_IN_SALT}' );
define( 'NONCE_SALT',       '${NONCE_SALT}' );

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
// define( 'WP_DEBUG', false );
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
// define('WP_DEBUG_DISPLAY', false);  // Hides errors from the frontend, logs them instead
define('WP_DEBUG_DISPLAY', true);  // Hides errors from the frontend, logs them instead




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
