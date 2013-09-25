require "item"
require "pry"
require "csv"

class ItemRepository
 attr_reader :filename
  def initialize(filename = "./data/items.csv")
    @filename = filename
  end

  def read_file
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def item_objects
    items_list = read_file.collect do |item|
      Item.new(item)
    end
  end

  #This is some random shit!!!
  def random_item_object
    item_objects.sample
  end

  #Add functionality to type attribute
  #where the attribute does not have to
  #be a symbol.
  def find_by_attribute(attribute, value)
    item_objects.find do |item|
      item.send(attribute).downcase == value.downcase
    end
  end
  
  def find_all_by_attribute(attribute, value)
    item_objects.select do |item|
      item.send(attribute).downcase == value.downcase
    end
  end

end
