require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_repository"
#id,customer_id,merchant_id,status,created_at,updated_at
class InvoiceRepositoryTest < MiniTest::Test

  def test_invoice_objects_are_created
    invoices = InvoiceRepository.new.invoice_objects
    assert_equal '26', invoices.first.merchant_id
  end

  def test_find_by_attribute
    inv = InvoiceRepository.new
    inv_method = inv.find_by_attribute(:id, '5')
    assert_equal "shipped", inv_method.status
  end

  def test_find_all_by_attribute
    inv = InvoiceRepository.new
    inv_method = inv.find_all_by_attribute(:customer_id, '1')
    assert_equal 8, inv_method.length
  end

  def test_get_random_invoice_object
    inv = InvoiceRepository.new
    results = []
    12.times{ results << inv.random_invoice_object }
    assert results.uniq.count > 1
  end
end
