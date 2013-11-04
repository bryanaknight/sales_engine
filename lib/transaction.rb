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

  def invoice
    invoice_repo = repo.engine.invoice_repository
    invoice_repo.find_by_id(self.invoice_id)
  end

  def successful?
    result == 'success'
  end

  def failed?
    result == 'failed'
  end

end
