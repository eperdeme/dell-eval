package { 'build-essential': ensure => present }
package { 'ruby-dev': ensure => present }
package { 'ruby-net-ssh': ensure => present }
package { 'libnokogiri-ruby': ensure => present }

include 'vcenter::package'
