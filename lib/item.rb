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

  def not_paid_items?
    invoice_items.map do |inv_item|
      inv_item.not_paid_invoice_item?
    end
  end

  def revenue
    unless not_paid_items?
      sum = 0
      invoice_items.each do |item|
        sum += item.price
      end
      return sum
    else
      0
    end
  end

  private

  def estimate_revenue(invoices)
    invoices.collect do |invoice|
      invoice.total
    end.reduce(0, :+)
  end

end
