class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(params[:program])

    if @program.save
      redirect_to programs_path
    else
      render :new
    end
  end
end
