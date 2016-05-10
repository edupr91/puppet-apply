# Global Legacy
$legacy = false

# Disable agents which establish connections if running on VirtualBox (dev)
# Don't change unless you REALLY know what you're doing
if $::virtual == 'virtualbox' {
  $vagrant        = true
  $puppet_cron    = false
  $puppet_service = false
} else {
  $vagrant        = false
  $puppet_cron    = true
  $puppet_service = true
}

# Main generic and ISeC classes
class { '::itnow':
  datavg         => true,
  cleanups       => true,
  tools_scripts  => true,
  limits         => true,
  dnsmasq        => true,
  ntp            => true,
  sysctl         => true,
  snmpd          => true,
  ifalias        => {},
  puppet_cron    => $puppet_cron,
  puppet_service => $puppet_service,
  #puppet_cron_hour   => [ '1', '13' ],
  #puppet_cron_minute => '59',
  legacy         => $legacy,
}
class { '::isec':
  pam          => true,
  logindefs    => true,
  motd         => true,
  profile      => true,
  logrotate    => true,
  cron_0hourly => true,
  user_root    => true,
  ssh          => true,
  vagrant      => $vagrant,
  legacy       => $legacy,
}
# All other mandatory classes in alphabetical order
class { '::menuoper':
  legacy => $legacy,
}
class { '::mta':
  legacy => $legacy,
}
class { '::sysadm':
  legacy => $legacy,
}
class { '::taddm':
  legacy => $legacy,
}
# Mandatory classes which only make sense on non-development environments
if ! $vagrant {
  class { '::bitacora':
    legacy => $legacy,
  }
  class { '::iem':
    legacy => $legacy,
  }
  class { '::itm':
    lineas => { 'bitacora' => true },
    legacy => $legacy,
  }
  class { '::obit':
    ensure => 'absent',
  }
  class { '::stonebranch':
    legacy => $legacy,
  }
  class { '::tad4d':
    legacy => $legacy,
  }
  class { '::tsm':
    legacy => $legacy,
  }
}
# Optional classes
#class { '::tbmr': }

