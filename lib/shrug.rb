require "robustly"
require "shrug/version"

module Shrug
  WHITELIST = %w(to_ary constantize to_str)

  def method_missing(method, *args, &block)
    return if WHITELIST.include?(method.to_s)

    STDERR.puts("¯\\_(ツ)_/¯ (`#{method.to_s}' undefined)")
    Robustly.report_exception(NoMethodError.new("undefined method `#{method}' for nil:NilClass (¯\\_(ツ)_/¯)"))

    self # magic happens here
  end
end

NilClass.send :include, Shrug
