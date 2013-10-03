class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo

  def initialize (attribute, repo)
    @id         = attribute[:id]
    @name       = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
    @repo       = repo
  end

  def items
    item_repo = repo.engine.item_repository
    item_repo.find_all_by_merchant_id(self.id)
  end

  def invoices
   invoice_repo = repo.engine.invoice_repository
   invoice_repo.find_all_by_merchant_id(self.id)
  end

  def paid_invoices
    invoices.select do |inv|
      inv.paid?
    end
  end

  def successful_invoice_items
    paid_invoices.map do |paid_invoice|
      paid_invoice.invoice_items
    end
  end

  def quantity
    successful_invoice_items.map do |invoice_items|
      invoice_items.map do |invoice_item|
        invoice_item.quantity.to_i #quantity for one merchant!!!
      end.reduce(0, :+)
    end
  end

  def all_customers_that_paid
    paid_invoices.map do |paid|
      paid.customer
    end
  end

  def invoices_for_paid_customer
    all_customers_that_paid.map do |paid|
      paid.invoices
    end
  end

  def paid_invoices_per_customer
    invoices_for_paid_customer.map do |invoices|
      invoices.find_all do |invoice|
        invoice.paid?
      end
    end
  end

  def total_per_customer
    paid_invoices_per_customer.map do |invoices|
      invoices.count
    end
  end

  def favorite_customer
    arr = all_customers_that_paid.zip(total_per_customer)
    fav = Hash[*arr.flatten]
    fav.max_by{|k,v| v}.first
  end

  def not_paid_invoices
    invoices.select do |inv|
      inv.not_paid?
    end
  end

  def customers_with_pending_invoices
    not_paid_invoices.map do |invoice|
      invoice.customer
    end
  end

  def revenue(date = nil)
    if date.nil?
      BigDecimal(estimate_revenue(paid_invoices))
    else
      BigDecimal(estimate_revenue(paid_invoices_by_date(date)))
    end
  end

  private

  def estimate_revenue(invoices)
    invoices.collect do |invoice|
      invoice.total
    end.reduce(0, :+)
  end

  def paid_invoices_by_date(date)
    paid_invoices.select { |paid_invoice| paid_invoice.created_at == date }
    #get price from unit_prices
  end


end
