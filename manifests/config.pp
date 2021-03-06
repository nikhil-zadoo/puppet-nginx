class nginx::config (
  String $ensure                        = $::nginx::ensure,
  String $package_name                  = $::nginx::package_name,
  String $config_dir                    = $::nginx::config_dir,
  String $config_ensure                 = $::nginx::config_ensure,
  String $config_mode                   = $::nginx::config_mode,
  String $config_owner                  = $::nginx::config_owner,
  String $config_group                  = $::nginx::config_group,
  String $config_confd                  = $::nginx::config_confd,
  String $config_pid_file               = $::nginx::config_pid_file,
  Optional[String] $config_vdir_enable  = $::nginx::config_vdir_enable,
  String $config_process_user           = $::nginx::config_process_user,
  String $vhost_dir                     = $::nginx::vhost_dir,
  String $service_name                  = $::nginx::service_name,
  String $service_ensure                = $::nginx::service_ensure,
  String $service_pattern               = $::nginx::service_pattern,
  Boolean $service_enable               = $::nginx::service_enable,
  Boolean $service_hasstatus            = $::nginx::service_hasstatus,
  Boolean $service_hasrestart           = $::nginx::service_hasrestart,
  String $doc_root                      = $::nginx::doc_root,
  String $log_dir                       = $::nginx::config_log_dir
) {
  file {'nginx_config':
    ensure  => file,
    path    => "${config_dir}/nginx.conf",
    mode    => $config_mode,
    owner   => $config_owner,
    group   => $config_group,
    content => template("${module_name}/conf.d/nginx.conf.erb"),
  }

  file { $log_dir:
    ensure  => directory,
    recurse => true,
  }

  file { $doc_root:
    ensure  => directory,
    recurse => true,
    mode    => $config_mode,
    owner   => $config_owner,
    group   => $config_group,
  }
}
