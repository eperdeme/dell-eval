package { 'build-essential': ensure => present }
package { 'ruby-dev': ensure => present }

include 'vcenter::package'

