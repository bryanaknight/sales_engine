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

  def invoices
   invoice_repo = repo.engine.invoice_repository
   invoice_repo.find_all_by_merchant_id(self.id)
  end

  def transactions
    invoices.map do |inv|
   end
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

  # def revenue(date = nil)
  #   if date.nil?
  #     paid_invoices.collect do |paid_invoice|
  #       paid_invoice.total
  #     end.reduce(0, :+)
  #   else
  #     paid_invoices.collect do |paid_invoice|
  #       revenue if paid_invoice.created_at == date
  #     end.reduce(0, :+)
  #   end
  # end

end
