require "minitest/autorun"
require "./big_five_results_poster"

class TestBigFiveResultsTextSerializer < Minitest::Test
  def setup
    @serializer = BigFiveResultsTextSerializer.new("mock")
  end

  def test_to_hash
    assert_kind_of(@serializer.to_hash, Hash)
  end

  def test_to_underscore
    assert_equal(@serializer.to_underscore("Imagination", "imagination"))
    assert_equal(@serializer.to_underscore("Artistic Interest", "artistic_interests"))
    assert_equal(@serializer.to_underscore("Self-Consciousness", "self_consciousness"))
  end
end
