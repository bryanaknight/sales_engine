require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/item"
require "csv"
require './lib/item_repository'
require "./lib/sales_engine"

class ItemsTest < MiniTest::Test
  attr_reader :repo,
              :engine,
              :items,
              :item

  def setup
    @engine = SalesEngine.new
    @repo = engine.item_repository
    @items = engine.item_repository.all
    @item = items.first
  end

  def test_it_gets_item_id
    #skip
    assert_equal '1', item.id
  end

  def test_it_gets_name
    #skip
    assert_equal 'Item Qui Esse', item.name
  end

  def test_it_gets_description
    #skip
    assert_equal "Nihil autem sit odio", item.description
  end

  def test_it_gets_unit_price
    #skip
    assert_equal '75107', item.unit_price
  end

  def test_it_gets_merchant_id
    #skip
    assert_equal '1', item.merchant_id
  end

  def test_it_gets_created_at
    #skip
    assert_equal '2012-03-27 14:53:59 UTC', item.created_at
  end

  def test_it_gets_updated_at
    #skip
    assert_equal '2012-03-27 14:53:59 UTC', item.updated_at
  end

  def test_finding_invoice_item_id_by_item_id
    assert_equal 1, item.invoice_items.size
  end

  def test_returns_merchant_by_item_id
    assert_equal 'Schroeder-Jerde', item.merchant.name
  end
end
