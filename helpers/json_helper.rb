require 'json'

module JsonHelper
  def self.read(path)
    file = File.read(File.join(File.dirname(__FILE__), path))
    JSON.parse(file)
  end
end
