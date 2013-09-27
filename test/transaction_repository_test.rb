require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/transaction_repository"

class TransactionRepositoryTest < MiniTest::Test
  attr_reader :tr

  def setup
    @tr = TransactionRepository.new
  end

  def test_transaction_objects_are_created
    assert_equal '1', tr.transaction_objects.first.id
  end

  def test_find_by_attribute
    transaction = tr.find_by_attribute(:id, '5')
    assert_equal "6", transaction.invoice_id
  end

  def test_find_all_by_attribute
    transaction = tr.find_all_by_attribute(:result, 'success')
    assert_equal 10, transaction.length
  end

  def test_find_by_id
    transaction = tr.find_by_id('1')
    assert_equal '1', transaction.invoice_id
  end

  def test_find_by_invoice_id
    transaction = tr.find_by_invoice_id('4')
    assert_equal "3", transaction.id
  end

  def test_find_by_credit_card_number
    transaction = tr.find_by_credit_card_number('4.65441E+15')
    assert_equal '1', transaction.id
  end

  #need to change code so accepts credit_card_exp that is blank
  def test_find_by_credit_card_expiration_date
    transaction = tr.find_by_credit_card_expiration_date('4/4/14')
    assert_equal '1', transaction.id
  end

  def test_find_by_result
    transaction = tr.find_by_result('success')
    assert_equal '1', transaction.id
  end

  def test_find_by_created_at
    transaction = tr.find_by_created_at('2012-03-27 14:54:09 UTC')
    assert_equal '1', transaction.id
  end

   def test_find_by_updated_at
    transaction = tr.find_by_updated_at('2012-03-27 14:54:09 UTC')
    assert_equal '1', transaction.id
  end

  def test_find_all_by_id
    transaction = tr.find_all_by_id('1')
    assert_equal 1, transaction.size
  end

  def find_all_by_invoice_id
    transaction = tr.find_all_by_invoice_id('1')
    assert_equal 1, transaction.size
  end

  def find_all_by_credit_card_number
    transaction = tr.find_all_by_credit_card_number('4.84452E+15')
    assert_equal 1, transaction.size
  end

  def find_all_by_credit_card_expiration
    transaction = tr.find_all_by_credit_card_expiration('4/4/14')
    assert_equal 1, transaction.size
  end

  def find_all_by_created_at
    transaction = tr.find_all_by_created_at('2012-03-27 14:54:09 UTC')
    assert_equal 1, transaction.size
  end

  def find_all_by_updated_at
    transaction = tr.find_all_by_updated_at('2012-03-27 14:54:09 UTC')
    assert_equal 1, transaction.size
  end

  def test_get_random_merchant_object
    results = []
    20.times {results <<@tr.random}
    assert results.uniq.count > 1
  end
 
 end
