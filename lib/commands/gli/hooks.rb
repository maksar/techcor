class TcCli
  pre do
    ENV['RACK_ENV'] ||= 'production'
    require 'hirb'
    require 'tc'
    true
  end
end