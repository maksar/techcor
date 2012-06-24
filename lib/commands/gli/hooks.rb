class TechcorCli
  pre do
    ENV['RACK_ENV'] ||= 'production'
    require 'hirb'
    require 'techcor'
    true
  end
end