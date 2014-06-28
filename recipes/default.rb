node[:deploy].each do |application, deploy|
  template 'custom_env.sh' do
    path   '/etc/profile.d/custom_env.sh'
    source 'custom_env.sh.erb'
    group  'root'
    owner  'root'
    mode   '0755'
    variables(:env => node[:custom_env][application])
  end

  if node[:opsworks].has_key?(:rails_stack)
    execute "restart Rails app #{application}" do
      command node[:opsworks][:rails_stack][:restart_command]
    end
  end
end
