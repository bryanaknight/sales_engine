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

  #def invoice
  #  repo.engine.invoice.find_by_all_id(id)
  #end

end
