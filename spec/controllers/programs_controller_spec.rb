require 'spec_helper'

describe ProgramsController do 
  context 'routing' do 
    it {should route(:get, '/programs/new').to :action => :new}
    it {should route(:post, '/programs').to :action => :create}
    it {should route(:get, '/programs/1/edit').to :action => :edit, :id => 1}
    it {should route(:delete, '/programs/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/programs').to :action => :index}
  end
end