require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/customer_repository"

class CustomerRepositoryTest < MiniTest::Test
  attr_reader :cr

  def setup
    @cr = CustomerRepository.new
  end

  def test_customer_objects_are_created
    assert_equal 'Joey', cr.customer_objects.first.first_name
  end

  def test_find_by_attribute
    customer = cr.find_by_attribute(:id, '5')
    assert_equal "Sylvester", customer.first_name
  end

  def test_find_all_by_attribute
    customer = cr.find_all_by_attribute(:first_name, 'Heber')
    assert_equal 2, customer.length
  end

  def test_find_by_first_name
    customer = cr.find_by_first_name('Cecelia')
    assert_equal 'Cecelia', customer.first_name
  end

  def test_find_by_last_name
    customer = cr.find_by_last_name('Osinski')
    assert_equal "Cecelia", customer.first_name
  end

  def test_find_by_id
    customer = cr.find_by_id('3')
    assert_equal 'Mariah', customer.first_name
  end

  def test_find_by_created_at
    customer = cr.find_by_created_at('2012-03-27 14:54:09 UTC')
    assert_equal 'Joey', customer.first_name
  end

  def test_find_by_updated_at
    customer = cr.find_by_updated_at('2012-03-27 14:54:09 UTC')
    assert_equal 'Joey', customer.first_name
  end

  def test_find_all_by_first_name
    customer = cr.find_all_by_first_name('Heber')
    assert_equal 2, customer.size
  end

  def find_all_by_id
    customer = cr.find_all_by_id('1')
    assert_equal 1, customer.size
  end

  def find_all_by_updated_at
    customer = cr.find_all_updated_at('2012-03-27 14:54:09 UTC')
    assert_equal 1, customer.size
  end

  def find_all_by_created_at
    customer = cr.find_all_created_at('2012-03-27 14:54:10 UTC')
    assert_equal 1, customer.size
  end

  def test_get_random_merchant_object
    results = []
    20.times {results <<@cr.random}
    assert results.uniq.count > 1
  end
 
 end
