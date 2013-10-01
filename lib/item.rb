require "./lib/item_repository"

class Item
     attr_reader :id,
                 :name,
                 :description,
                 :unit_price,
                 :merchant_id,
                 :created_at,
                 :updated_at,
                 :repo

  def initialize(attribute, repo)
    @id          = attribute[:id]
    @name        = attribute[:name]
    @description = attribute[:description]
    @unit_price  = attribute[:unit_price]
    @merchant_id = attribute[:merchant_id]
    @created_at  = attribute[:created_at]
    @updated_at  = attribute[:updated_at]
    @repo        = repo
  end

  def invoice_items
    invoice_item_repo = engine.invoice_item_repository
    invoice_item_repo.find_all_by_id(self.id)
  end
#
  #def merchant
  #  merchant_repo = engine.merchant_repository
  #  merchant_repo.find_all_by_merchant_id(id)
  #end
end
