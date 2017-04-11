node default {
  include ::ssh

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

  ssh::config {
    "LogLevel":         value => 'VERBOSE';
    "LoginGraceTime":   value => '30';
    "PermitRootLogin":  value => 'yes';
    "StrictModes":      value => 'yes';
    "MaxAuthTries":     value => '6';
    "X11Forwarding":    value => 'yes';
    "UseDNS":           value => 'no';
    "Banner":           value => '/etc/issue.net';
  }

}