#!/usr/bin/pup
# execute a process with Puppet
exec {'pkill':
command  => 'pkill killmenow',
provider => 'shell'
}

