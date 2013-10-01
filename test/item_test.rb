require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/item"
require "csv"
require './lib/item_repository'

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

  # def test_it_gets_item_id
  #   #skip
  #   assert_equal item_attributes[:id], item.id
  # end

  # def test_it_gets_name
  #   #skip
  #   assert_equal item_attributes[:name], item.name
  # end

  # def test_it_gets_description
  #   #skip
  #   assert_equal item_attributes[:description], item.description
  # end

  # def test_it_gets_unit_price
  #   #skip
  #   assert_equal item_attributes[:unit_price], item.unit_price
  # end

  # def test_it_gets_merchant_id
  #   #skip
  #   assert_equal item_attributes[:merchant_id], item.merchant_id
  # end

  # def test_it_gets_created_at
  #   #skip
  #   assert_equal item_attributes[:created_at], item.created_at
  # end

  # def test_it_gets_updated_at
  #   #skip
  #   assert_equal item_attributes[:updated_at], item.updated_at
  # end
end
