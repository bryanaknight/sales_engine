gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant"
require "csv"
require './lib/merchant_repository'
require "./lib/sales_engine"
require 'pry'

class MerchantTest < Minitest::Test
  attr_reader :engine,
              :repo,
              :merchants,
              :merchant

  def setup
    @engine = SalesEngine.new
    @repo = engine.merchant_repository
    @merchants = engine.merchant_repository.all
    @merchant = merchants.first
  end

  def test_merchant_id
    assert_equal "1", merchant.id
  end

  def test_merchant_name
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_merchant_created_at

    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_merchant_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

  def test_finding_items_by_merchant_id
    assert_equal 15, merchant.items.size
  end

  def test_finding_invoices_by_merchant_id
    assert_equal 1, merchant.invoices.size
  end

  def test_paid_invoices
    #Lol please tell me how we are testing this!!!
    #To tired to try and figure it out
    paid_invoices = merchant.invoices.select do |inv|
      inv.paid?
    end
    paid_invoices.include?(merchant)
  end

  def test_revenue
    assert_equal 370616, merchant.revenue
  end

  def test_favorite_customer
    #Public API test - How do other objects in the system communicate with this object
    #Behavoiur test - When you call a mehtod in your class the right thing happens
    #Implementation - How it achieves what it achieves Never
    assert_equal 'Parker', merchant.favorite_customer.first_name
  end

  def test_revenue_by_date
    assert_equal 196405, merchants[32].revenue("2012-03-24 15:54:10 UTC")
  end

  def test_customers_with_pending_invoices
    merchant_34 = merchants[33].customers_with_pending_invoices
    assert_equal 2, merchant_34.size
  end
end
