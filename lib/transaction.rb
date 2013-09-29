require './lib/transaction_repository'

class Transaction
attr_reader   :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at,
              :repo

  def initialize(attribute, repo)
    @id                          = attribute[:id]
    @invoice_id                  = attribute[:invoice_id]
    @credit_card_number          = attribute[:credit_card_number]
    @credit_card_expiration_date = attribute[:credit_card_expiration_date]
    @result                      = attribute[:result]
    @created_at                  = attribute[:created_at]
    @updated_at                  = attribute[:updated_at]
    @repo                        = repo
  end

  #def transactions
  #  transaction_repo = engine.transaction_repository
  #  transaction_repo.find_all_by_transaction_id(id)
  #end
#
  #def invoice_items
  #  invoic_item_repo = engine.invoice_item_repository
  #  invoic_item_repo.find_all_by_invoice_item_id(id)
  #end
#
  #def items
  #  item_repo = engine.invoice_item_repository
  #  item_repo.find_all_by_invoice_item_id(id)
  #end
#
  #def customers
  #  customer_repo = engine.customer_repository
  #  customer_repo.find_all_by_customer_id(id)
  #end
#
  #def merchants
  #  merchant_repo = engine.merchant_repository
  #  merchant_repo.find_all_by_merchant_id(id)
  #end
end
