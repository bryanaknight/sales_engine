class SalesEngine
  attr_reader :invoice_repository, :item_repository, :merchant_repository,
  :customer_repository, :invoice_item_repository, :transaction_repository

  def initialize
    @invoice_repository      = InvoiceRepository.new(self)                           
    @item_repository         = ItemRepository.new(self)                                             
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @customer_repository     = CustomerRepository.new(self)
    @transaction_repository  = TransactionRepository.new(self)
    @merchant_repository     = MerchantRepository.new(self)                 
  end


end
