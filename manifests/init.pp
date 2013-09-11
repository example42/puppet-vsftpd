# = Class: vsftpd
#
# This is the main vsftpd class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, vsftpd class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $vsftpd_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, vsftpd main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $vsftpd_source
#
# [*source_dir*]
#   If defined, the whole vsftpd configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $vsftpd_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $vsftpd_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, vsftpd main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $vsftpd_template
#   By default [*template*] is empty, so the default distribution configuration is
#   used.
#   A template is provided (if you want to use it), covering most of the
#   available parameters for vsftpd.
#   If you want to use it, set template to 'vsftpd/vsftpd.conf.erb'
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $vsftpd_options
#
# [*service_autorestart*]
#   Automatically restarts the vsftpd service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $vsftpd_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $vsftpd_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $vsftpd_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $vsftpd_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for vsftpd checks
#   Can be defined also by the (top scope) variables $vsftpd_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $vsftpd_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $vsftpd_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $vsftpd_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $vsftpd_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for vsftpd port(s)
#   Can be defined also by the (top scope) variables $vsftpd_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling vsftpd. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $vsftpd_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $vsftpd_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $vsftpd_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $vsftpd_audit_only
#   and $audit_only
#
# Default class params - As defined in vsftpd::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of vsftpd package
#
# [*service*]
#   The name of vsftpd service
#
# [*service_status*]
#   If the vsftpd service init script supports status argument
#
# [*process*]
#   The name of vsftpd process
#
# [*process_args*]
#   The name of vsftpd arguments. Used by puppi and monitor.
#   Used only in case the vsftpd process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user vsftpd runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*listen*]
# If enabled, vsftpd will run in standalone mode. This means that vsftpd must
# not be run from an inetd of some kind. Instead, the vsftpd executable is
# run once directly. vsftpd itself will then take care of listening for and
# handling incoming connections. 
#
#
# [*listen_ipv6*]
# Like the listen parameter, except vsftpd will listen on an IPv6 socket
# instead of an IPv4 one. This parameter and the listen parameter are
# mutually exclusive. 
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $vsftpd_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $vsftpd_protocol
#
# [*anonymous_enable*]
#   Allow anonymous FTP? (Beware - allowed by default).
#
# [*anon_mkdir_write_enable*]
#   If you want the anonymous FTP user to be able to create new directories. (Default: true).
#   Requires *anonymous_enable* and *write_enable*
#
# [*anon_upload_enable*]
#   Allow the anonymous FTP user to upload files. (Default: false). This only
#   has an effect if the above global *write_enable* is activated. Also, you will
#   obviously need to create a directory writable by the FTP user.
#
# [*chroot_local_user*]
#   Default: false
#   If set to true, local users will be (by default) placed in a chroot() jail in
#   their home directory after login.
#   (Warning! chroot'ing can be very dangerous. If using chroot, make sure that
#   the user does not have write access to the top level directory within the
#   chroot)
#
# [*chroot_list_enable*]
#   You may specify an explicit list of local users to chroot() to their home
#   directory. If *chroot_local_user* is true, then this list becomes a list of
#   users to NOT chroot().
#
# [*chroot_list_file*]
#   The name of a file containing a list of local users which  will
#   be  placed in a chroot() jail in their home directory.
#   Requires *chroot_list_enable* enabled.
#   If the  option *chroot_local_user* is enabled, then the list file becomes a
#   list of users to NOT place in a chroot() jail.
#
# [*connect_from_port_20*]
#   Make sure PORT transfer connections originate from port 20 (ftp-data).
#   Default: true
#
# [*data_connection_timeout*]
#   You may change the default value for timing out a data connection.
#   Default: 120 seconds.
#
# [*deny_email_enable*]
#   You may specify a file of disallowed anonymous e-mail addresses. Apparently
#   useful for combatting certain DoS attacks. Default: false
#   If activated, you may provide a list of anonymous password  e-mail  responses
#   which  cause login to be denied. By default, the file containing this list is
#   /etc/vsftpd/banned_emails, but you may override this with the
#   *banned_email_file* setting.
#
# [*banned_email_file*]
#   Defaults to /etc/vsftpd/banned_emails.
#
# [*dirmessage_enable*]
#   Activate directory messages - messages given to remote users when they
#   go into a certain directory. (Default: true)
#
# [*ftpd_banner*]
#   You may fully customise the login banner string
#
# [*idle_session_timeout*]
#   You may change the default value for timing out an idle session.
#   Default: 600 seconds.
#
# [*local_enable*]
#   Allow local users to log in. (Default true)
#
# [*local_umask*]
#   Default umask for local users is 022, as used by most other ftpd's.
#
# [*use_localtime*]
#   If enabled, vsftpd will display directory listings with the time
#   in your local time zone. The default (false) is to display GMT. The
#   times returned by the MDTM FTP command are also affected by this
#   option.
#
# [*userlist_enable*]
#   If enabled, vsftpd will load a list of usernames, from the filename given  by
#   userlist_file.   If  a  user  tries to log in using a name in this file, they
#   will be denied before they are asked for a password. This may  be  useful  in
#   preventing cleartext passwords being transmitted
#
# [*userlist_file*]
#   Default: /etc/vsftpd/user_list
#
# [*write_enable*]
#   Enable any form of FTP write command.  (Default true)
#
# [*pam_service_name*]
#   Default: man page says the default is: ftp.
#   This string is the name of the PAM service vsftpd will use.
#   On debian and centos, you have to use vsftpd
#
# [*xferlog_enable*]
#   Activate logging of uploads/downloads. (Default: true)
#   The target log file can be vsftpd_log_file or xferlog_file.
#   Destination depends on setting *xferlog_std_format* parameter
#
# [*xferlog_std_format*]
#   Switches between logging into vsftpd_log_file and xferlog_file (using
#   standard ftpd xferlog format). Note that the default log file location
#   is /var/log/xferlog in this case.
#   false writes to vsftpd_log_file, true to xferlog_file. Distro-dependent.
#
# [*xferlog_file*]
#   You may override where the log file goes if you like. The default is distro-dependent.
#   Depends on *xferlog_enable*=true and *xferlog_std_format*=true
#   WARNING - changing this filename affects /etc/logrotate.d/vsftpd.log
#
# [*guest_enable*]
#   If enabled, all non-anonymous logins are classed as "guest" logins.
#   A guest login is remapped to the user specified in the guest_username setting.
#
# [*guest_username*]
# This is the user to which logins are remapped when using guest_enable
#
# [*user_config_dir*]
# This powerful option allows the override of any config option specified in
# the manual page, on a per-user basis. Usage is simple, and is best illustrated
# with an example. If you set user_config_dir to be /etc/vsftpd_user_conf and
# then log on as the user "chris", then vsftpd will apply the settings in the
# file /etc/vsftpd_user_conf/chris for the duration of the session. The format
# of this file is as detailed in this manual page! PLEASE NOTE that not all
# settings are effective on a per-user basis. For example, many settings only
# prior to the user's session being started. Examples of settings which will
# not affect any behviour on a per-user basis include listen_address,
# banner_file, max_per_ip, max_clients, xferlog_file, etc. 
#
# [*local_root*]
# This option represents a directory which vsftpd will try to change into after
# a local (i.e. non-anonymous) login. Failure is silently ignored.
#
# [*tcp_wrappers*]
# If enabled, and vsftpd was compiled with tcp_wrappers support, incoming
# connections will be fed through tcp_wrappers access control. Furthermore,
# there is a mechanism for per-IP based configuration. If tcp_wrappers sets the
# VSFTPD_LOAD_CONF environment variable, then the vsftpd session will try and
# load the vsftpd configuration file specified in this variable. 
# [*pasv_max_port*]
# The maximum port to allocate for PASV style data connections. Can be used to
# specify a narrow port range to assist firewalling.
#  Default: 0 (use any port) 
#
# [*pasv_min_port*]
# The minimum port to allocate for PASV style data connections. Can be used to
# specify a narrow port range to assist firewalling.
# Default: 0 (use any port) 
#
# [*user_sub_token*]
# This option is useful is conjunction with virtual users. It is used to
# automatically generate a home directory for each virtual user, based on a
# template. For example, if the home directory of the real user specified via
# guest_username is /home/virtual/$USER, and user_sub_token is set to $USER,
# then when virtual user fred logs in, he will end up (usually chroot()'ed)
# in the directory /home/virtual/fred. This option also takes affect if
# local_root contains user_sub_token.
# Default: (none)
#
# [*virtual_use_local_privs*]
# If enabled, virtual users will use the same privileges as local users. By
# default, virtual users will use the same privileges as anonymous users,
# which tends to be more restrictive (especially in terms of write access).
# Default: NO 
#
# [*hide_ids*]
# If enabled, all user and group information in directory listings will be
# displayed as "ftp".
# Default: NO
#
# [*nopriv_user*]
# This is the name of the user that is used by vsftpd when it wants to be
# totally unprivileged. Note that this should be a dedicated user, rather
# than nobody. The user nobody tends to be used for rather a lot of important
# things on most machines.
# Default: nobody 
#
# [*secure_chroot_dir*]
# This option should be the name of a directory which is empty. Also, the
# directory should not be writable by the ftp user. This directory is used as
# a secure chroot() jail at times vsftpd does not require filesystem access.
# Default: /usr/share/empty
#
# [*log_ftp_protocol*]
# When enabled, all FTP requests and responses are logged, providing the
# option xferlog_std_format is not enabled. Useful for debugging. 
#
###############################################################################################
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include vsftpd"
# - Call vsftpd as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class vsftpd (
  $my_class                = params_lookup( 'my_class' ),
  $source                  = params_lookup( 'source' ),
  $source_dir              = params_lookup( 'source_dir' ),
  $source_dir_purge        = params_lookup( 'source_dir_purge' ),
  $template                = params_lookup( 'template' ),
  $service_autorestart     = params_lookup( 'service_autorestart' , 'global' ),
  $options                 = params_lookup( 'options' ),
  $version                 = params_lookup( 'version' ),
  $absent                  = params_lookup( 'absent' ),
  $disable                 = params_lookup( 'disable' ),
  $disableboot             = params_lookup( 'disableboot' ),
  $monitor                 = params_lookup( 'monitor' , 'global' ),
  $monitor_tool            = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target          = params_lookup( 'monitor_target' , 'global' ),
  $puppi                   = params_lookup( 'puppi' , 'global' ),
  $puppi_helper            = params_lookup( 'puppi_helper' , 'global' ),
  $firewall                = params_lookup( 'firewall' , 'global' ),
  $firewall_tool           = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src            = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst            = params_lookup( 'firewall_dst' , 'global' ),
  $debug                   = params_lookup( 'debug' , 'global' ),
  $audit_only              = params_lookup( 'audit_only' , 'global' ),
  $package                 = params_lookup( 'package' ),
  $service                 = params_lookup( 'service' ),
  $service_status          = params_lookup( 'service_status' ),
  $process                 = params_lookup( 'process' ),
  $process_args            = params_lookup( 'process_args' ),
  $process_user            = params_lookup( 'process_user' ),
  $config_dir              = params_lookup( 'config_dir' ),
  $config_file             = params_lookup( 'config_file' ),
  $config_file_mode        = params_lookup( 'config_file_mode' ),
  $config_file_owner       = params_lookup( 'config_file_owner' ),
  $config_file_group       = params_lookup( 'config_file_group' ),
  $config_file_init        = params_lookup( 'config_file_init' ),
  $pid_file                = params_lookup( 'pid_file' ),
  $data_dir                = params_lookup( 'data_dir' ),
  $listen                  = params_lookup( 'listen' ),
  $listen_ipv6             = params_lookup( 'listen_ipv6' ),
  $log_dir                 = params_lookup( 'log_dir' ),
  $log_file                = params_lookup( 'log_file' ),
  $port                    = params_lookup( 'port' ),
  $protocol                = params_lookup( 'protocol' ),
  $anonymous_enable        = params_lookup( 'anonymous_enable' , 'global' ),
  $anon_mkdir_write_enable = params_lookup( 'anon_mkdir_write_enable' , 'global' ),
  $anon_upload_enable      = params_lookup( 'anon_upload_enable' , 'global' ),
  $banned_email_file       = params_lookup( 'banned_email_file' , 'global' ),
  $chroot_list_enable      = params_lookup( 'chroot_list_enable' , 'global' ),
  $chroot_list_file        = params_lookup( 'chroot_list_file' , 'global' ),
  $chroot_list_file_source = params_lookup( 'chroot_list_file_source' , 'global' ),
  $chroot_local_user       = params_lookup( 'chroot_local_user' , 'global' ),
  $connect_from_port_20    = params_lookup( 'connect_from_port_20' , 'global' ),
  $data_connection_timeout = params_lookup( 'data_connection_timeout' , 'global' ),
  $deny_email_enable       = params_lookup( 'deny_email_enable' , 'global' ),
  $dirmessage_enable       = params_lookup( 'dirmessage_enable' , 'global' ),
  $ftpd_banner             = params_lookup( 'ftpd_banner' , 'global' ),
  $pam_service_name        = params_lookup( 'pam_service_name' , 'global' ),
  $idle_session_timeout    = params_lookup( 'idle_session_timeout' , 'global' ),
  $local_enable            = params_lookup( 'local_enable' , 'global' ),
  $local_umask             = params_lookup( 'local_umask' , 'global' ),
  $tcp_wrappers            = params_lookup( 'tcp_wrappers' , 'global' ), 
  $use_localtime           = params_lookup( 'use_localtime' , 'global' ),
  $userlist_enable         = params_lookup( 'userlist_enable' , 'global' ),
  $userlist_file           = params_lookup( 'userlist_file' , 'global' ),
  $userlist_file_source    = params_lookup( 'userlist_file_source' , 'global' ),
  $write_enable            = params_lookup( 'write_enable' , 'global' ),
  $xferlog_enable          = params_lookup( 'xferlog_enable' , 'global' ),
  $xferlog_std_format      = params_lookup( 'xferlog_std_format' , 'global' ),
  $xferlog_file            = params_lookup( 'xferlog_file' , 'global' ),
  $guest_enable            = params_lookup( 'guest_enable' , 'global' ),
  $guest_username          = params_lookup( 'guest_username' , 'global' ),
  $user_config_dir         = params_lookup( 'user_config_dir' , 'global' ),
  $local_root              = params_lookup( 'local_root' , 'global' ),
  $pasv_max_port           = params_lookup( 'pasv_max_port' , 'global' ),
  $pasv_min_port           = params_lookup( 'pasv_min_port' , 'global' ),
  $user_sub_token          = params_lookup( 'user_sub_token' , 'global' ),
  $virtual_use_local_privs = params_lookup( 'virtual_use_local_privs' , 'global' ),
  $hide_ids                = params_lookup( 'hide_ids' , 'global' ),
  $nopriv_user             = params_lookup( 'nopriv_user' , 'global' ),
  $secure_chroot_dir       = params_lookup( 'secure_chroot_dir' , 'global' ),
  $log_ftp_protocol        = params_lookup( 'log_ftp_protocol' , 'global' )

  ) inherits vsftpd::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  $bool_anonymous_enable=any2bool($anonymous_enable)
  $bool_anon_mkdir_write_enable=any2bool($anon_mkdir_write_enable)
  $bool_anon_upload_enable=any2bool($anon_upload_enable)
  $bool_chroot_list_enable=any2bool($chroot_list_enable)
  $bool_chroot_local_user=any2bool($chroot_local_user)
  $bool_connect_from_port_20=any2bool($connect_from_port_20)
  $bool_deny_email_enable=any2bool($deny_email_enable)
  $bool_dirmessage_enable=any2bool($dirmessage_enable)
  $bool_listen=any2bool($listen)
  if $bool_listen {
    $bool_listen_ipv6=false
  } else {
    $bool_listen_ipv6=any2bool($listen_ipv6)
  }
  $bool_local_enable=any2bool($local_enable)
  $bool_tcp_wrappers=any2bool($tcp_wrappers)
  $bool_use_localtime=any2bool($use_localtime)
  $bool_userlist_enable=any2bool($userlist_enable)
  $bool_write_enable=any2bool($write_enable)
  $bool_xferlog_enable=any2bool($xferlog_enable)
  $bool_xferlog_std_format=any2bool($xferlog_std_format)
  $bool_guest_enable=any2bool($guest_enable)
  $bool_virtual_use_local_privs=any2bool($virtual_use_local_privs)
  $bool_hide_ids=any2bool($hide_ids)
  $bool_log_ftp_protocol=any2bool($log_ftp_protocol)
 
 # Template files variables

  $real_anonymous_enable = $vsftpd::bool_anonymous_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_anon_mkdir_write_enable = $vsftpd::bool_anon_mkdir_write_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_anon_upload_enable = $vsftpd::bool_anon_upload_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_chroot_list_enable = $vsftpd::bool_chroot_list_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_chroot_local_user = $vsftpd::bool_chroot_local_user ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_connect_from_port_20 = $vsftpd::bool_connect_from_port_20 ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_deny_email_enable = $vsftpd::bool_deny_email_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_dirmessage_enable = $vsftpd::bool_dirmessage_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_listen = $vsftpd::bool_listen ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_listen_ipv6 = $vsftpd::bool_listen_ipv6 ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_local_enable = $vsftpd::bool_local_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_tcp_wrappers = $vsftpd::bool_tcp_wrappers ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_use_localtime = $vsftpd::bool_use_localtime ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_userlist_enable = $vsftpd::bool_userlist_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_write_enable = $vsftpd::bool_write_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_xferlog_enable = $vsftpd::bool_xferlog_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_xferlog_std_format = $vsftpd::bool_xferlog_std_format ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_guest_enable = $vsftpd::bool_guest_enable ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_virtual_use_local_privs = $vsftpd::bool_virtual_use_local_privs ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_hide_ids = $vsftpd::bool_hide_ids ? {
    true  => 'YES',
    false => 'NO',
  }

  $real_log_ftp_protocol = $vsftpd::bool_log_ftp_protocol ? {
    true  => 'YES',
    false => 'NO',
  }

  ### Definition of some variables used in the module
  $manage_package = $vsftpd::bool_absent ? {
    true  => 'absent',
    false => $vsftpd::version,
  }

  $manage_service_enable = $vsftpd::bool_disableboot ? {
    true    => false,
    default => $vsftpd::bool_disable ? {
      true    => false,
      default => $vsftpd::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $vsftpd::bool_disable ? {
    true    => 'stopped',
    default =>  $vsftpd::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $vsftpd::bool_service_autorestart ? {
    true    => Service[vsftpd],
    false   => undef,
  }

  $manage_file = $vsftpd::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $vsftpd::bool_absent == true
  or $vsftpd::bool_disable == true
  or $vsftpd::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $vsftpd::bool_absent == true
  or $vsftpd::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $vsftpd::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $vsftpd::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $vsftpd::source ? {
    ''        => undef,
    default   => $vsftpd::source,
  }

  $manage_userlist_file_source = $vsftpd::userlist_file_source ? {
    ''        => undef,
    default   => $vsftpd::userlist_file_source,
  }

  $manage_chroot_list_file_source = $vsftpd::chroot_list_file_source ? {
    ''        => undef,
    default   => $vsftpd::chroot_list_file_source,
  }

  $manage_file_content = $vsftpd::template ? {
    ''        => undef,
    default   => template($vsftpd::template),
  }

  ### Managed resources
  package { 'vsftpd':
    ensure => $vsftpd::manage_package,
    name   => $vsftpd::package,
  }

  service { 'vsftpd':
    ensure     => $vsftpd::manage_service_ensure,
    name       => $vsftpd::service,
    enable     => $vsftpd::manage_service_enable,
    hasstatus  => $vsftpd::service_status,
    pattern    => $vsftpd::process,
    require    => Package['vsftpd'],
  }

  file { 'vsftpd.conf':
    ensure  => $vsftpd::manage_file,
    path    => $vsftpd::config_file,
    mode    => $vsftpd::config_file_mode,
    owner   => $vsftpd::config_file_owner,
    group   => $vsftpd::config_file_group,
    require => Package['vsftpd'],
    notify  => $vsftpd::manage_service_autorestart,
    source  => $vsftpd::manage_file_source,
    content => $vsftpd::manage_file_content,
    replace => $vsftpd::manage_file_replace,
    audit   => $vsftpd::manage_audit,
  }

  if $vsftpd::bool_userlist_enable == true {
    file { 'userlist_file':
      ensure  => $vsftpd::manage_file,
      path    => $vsftpd::userlist_file,
      mode    => $vsftpd::config_file_mode,
      owner   => $vsftpd::config_file_owner,
      group   => $vsftpd::config_file_group,
      require => Package['vsftpd'],
      notify  => $vsftpd::manage_service_autorestart,
      source  => $vsftpd::manage_userlist_file_source,
      replace => $vsftpd::manage_file_replace,
      audit   => $vsftpd::manage_audit,
    }
  }

  if $vsftpd::bool_chroot_list_enable == true {
    file { 'chroot_list_file':
      ensure  => $vsftpd::manage_file,
      path    => $vsftpd::chroot_list_file,
      mode    => $vsftpd::config_file_mode,
      owner   => $vsftpd::config_file_owner,
      group   => $vsftpd::config_file_group,
      require => Package['vsftpd'],
      notify  => $vsftpd::manage_service_autorestart,
      source  => $vsftpd::manage_chroot_list_file_source,
      replace => $vsftpd::manage_file_replace,
      audit   => $vsftpd::manage_audit,
    }
  }

  # The whole vsftpd configuration directory can be recursively overriden
  if $vsftpd::source_dir {
    file { 'vsftpd.dir':
      ensure  => directory,
      path    => $vsftpd::config_dir,
      require => Package['vsftpd'],
      notify  => $vsftpd::manage_service_autorestart,
      source  => $vsftpd::source_dir,
      recurse => true,
      purge   => $vsftpd::bool_source_dir_purge,
      replace => $vsftpd::manage_file_replace,
      audit   => $vsftpd::manage_audit,
    }
  }


  ### Include custom class if $my_class is set
  if $vsftpd::my_class {
    include $vsftpd::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $vsftpd::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'vsftpd':
      ensure    => $vsftpd::manage_file,
      variables => $classvars,
      helper    => $vsftpd::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $vsftpd::bool_monitor == true {
    monitor::port { "vsftpd_${vsftpd::protocol}_${vsftpd::port}":
      protocol => $vsftpd::protocol,
      port     => $vsftpd::port,
      target   => $vsftpd::monitor_target,
      tool     => $vsftpd::monitor_tool,
      enable   => $vsftpd::manage_monitor,
    }
    monitor::process { 'vsftpd_process':
      process  => $vsftpd::process,
      service  => $vsftpd::service,
      pidfile  => $vsftpd::pid_file,
      user     => $vsftpd::process_user,
      argument => $vsftpd::process_args,
      tool     => $vsftpd::monitor_tool,
      enable   => $vsftpd::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $vsftpd::bool_firewall == true {
    firewall { "vsftpd_${vsftpd::protocol}_${vsftpd::port}":
      source      => $vsftpd::firewall_src,
      destination => $vsftpd::firewall_dst,
      protocol    => $vsftpd::protocol,
      port        => $vsftpd::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $vsftpd::firewall_tool,
      enable      => $vsftpd::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $vsftpd::bool_debug == true {
    file { 'debug_vsftpd':
      ensure  => $vsftpd::manage_file,
      path    => "${settings::vardir}/debug-vsftpd",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
