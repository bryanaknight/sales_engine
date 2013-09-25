require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/item_repository"

class ItemRepositoryTest < MiniTest::Test
  def setup
    @item = ItemRepository.new
  end

  def test_item_objects_are_created
    item        = ItemRepository.new
    mr_method = item.item_objects
    assert_equal 'Item Qui Esse', mr_method.first.name
  end

  def test_find_by_attribute
    item = ItemRepository.new
    mr_method = item.find_by_attribute(:id, '5')
    assert_equal "Item Expedita Aliquam", mr_method.name
  end

  def test_find_all_by_attribute
    item = ItemRepository.new
    mr_method = item.find_all_by_attribute(:merchant_id, '1')
    assert_equal 10, mr_method.length
  end

  def test_get_random_item_object
    item                  = ItemRepository.new
    random_item_one = item.random_item_object
    random_item_two = item.random_item_object
    refute_equal random_item_one, random_item_two
  end
end
