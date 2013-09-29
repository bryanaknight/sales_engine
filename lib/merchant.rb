require './lib/merchant_repository'

class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at
              :repo

  def initialize (attribute, repo)
    @id         = attribute[:id]
    @name       = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
    @repo       = repo
  end

  def items(value)
    item_repo = @repo.engine.item_repository
    item_repo.find_all_by_merchant_id(value)
  end

  def invoices(value)
   invoice_repo = @repo.engine.invoice_repository
   invoice_repo.find_all_by_merchant_id(value)
  end

end
