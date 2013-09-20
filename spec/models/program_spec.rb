require 'spec_helper'

describe Program do 
  
  context 'validations' do 
    it {should validate_presence_of :title}
    it {should validate_presence_of :subtitle}
    it {should validate_presence_of :code}
    it {should allow_mass_assignment_of :title}
    it {should allow_mass_assignment_of :subtitle}
    it {should allow_mass_assignment_of :code}
    it {should ensure_length_of(:code).is_equal_to(6)}
  end
end
