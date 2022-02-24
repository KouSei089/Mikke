server '#', user: '#', roles: ['app', 'db', 'web']

set :ssh_options, {
  keys: ['~/.ssh/#'],
  forward_agent: true,
  auth_methods: ['publickey']
}
