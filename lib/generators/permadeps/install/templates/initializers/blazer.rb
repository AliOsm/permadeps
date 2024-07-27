if defined?(Blazer)
  Rails.autoloaders.main.on_load('Blazer::BaseController') do
    Blazer::BaseController.content_security_policy false
  end
end
