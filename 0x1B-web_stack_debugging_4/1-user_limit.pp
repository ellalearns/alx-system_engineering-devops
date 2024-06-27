# allow user holberton access to nginx server

$user_soft_file = '/holberton soft/s/4/70000'
$user_hard_file = '/holberton soft/s/5/70000/'
$file_name = '/etc/security/limits.conf'
$path = '/usr/local/bin/:/bin/'

exec { 'increase-hard-file-access-for-holberton':
    command => 'sed -i ${user_hard_file} ${file_name}',
    path    => ${path}
}

exec { 'increase-soft-file-access-for-holberton':
    command => 'sed -i ${user_soft_file} ${file_name}',
    path    => ${path}
}
