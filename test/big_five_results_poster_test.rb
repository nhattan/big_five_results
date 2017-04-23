require "minitest/autorun"
require "./big_five_results_poster"

class TestBigFiveResultsPoster < Minitest::Test
  def setup
    @poster = BigFiveResultsPoster.new({}.to_json)
  end

  def test_that_it_respond_to_response_code
    assert_respond_to(@poster, :response_code)
  end

  def test_that_it_respond_to_token
    assert_respond_to(@poster, :token)
  end
end
