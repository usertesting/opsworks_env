# node[:deploy].each do |application, deploy|
  template "custom_env.sh" do
    path "#{node[:custom_env][:dir]}/custom_env.sh"
    source "custom_env.sh.erb"
    group deploy[:group]
    owner deploy[:user]
    mode "0644"
    variables(:env => node[:opsworks_env][:json_key])
    # variables(:env => node[:custom_env][application])
    # notifies :restart, resources(:service => "redis")
  end
# end