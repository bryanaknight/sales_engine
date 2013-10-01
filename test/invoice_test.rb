require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice"
require "csv"
require './lib/invoice_repository'

class InvoiceTest < MiniTest::Test
  attr_reader :engine,
              :repo,
              :invoices,
              :invoice

  def setup
    @engine = SalesEngine.new
    @repo = engine.invoice_repository
    @invoices = engine.invoice_repository.all
    @invoice = invoices.first
  end

  def test_it_gets_item_id
    assert_equal '1', invoice.id
  end

  def test_it_gets_customer_id
    assert_equal '1', invoice.customer_id
  end

  def test_it_gets_status
    assert_equal 'shipped', invoice.status
  end

  def test_it_gets_merchant_id
    assert_equal '26', invoice.merchant_id
  end

  def test_it_gets_created_at
    assert_equal '2012-03-25 09:54:09 UTC', invoice.created_at
  end

  def test_it_gets_updated_at
    assert_equal '2012-03-25 09:54:09 UTC', invoice.updated_at
  end

  #def test_finds_transactions_related_to_invoices
  #  assert_equal 1, invoice.transactions.size
  #end
#
  #def test_finds_invoice_items_related_to_invoices
  #  assert_equal 8, invoice.invoice_items('1').size
  #end

end
