class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repo

  def initialize(attribute, repo)
    @id          = attribute[:id]
    @customer_id = attribute[:customer_id]
    @merchant_id = attribute[:merchant_id]
    @status      = attribute[:status]
    @created_at  = DateTime.parse(attribute[:created_at]).strftime("%Y-%m-%d")
    @updated_at  = DateTime.parse(attribute[:updated_at]).strftime("%Y-%m-%d")
    @repo        = repo
  end

  def transactions
    transaction_repo = repo.engine.transaction_repository
    transaction_repo.find_all_by_invoice_id(self.id)
  end

  def customer
    customer_repo = repo.engine.customer_repository
    customer_repo.find_by_id(self.customer_id)
  end

  def merchant
    merchant_repo = repo.engine.merchant_repository
    merchant_repo.find_by_id(self.merchant_id)
  end

  def invoice_items
    invoice_items_repo = repo.engine.invoice_item_repository
    invoice_items_repo.find_all_by_invoice_id(self.id)
  end

  def items
    invoice_items.map do |invoice_item|
      invoice_item.item
    end
  end

  def successful_transactions
    transactions.select do |trans|
      trans.successful?
    end
  end

  def not_paid?
    not successful_transactions.any?
  end

  def paid?
    not successful_transactions.empty?
  end

  def total
    invoice_items.map do |item|
       item.price
    end.inject(0, :+)
  end

end
