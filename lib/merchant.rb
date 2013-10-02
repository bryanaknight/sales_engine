require './lib/merchant_repository'
require 'pry'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo

  def initialize (attribute, repo)
    @id         = attribute[:id]
    @name       = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
    @repo       = repo
  end

  def items
    item_repo = repo.engine.item_repository
    item_repo.find_all_by_merchant_id(self.id)
  end

  def successful_invoice_items
    paid_invoices.map do |paid_invoice|
      paid_invoice.invoice_items
    end
  end

  def quantity
    successful_invoice_items.map do |invoice_items|
      invoice_items.map do |invoice_item|
        invoice_item.quantity.to_i #quantity for one merchant!!!
      end.reduce(0, :+)
    end
  end

  def invoices
   invoice_repo = repo.engine.invoice_repository
   invoice_repo.find_all_by_merchant_id(self.id)
  end

  def paid_invoices
    invoices.select do |inv|
      inv.paid?
    end
  end

  def revenue(date = nil)
    if date.nil?
      estimate_revenue(paid_invoices)
    else
      estimate_revenue(paid_invoices_by_date(date))
    end
  end

  private

  def estimate_revenue(invoices)
    invoices.collect do |invoice|
      invoice.total
    end.reduce(0, :+)
  end

  def paid_invoices_by_date(date)
    paid_invoices.select { |paid_invoice| paid_invoice.created_at == date }
  end


end
