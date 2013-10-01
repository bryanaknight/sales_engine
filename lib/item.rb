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
    invoice_item_repo = repo.engine.invoice_item_repository
    invoice_item_repo.find_all_by_item_id(self.id)
  end

  def merchant
    merchant_repo = repo.engine.merchant_repository
    merchant_repo.find_by_id(self.merchant_id)
  end

  def merchant_unit_price
    invoice_repo = repo.engine.invoice_repository
    successful_mt = invoice_repo.successful_merchant_transactions
    successful_mt.map do |mt|
      mt.find_by_unit_price
    end
  end
end
