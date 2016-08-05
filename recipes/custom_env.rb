# Recipe used for a setup and deploy events
Chef::Log.info("Create config/application.yml file...")

node[:deploy].each do |application, deploy|
  Chef::Log.info(deploy.inspect)
  Chef::Log.info(application.inspect)
  environment_variables = deploy[:custom_env].to_h.merge(deploy[:environment_variables].to_h)
  Chef::Log.info("Env variables is #{environment_variables.inspect}")
  custom_env_template do
    application application
    deploy deploy
    env environment_variables
  end
end
