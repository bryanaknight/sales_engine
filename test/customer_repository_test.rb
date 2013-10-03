require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository'
require './lib/sales_engine'

class CustomerRepositoryTest < MiniTest::Test
  attr_reader :cr
              :engine

  def setup
    @engine = SalesEngine.new
    @cr = CustomerRepository.new(nil, @engine)
  end

  def test_customer_objects_are_created
    assert_equal 'Joey', cr.all.first.first_name
  end

  def test_find_by_first_name
    assert_equal 'Cecelia', cr.find_by_first_name('Cecelia').first_name
  end

  def test_find_by_last_name
    assert_equal "Osinski", cr.find_by_last_name('Osinski').last_name
  end

  def test_find_by_id
    assert_equal 'Mariah', cr.find_by_id('3').first_name
  end

  def test_find_by_created_at
    assert_equal 'Joey', cr.find_by_created_at('2012-03-27 14:54:09 UTC').first_name
  end

  def test_find_by_updated_at
    assert_equal 'Joey', cr.find_by_updated_at('2012-03-27 14:54:09 UTC').first_name
  end

  def test_find_all_by_first_name
    assert_equal 1, cr.find_all_by_first_name('Heber').size
  end

  def find_all_by_id
    assert_equal 1, cr.find_all_by_id('1').size
  end

  def find_all_by_updated_at
    assert_equal 1, cr.find_all_updated_at('2012-03-27 14:54:09 UTC').size
  end

  def find_all_by_created_at
    assert_equal 1, cr.find_all_created_at('2012-03-27 14:54:10 UTC').size
  end

  def test_get_random_merchant_object
    results = []
    20.times {results << cr.random}
    assert results.uniq.count > 1
  end

 end
