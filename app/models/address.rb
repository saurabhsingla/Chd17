class Address < ActiveRecord::Base
  attr_accessible :addressLine1, :addressLine2, :addressLine3, :city, :state, :pinCode, 
  :contactNumber1, :contactNumber2, :contactNumber3
end
