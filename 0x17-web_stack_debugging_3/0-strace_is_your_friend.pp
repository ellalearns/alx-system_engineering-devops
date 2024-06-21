# solves a 500 server error
# replaces a faulty line in a filee
# changes 'phpp' to 'php'

$file_name = '/var/www/html/wp-settings.php'

exec { 'replace-phpp-with-php':
    command => "sed -i 's/phpp/php/g' ${file_name}",
    path    => '/usr/local/bin/:/bin/'
}
