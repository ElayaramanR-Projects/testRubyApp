require 'yaml'

module ConfigHelper
  CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), '../yml/config.yml'))

  def self.base_url
    CONFIG['base_url']
  end

  def self.home
    CONFIG['home']
  end
end