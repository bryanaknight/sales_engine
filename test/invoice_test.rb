require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice"
require "csv"
require './lib/invoice_repository'
require 'pry'

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

  def test_finds_transactions_related_to_invoices
   assert_equal 1, invoice.transactions.size
  end

  def test_finds_invoice_items_related_to_invoices
   assert_equal 8, invoice.invoice_items.size
  end

  def test_find_customer_related_to_invoice
   assert_equal 'Joey', invoice.customer.first_name
  end

  def test_find_merchant_related_to_invoice
    assert_equal 'Balistreri, Schaefer and Kshlerin', invoice.merchant.name
  end

  def test_find_items_by_way_of_invoice_items_by_invoice_id
    assert_equal 1 , invoice.items.compact.size
  end

  def test_successful_transactions
    assert_equal 1, invoice.successful_transactions.size
  end

  def test_paid?
    assert invoice.paid?
  end

  def test_not_paid?
    refute invoice.not_paid?
  end

  def test_total
    assert_equal 2106777, invoice.total
  end

end
