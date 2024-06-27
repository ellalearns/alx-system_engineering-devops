# Nginx server is unable to receive a lot of traffic
# This file fixes it by modifying the open file limit

$file_name = '/etc/default/nginx'
$com_seq = 's/15/4096/'

# fix nginx traffic limit
exec { 'increase-traffic-limit':
command => "sed -i ${com_seq} ${file_name}",
path    => '/usr/local/bin/:/bin/'
} ->

# restart nginx
exec {'restart-nginx':
command => 'nginx restart',
path    => '/etc/init.d/'
}

