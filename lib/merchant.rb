class Merchant
  attr_reader :id, :name,
              :created_at,
              :updated_at
              :engine

  def initialize (attribute)
    @id         = attribute[:id]
    @name       = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
    @engine     = engine
  end

  def items
    item_repo = engine.item_repository
    item_repo.find_all_by_merchant_id(id)
  end

  def invoices
    invoic_repo = engine.invoice_repository
    invoic_repo.find_all_by_invoice_id(id)
  end

end
