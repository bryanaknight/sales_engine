require './lib/sales_engine'

class InvoiceItems

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repo

  def initialize(attributes, repo)
    @id         = attributes[:id]
    @item_id    = attributes[:item_id]
    @invoice_id = attributes[:invoice_id]
    @quantity   = attributes[:quantity]
    @unit_price = attributes[:unit_price]
    @created_at = attributes[:created_at]
    @updated_at = attributes[:updated_at]
    @repo       = repo
  end

  def invoices
   invoice_repo = repo.engine.invoice_repository
   invoice_repo.find_all_by_id(self.id)
  end

  def items
    items_repo = repo.engine.item_repository
    items_repo.find_all_by_id(self.id)
  end

end
