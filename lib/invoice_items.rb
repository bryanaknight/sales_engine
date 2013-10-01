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

  def invoice
   invoice_repo = repo.engine.invoice_repository
   invoice_repo.find_by_id(self.invoice_id)
  end

  def item
    items_repo = repo.engine.item_repository
    items_repo.find_by_id(self.item_id)
  end

  def price
    unit_price * quantity
  end

end
