# Class: ssh::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#
class ssh::params {
  $ssh_package_ensure = 'latest'

  $ssh_context = '/files/etc/ssh/sshd_config'

  case $::osfamily {
    'RedHat': {
      $ssh_packages = [
        'openssh',
        'openssh-server',
        'openssh-clients'
      ]

      $ssh_service  = 'sshd'
    }
    'Debian': {
      $ssh_packages = [
        'openssh-server',
        'openssh-client'
      ]

      $ssh_service  = 'ssh'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
