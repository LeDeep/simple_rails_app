require 'spec_helper'

describe ProgramsController do 
  context 'routing' do 
    it {should route(:get, '/programs/new').to :action => :new}
    it {should route(:post, '/programs').to :action => :create}
    it {should route(:get, '/programs/1/edit').to :action => :edit, :id => 1}
    it {should route(:delete, '/programs/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/programs').to :action => :index}
    it {should route(:put, '/programs/1').to :action => :update, :id => 1}
  end

  context 'GET index' do 
    before {get :index}

    it {should render_template :index}
  end

  context 'GET new' do 
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do 
    context 'with valid parameters' do 
      let(:valid_attributes) {{:title => "New Program", :subtitle => "Program Number 1", :code => "RORTDD"}}
      let(:valid_parameters) {{:program => valid_attributes}}
      
      it 'creates a new program' do 
        expect {post :create, valid_parameters}.to change(Program, :count).by(1)
      end

      before {post :create, valid_parameters}

      it {should redirect_to programs_path}
    end

    context 'with invalid parameters' do 
      let(:invalid_attributes) {{:title => '', :subtitle => '', :code => ''}}
      let(:invalid_parameters) {{:program => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should render_template :new}
    end
  end

  context 'GET edit' do 
    let(:program) {FactoryGirl.create :program}
    before {get :edit, :id => program.id}

    it {should render_template :edit}
  end

  context 'PUT update' do 
    let(:program) {FactoryGirl.create :program}

    context 'with valid parameters' do 
      let(:valid_attributes) {{:title => "New Program", :subtitle => "Program Number 1", :code => "RORTDD"}}
      let(:valid_parameters) {{:id => program.id, :program => valid_attributes}}

      before {put :update, valid_parameters}

      it 'updates the program' do 
        Program.find(program.id).title.should eq valid_attributes[:title]
      end

      it {should redirect_to programs_path}
    end

    context 'with invalid parameters' do 
      let(:invalid_attributes) {{:title => '', :subtitle => '', :code => ''}}
      let(:invalid_parameters) {{:id => program.id, :program => invalid_attributes}}

      before {put :update, invalid_parameters}

      it {should render_template :edit}
    end
  end

  context 'DELETE destroy' do 
    it 'destroys a program' do 
      program = FactoryGirl.create :program
      expect {delete :destroy, {:id => program.id}}.to change(Program, :count).by(-1)
    end

    let(:program) {FactoryGirl.create :program}
    before {delete :destroy, {:id => program.id}}

    it {should redirect_to programs_path}
  end
end
