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

  def transactions
    trans_repo = @repo.engine.transaction_repository
    trans_repo.find_all_by_invoice_id(self.id)
    #returns a collection of associated transaction instances
  end

  def invoice_items
    invoice_item_repo = @repo.engine.invoice_item_repository
    invoice_item_repo.find_all_by_invoice_id(self.id)
    #invoice_items returns a collection of associated InvoiceItem instances
  end

  # def items(value)
  #   invoice_ids = @repo.engine.invoice_item_repository.find_all_by_invoice_id('1')
  #   #item ids << invoice item ids << invoices
  #   #items returns a collection of associated Items by way of InvoiceItem objects
  # end

end
