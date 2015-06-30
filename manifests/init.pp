# == Class: bashprofile
#
class bashprofile (
  $show_fqdn    = $bashprofile::params::show_fqdn,
  $ps1_template = $bashprofile::params::ps1_template,
  $ensure       = $bashprofile::params::ensure,
) inherits bashprofile::params {

   # Helpful index of bash colors. Who wants to remember this.
   $black         = '\033[0;30m'
   $red           = '\033[0;31m'
   $green         = '\033[0;32m'
   $brown         = '\033[0;33m'
   $blue          = '\033[0;34m'
   $purple        = '\033[0;35m'
   $cyan          = '\033[0;36m'
   $lightgray     = '\033[0;37m'
   $darkgray      = '\033[1;30m'
   $lightred      = '\033[1;31m'
   $lightgreen    = '\033[1;32m'
   $yellow        = '\033[1;33m'
   $lightblue     = '\033[1;34m'
   $lightpurple   = '\033[1;35m'
   $lightcyan     = '\033[1;36m'
   $white         = '\033[1;37m'
   $reset = '\033[0m'

  # Select bash color based on current tier
  $bashcolor = $tier ? {
    'dev'     => $cyan,
    'test'    => $green,
    'staging' => $yellow,
    'prod'    => $red,
    default   => $brown
  }

  # Apply PS1 variable
  file {
    '/etc/profile.d/PS1.sh':
      ensure  => $ensure,
      content => template($ps1_template),
  }

}
