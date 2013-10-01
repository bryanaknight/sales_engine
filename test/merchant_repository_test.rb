require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_repository'
require './lib/sales_engine'

class MerchantRepositoryTest < MiniTest::Test
  attr_reader :mr
              :engine

  def setup
    @engine = SalesEngine.new
    @mr = MerchantRepository.new(nil, @engine)
  end

  def test_find_by_name
    assert_equal 'Schroeder-Jerde', mr.find_by_name('Schroeder-Jerde').name
  end

  def test_find_by_id
    assert_equal '3', mr.find_by_id('3').id
  end

  def test_find_by_created_at
    assert_equal '2012-03-27 14:53:59 UTC', mr.find_by_created_at('2012-03-27 14:53:59 UTC').created_at
  end

  def test_find_by_updated_at
    assert_equal '2012-03-27 14:53:59 UTC', mr.find_by_updated_at('2012-03-27 14:53:59 UTC').updated_at
  end

  def test_find_all_by_name
    assert_equal 1, mr.find_all_by_name('Schroeder-Jerde').size
  end

  def find_all_by_id
    assert_equal 1, mr.find_all_by_id('1').size
  end

  def find_all_by_updated_at
    assert_equal 10, mr.find_all_updated_at('2012-03-27 14:53:59 UTC').size
  end

  def find_all_by_created_at
    assert_equal 10, mr.find_all_created_at('2012-03-27 14:53:59 UTC').size
  end

  def test_get_random_merchant_object
    results = []
    20.times {results << mr.random}
    assert results.uniq.count > 1
  end
end
