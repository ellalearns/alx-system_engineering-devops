#!/usr/bin/pup
# install a package with puppet

package {'flask':
ensure   => '2.1.0',
provider => 'pip3'
}

