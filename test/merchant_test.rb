gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant"
require "csv"
require './lib/merchant_repository'
require "./lib/sales_engine"

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
    assert_equal 10, merchant.items.size
  end

  def test_finding_invoices_by_merchant_id
    assert_equal 0, merchant.invoices.size
  end
end
