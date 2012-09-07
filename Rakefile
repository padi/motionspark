$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.setup
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ipad'
  app.device_family = :ipad
  app.interface_orientations = [:landscape_left, :landscape_right]
  app.files_dependencies 'app/app_delegate.rb' => 'app/object.rb'
end
