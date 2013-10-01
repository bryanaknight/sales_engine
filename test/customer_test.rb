require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer.rb'
require 'csv'
require './lib/customer_repository'

class CustomerTest < MiniTest::Test
    attr_reader :engine,
                :repo,
                :customers,
                :customer

  def setup
    @engine = SalesEngine.new
    @repo = engine.customer_repository
    @customers = engine.customer_repository.all
    @customer = customers.first
  end

  def test_customer_id
    # skip
    assert_equal '1', customer.id
  end

  def test_customer_first_name
    # skip
    assert_equal 'Joey', customer.first_name
  end

  def test_customer_last_name
    # skip
    assert_equal 'Ondricka', customer.last_name
  end

  def test_created_at
    # skip
    assert_equal '2012-03-27 14:54:09 UTC', customer.created_at
  end

  def test_updated_at
    # skip
    assert_equal '2012-03-27 14:54:09 UTC', customer.updated_at
  end

  def test_finding_invoices_by_customer
    assert_equal 8, customer.invoices.size
  end
end
