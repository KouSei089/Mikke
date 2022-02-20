server '52.199.195.33', user: 'mikke_app', roles: ['app', 'db', 'web']

set :ssh_options, {
  keys: ['~/.ssh/mikke_app.pem'],
  forward_agent: true,
  auth_methods: ['publickey']
}
