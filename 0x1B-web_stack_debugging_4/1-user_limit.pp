# allow user holberton access to nginx server

$user_soft_file = '/holberton soft/s/4/50000'
$user_hard_file = '/holberton soft/s/5/50000/'
$file_name = '/etc/security/limits.conf'

exec { 'increase-hard-file-access-for-holberton':
    command => "sed -i ${user_hard_file} ${file_name}",
    path    => '/usr/local/bin/:/bin/'
}

exec { 'increase-soft-file-access-for-holberton':
    command => "sed -i ${user_soft_file} ${file_name}",
    path    => '/usr/local/bin/:/bin/'
}
