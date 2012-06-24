require 'gli'

$:.unshift File.expand_path(File.dirname(File.realpath(__FILE__)))

class TcCli
  extend GLI::App
  commands_from 'commands/gli'

  def self.exec argv
    commands[:help] = GLI::Commands::Help.new(self)
    run(argv)
  end
end
