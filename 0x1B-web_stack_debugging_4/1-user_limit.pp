# allow user holberton access to nginx server

$user_soft_file = 'holberton soft nofile 80000'
$user_hard_file = 'holberton hard nofile 80000'
$file_name = '/etc/security/limits.conf'

exec { 'increase-hard-file-access-for-holberton':
    command => "echo '${user_hard_file}' >> ${file_name}",
    path    => '/usr/local/bin/:/bin/'
}

exec { 'increase-soft-file-access-for-holberton':
    command => "echo '${user_soft_file}' >> ${file_name}",
    path    => '/usr/local/bin/:/bin/'
}
