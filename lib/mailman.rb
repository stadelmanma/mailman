require 'logger'
require 'fcntl'
require 'mail'
require 'active_support'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/hash/indifferent_access'

require 'maildir'
require 'fssm'

require 'mailman/version'

module Mailman

  [:Application, :Router, :Configuration, :Receiver, :MessageProcessor].each do |constant|
    autoload constant, "mailman/#{constant.to_s.underscore}"
  end

  require 'mailman/route'

  # @return [Configuration] the application configuration.
  def self.config
    @config ||= Configuration.new
  end

  # Resets the app config (useful for testing).
  def self.reset_config!
    @config = Configuration.new
  end

  # Shortcut for the logger object
  def self.logger
    Mailman.config.logger
  end

end
