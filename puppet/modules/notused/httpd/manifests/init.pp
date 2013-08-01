class httpd {
	include httpd::params, httpd::install, httpd::config, httpd::service
}