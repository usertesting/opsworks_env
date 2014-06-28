node[:deploy].each do |application, deploy|
  execute "restart Rails app #{application}" do
    if node[:opsworks].has_key?(:rails_stack)
      cwd deploy[:current_path]
      command 'source /etc/profile.d/custom_env.sh'
      command node[:opsworks][:rails_stack][:restart_command]
      action :nothing
    end
  end

  template 'custom_env.sh' do
    path   '/etc/profile.d/custom_env.sh'
    source 'custom_env.sh.erb'
    group  'root'
    owner  'root'
    mode   '0755'
    variables(:env => node[:custom_env][application])
    notifies :run, resources(:execute => "restart Rails app #{application}")
  end

end
