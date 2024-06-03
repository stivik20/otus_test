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
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_database' );

/** Database username */
define( 'DB_USER', 'stivik' );

/** Database password */
define( 'DB_PASSWORD', 'Qq123456' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

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
define( 'AUTH_KEY',         'u=4BcinkToq3T->O4d~<f$Y./h?fA7GIPx<&U?[!FO7;~;Ih&tvzWW[d^&-nFD@h' );
define( 'SECURE_AUTH_KEY',  'VX|Ts79v8MV G44wrVE1d_b$a#n?ZoRVab7Z&4bCkloEQ4ky51s/E;]F,dGrV.#5' );
define( 'LOGGED_IN_KEY',    '[z,>T[Vf^0%)]Xx@f(FhOG#oR0^2nmaYU*T8KR~G8kM)3jDmo@D#K`J(7ysNA&CL' );
define( 'NONCE_KEY',        '#^RxvouquCu;Y-<1]8|,h-Ti>0./% >1K}*-?3=*8jrt>B3lnwTfy%~;~n5YTcv=' );
define( 'AUTH_SALT',        'f9^nb^{AjpRjR6GtI*UqKlw{rV,*q}s5#!NN;-1#qVU!TV9gvzqr33lVp-Qdek#x' );
define( 'SECURE_AUTH_SALT', '&W/(9Hf!Hxd3nI*rq7,-tbjNj WUOXI6^a4_?usY=:ADxUOh0aYbOqR]<CwSH9dd' );
define( 'LOGGED_IN_SALT',   'ciOVluSn{qe(+nnEbp%@F73XDQ~KIqbWyEhnL;qmwqm+cnaw-]u[)<P8uf`E4k7&' );
define( 'NONCE_SALT',       ')e/4`$kJ^Y=$hm8I/D?Z?FqT*I?SqN#}!V!L9LDXXd%`36Tl6m|OvVGI (Q{1cx%' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
