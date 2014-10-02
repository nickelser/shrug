require_relative "test_helper"

class TestShrug < Minitest::Test

  def setup
    Robustly.env = "production"
  end

  def test_shrug
    mock = MiniTest::Mock.new
    mock.expect :report_exception, nil, [NoMethodError]
    Robustly.report_exception_method = proc {|e| mock.report_exception(e) }
    @foo.baz
    assert mock.verify
  end

end