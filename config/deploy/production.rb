server '35.73.40.148', user: 'a_mikke_host', roles: ['app', 'db', 'web']

set :ssh_options, {
  keys: ['~/.ssh/a_mikke.pem'],
  forward_agent: true,
  auth_methods: ['publickey']
}
