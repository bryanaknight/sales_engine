require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant_repository"

class MerchantRepositoryTest < MiniTest::Test
  attr_reader :mr

  def setup
    @mr = MerchantRepository.new
  end

  def test_all_are_created
    assert_equal 'Schroeder-Jerde', mr.all.first.name
  end

  def test_find_by_attribute
    mr_method = mr.find_by_attribute(:id, '5')
    assert_equal "Williamson Group", mr_method.name
  end

  def test_find_all_by_attribute
    mr_method = mr.find_all_by_attribute(:name, 'williamson group')
    assert_equal 2, mr_method.length
  end

  def test_find_by_name
    merchants = mr.find_by_name('Schroeder-Jerde')
    assert_equal 'Schroeder-Jerde', merchants.name
  end

  def test_find_by_id
    merchants = mr.find_by_id('3')
    assert_equal '3', merchants.id
  end

  def test_find_by_created_at
    merchants = mr.find_by_created_at('2012-03-27 14:53:59 UTC')
    assert_equal '2012-03-27 14:53:59 UTC', merchants.created_at
  end

  def test_find_by_updated_at
    merchants = mr.find_by_updated_at('2012-03-27 14:53:59 UTC')
    assert_equal '2012-03-27 14:53:59 UTC', merchants.updated_at
  end

  def test_find_all_by_name
    merchants = mr.find_all_by_name('Schroeder-Jerde')
    assert_equal 1, merchants.size
  end

  def find_all_by_id
    merchants = mr.find_all_by_id('1')
    assert_equal 1, merchants.size
  end

  def find_all_by_updated_at
    merchants = mr.find_all_updated_at('2012-03-27 14:53:59 UTC')
    assert_equal 10, merchants.size
  end

  def find_all_by_created_at
    merchants = mr.find_all_created_at('2012-03-27 14:53:59 UTC')
    assert_equal 10, merchants.size
  end

  def test_get_random_merchant_object
    results = []
    20.times {results <<@mr.random}
    assert results.uniq.count > 1
  end
end
