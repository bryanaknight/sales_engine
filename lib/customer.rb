require './lib/sales_engine'

class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repo

  def initialize(attribute, repo)
    @id          = attribute[:id]
    @first_name  = attribute[:first_name]
    @last_name   = attribute[:last_name]
    @created_at  = attribute[:created_at]
    @updated_at  = attribute[:updated_at]
    @repo        = repo
  end

end
