gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant"
require "csv"
require './lib/merchant_repository'

class MerchantTest < Minitest::Test
  attr_reader :repo

  def contents
    contents = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_attributes
    contents.each do |row|
      id         = row[:id]
      name       = row[:name]
      created_at = row[:created_at]
      updated_at = row[:updated_at]
    end

  end

  def merchant
    @merchant ||= Merchant.new(merchant_attributes, repo)
  end

  def test_merchant_id
    #skip
    assert_equal merchant_attributes[:id], merchant.id
  end

  def test_merchant_name
    #skip
    assert_equal merchant_attributes[:name], merchant.name
  end

  def test_merchant_created_at
    #skip
    assert_equal merchant_attributes[:created_at], merchant.created_at
  end

  def test_merchant_updated_at
    #skip
    assert_equal merchant_attributes[:updated_at], merchant.updated_at
  end

end

