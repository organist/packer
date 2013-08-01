class httpd::install {
	package { "httpd":
		ensure => latest,
	}
}