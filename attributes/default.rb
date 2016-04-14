# frozen_string_literal: true
# ruby

default['build-essential']['compile_time'] = true
default['ruby-ng']['ruby_version'] = node['ruby'].try(:[], 'version') || '2.3'

# appserver
## common

default['defaults']['appserver']['worker_processes'] = 4
default['defaults']['appserver']['adapter'] = 'unicorn'

## unicorn

default['defaults']['appserver']['accept_filter'] = 'httpready'
default['defaults']['appserver']['backlog'] = 1024
default['defaults']['appserver']['delay'] = 0.5
default['defaults']['appserver']['preload_app'] = true
default['defaults']['appserver']['tcp_nodelay'] = true
default['defaults']['appserver']['tcp_nopush'] = false
default['defaults']['appserver']['tries'] = 5
default['defaults']['appserver']['timeout'] = 60

# framework
## common

default['defaults']['framework']['adapter'] = 'rails'

## rails

default['defaults']['framework']['migrate'] = true
default['defaults']['framework']['migration_command'] =
  'bundle exec rake db:version > /dev/null 2>&1 && bundle exec rake db:migrate || bundle exec rake db:setup'