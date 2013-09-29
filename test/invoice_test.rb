require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice"
require "csv"
require './lib/invoice_repository'

class InvoiceTest < MiniTest::Test
  attr_reader :repo,
              :engine,
              :invoice

  def contents
    contents = CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
  end

  def invoice_attributes
    contents.each do |attribute|
      id          = attribute[:id]
      customer_id = attribute[:customer_id]
      merchant_id = attribute[:merchant_id]
      status      = attribute[:status]
      created_at  = attribute[:created_at]
      updated_at  = attribute[:updated_at]
    end
  end

  def setup
    @engine = SalesEngine.new
    @repo = InvoiceRepository.new(nil, @engine)
    @invoice = Invoice.new(invoice_attributes, @repo)
  end

  def test_it_gets_item_id
    assert_equal invoice_attributes[:id], invoice.id
  end

  def test_it_gets_customer_id
    assert_equal invoice_attributes[:customer_id], invoice.customer_id
  end

  def test_it_gets_unit_price
    assert_equal invoice_attributes[:status], invoice.status
  end

  def test_it_gets_merchant_id
    assert_equal invoice_attributes[:merchant_id], invoice.merchant_id
  end

  def test_it_gets_created_at
    assert_equal invoice_attributes[:created_at], invoice.created_at
  end

  def test_it_gets_updated_at
    assert_equal invoice_attributes[:updated_at], invoice.updated_at
  end

  def test_finds_transactions_related_to_invoices
    assert_equal 1, invoice.transactions('1').size
  end

  def test_finds_invoice_items_related_to_invoices
    assert_equal 8, invoice.invoice_items('1').size
  end

end
