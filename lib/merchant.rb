require './lib/merchant_repository'

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

  def revenue
     sum = 0
    paid_invoices.each do |paid_invoice|
      sum += paid_invoice.total
    end
    return sum
  end

  end
end
