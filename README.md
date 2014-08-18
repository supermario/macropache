# Macropache

Macropache is a simple set of default macros for Apache's mod_macro that makes defining virtual hosts spectacularly less terrible.

## What?

Replace this:

```
<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www
  ServerName mysite.com
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

With this:

`Use VirtualHost /path/to/webroot mysite.com`

## Install

See install.sh for a simple helper script.

If using Apache 2.4, you'll want the apache2.4 branch macros.conf as some extra config is required.

## Macros

These are the ones available by default, see macros.conf for full definitions.

### Name Based
`VirtualHost $dir $host`

`VirtualHostA $dir $host $aliases`

`VirtualHostI $dir $host $inc`

`VirtualHostAI $dir $host $aliases $inc`

### SSL Name Based
`SSLVirtualHost $dir $host`

`SSLVirtualHostA $dir $host $aliases`

`SSLVirtualHostI $dir $host $inc`

`SSLVirtualHostAI $dir $host $aliases $inc`

### IP Based
`IPVirtualHost $ip $dir`

`IPVirtualHostI $ip $dir $inc`

### IP SSL Based
`IPSSLVirtualHostA $ip $dir $host $aliases`

`IPSSLVirtualHostAI $ip $dir $host $aliases $inc`

## Defaults

To set defaults for all vhosts, uncomment the `Include` within `Macro VirtualHostDefaults` and set a path to a folder or a specific config file.

## Examples

Single domain

`Use VirtualHost /path/to/webroot mysite.com`

With an alias. Separate multiple aliases with a space within quotes.

`Use VirtualHostA /path/to/webroot mysite.com "www.mysite.com wow.mysite.com"`

With an include file. Use when extra project specific config is required.

`Use VirtualHostI /path/to/webroot mysite.com /path/to/additional/settings.conf`

With both alias and include, combines previous two examples.

`Use VirtualHostAI /path/to/webroot mysite.com "www.mysite.com" /path/to/additional/settings.conf`
