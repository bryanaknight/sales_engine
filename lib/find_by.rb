 ##Find a way to abstract the find methods
 ##it is way too repetitive
def find_by_merchant_name(name)
  merchant_objects.find do |merchants|
    merchants.merchant_name == name
  end
end

def find_by_merchant_id(id)
  merchant_objects.find do |merchants|
    merchants.merchant_id == id
  end
end

def find_by_merchant_created_at(created_at)
  merchant_objects.find do |merchants|
    merchants.merchant_created_at == created_at
  end
end

def find_by_merchant_updated_at(updated_at)
  merchant_objects.find do |merchants|
    merchants.merchant_updated_at == updated_at
  end
end

#Find all man!!!
#Need to abstract this bull shit!!!!
def find_all_merchant_name(name)
  merchant_objects.select do |merchants|
    merchants.merchant_name == name
  end
end

def find_all_merchant_id(id)
  merchant_objects.select do |merchants|
    merchants.merchant_id == id
  end
end

def find_all_merchant_created_at(created_at)
  merchant_objects.select do |merchants|
    merchants.merchant_created_at == created_at
  end
end

def find_all_merchant_updated_at(updated_at)
  merchant_objects.select do |merchants|
    merchants.merchant_updated_at == updated_at
  end
end
