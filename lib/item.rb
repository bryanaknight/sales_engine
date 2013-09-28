require "csv"

class Item
  attr_reader :id, :name, :description,
              :unit_price, :merchant_id,
              :created_at, :updated_at
  def initialize(attribute)
    @id          = attribute[:id]
    @name        = attribute[:name]
    @description = attribute[:description]
    @unit_price  = attribute[:unit_price]
    @merchant_id = attribute[:merchant_id]
    @created_at  = attribute[:created_at]
    @updated_at  = attribute[:updated_at]
  end

  def invoice_items
    invoic_item_repo = engine.invoice_item_repository
    invoic_item_repo.find_all_by_invoice_item_id(id)
  end

  def merchant
    merchant_repo = engine.merchant_repository
    merchant_repo.find_all_by_merchant_id(id)
  end
end
