require "robustly"
require "shrug/version"

module Shrug
  def method_missing(method, *args, &block)
    STDERR.puts('¯\_(ツ)_/¯')
    STDERR.puts method
    Robustly.report_exception(NoMethodError.new("undefined method `#{method}' for nil:NilClass (¯\\_(ツ)_/¯)"))

    self # magic happens here
  end
end

NilClass.send :include, Shrug
