# Class: vsftpd::params
#
# This class defines default parameters used by the main module class vsftpd
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to vsftpd class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class vsftpd::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'vsftpd',
  }

  $service = $::operatingsystem ? {
    default => 'vsftpd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'vsftpd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'vsftpd',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/vsftpd',
  }

  $config_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/vsftpd.conf',
    default                   => '/etc/vsftpd/vsftpd.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/vsftpd',
    default                   => '/etc/sysconfig/vsftpd',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/vsftpd.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/ftp/pub',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/vsftpd',
  }

  $anonymous_enable        = true
  $anon_mkdir_write_enable = true
  $anon_upload_enable      = false
  $chroot_list_enable      = true
  $chroot_list_file        = '/etc/vsftpd/chroot_list'
  $chroot_list_file_source = 'puppet:///modules/vsftpd/chroot_list'
  $chroot_local_user       = false
  $connect_from_port_20    = true
  $data_connection_timeout = '120'
  $deny_email_enable       = false
  $banned_email_file       = '/etc/vsftpd/banned_emails'
  $dirmessage_enable       = true
  $ftpd_banner             = "Welcome to ${::fqdn} FTP service."
  $idle_session_timeout    = '600'
  $local_enable            = true
  $local_umask             = '022'
  $use_localtime           = false
  $userlist_enable         = true
  $userlist_file           = '/etc/vsftpd/user_list'
  $userlist_file_source    = 'puppet:///modules/vsftpd/user_list'
  $write_enable            = true
  $pam_service_name        = 'vsftpd'
  $xferlog_enable          = true
  $xferlog_std_format      = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => false,
    default                   => true,
  }
  $xferlog_file            = $::operatingsystem ? {
    /(?i:CentOS|Linux|RedHat)/ => '/var/log/xferlog',
    default                    => '/var/log/vsftpd/vsftpd.log',
  }

  $port = '21'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
