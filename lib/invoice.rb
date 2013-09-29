require './lib/invoice_repository'

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
    @created_at  = attribute[:created_at]
    @updated_at  = attribute[:updated_at]
    @repo        = repo
  end

  def transactions(value)
    trans_repo = @repo.engine.transaction_repository
    trans_repo.find_all_by_invoice_id(value)
    #returns a collection of associated transaction instances
  end

  def invoice_items(value)
    invoice_item_repo = @repo.engine.invoice_item_repository
    invoice_item_repo.find_all_by_invoice_id(value)
  end

end
