require "robustly"
require "shrug/version"

module Shrug
  WHITELIST = %w(to_ary constantize to_str)

  def method_missing(method, *args, &block)
    return if WHITELIST.include?(method.to_s)

    STDERR.puts("¯\\_(ツ)_/¯ (`#{method.to_s}' undefined)")

    safely default: self do
      raise NoMethodError.new("undefined method `#{method}' for nil:NilClass (¯\\_(ツ)_/¯)")
    end
  end

  def respond_to_missing?(method, *args, &block)
    !WHITELIST.include?(method.to_s)
  end
end

NilClass.send :include, Shrug
