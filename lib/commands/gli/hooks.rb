pre do
  ENV['RACK_ENV'] ||= 'production'
  require 'hirb'
  require 'tc'
end
