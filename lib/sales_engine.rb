require './lib/invoice_repository'
require './lib/item_repository'
require './lib/invoice_item_repository'
require './lib/customer_repository'
require './lib/transaction_repository'
require './lib/merchant_repository'

class SalesEngine
  attr_reader :invoice_repository,
              :item_repository,
              :merchant_repository,
              :customer_repository,
              :invoice_item_repository,
              :transaction_repository

  def initialize
    @invoice_repository      = InvoiceRepository.new(nil, self)
    # @invoice_repository      = InvoiceRepository.new(self)
    @item_repository         = ItemRepository.new(nil, self)
    @invoice_item_repository = InvoiceItemRepository.new(nil, self)
    @customer_repository     = CustomerRepository.new(nil, self)
    @transaction_repository  = TransactionRepository.new(nil, self)
    @merchant_repository     = MerchantRepository.new(nil, self)
  end


end
