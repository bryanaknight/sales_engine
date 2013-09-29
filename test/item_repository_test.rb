require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/item_repository"
require "./lib/sales_engine"

class ItemRepositoryTest < MiniTest::Test
  attr_reader :item,
              :engine

  def setup
    @engine = SalesEngine.new.startup
    @item   = ItemRepository.new(nil, @engine)
  end

  def test_find_by_id
    #skip
    assert_equal 'Item Ea Voluptatum', item.find_by_id('3').name
  end

  def test_find_by_name
    #skip
    assert_equal 'Item Qui Esse', item.find_by_name('Item Qui Esse').name
  end

  def test_find_by_description
    #skip
    assert_equal 'Nihil autem sit odio ', item.find_by_description('Nihil autem sit odio ').description
  end

  def test_find_by_merchant_id
    #skip
    assert_equal '1', item.find_by_merchant_id('1').merchant_id
  end

  def test_find_by_unit_price
    #skip
    assert_equal '75107', item.find_by_unit_price('75107').unit_price
  end

  def test_find_by_created_at
    #skip
    assert_equal '2012-03-27 14:53:59 UTC', item.find_by_created_at('2012-03-27 14:53:59 UTC').created_at
  end

  def test_find_by_updated_at
    #skip
    assert_equal '2012-03-27 14:53:59 UTC', item.find_by_updated_at('2012-03-27 14:53:59 UTC').updated_at
  end

    def test_find_all_by_id
    #skip
    assert_equal 1, item.find_all_by_id('3').size
  end

  def test_find_all_by_name
    #skip
    assert_equal 1, item.find_all_by_name('Item Qui Esse').size
  end

  def test_find_all_by_description
    #skip
    assert_equal 1, item.find_all_by_description('Nihil autem sit odio ').size
  end

  def test_find_all_by_merchant_id
    #skip
    assert_equal 10, item.find_all_by_merchant_id('1').size
  end

  def test_find_all_by_unit_price
    #skip
    assert_equal 1, item.find_all_by_unit_price('75107').size
  end

  def find_all_by_updated_at
    #skip
    assert_equal 10, item.find_all_by_updated_at('2012-03-27 14:53:59 UTC').size
  end

  def find_all_by_created_at
    #skip
    assert_equal 10, item.find_all_by_created_at('2012-03-27 14:53:59 UTC').size
  end

  def test_get_random_invoice_object
    #skip
    results = []
    12.times{ results << item.random }
    assert results.uniq.count > 1
  end
end
