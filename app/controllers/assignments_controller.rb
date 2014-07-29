class AssignmentsController < ApplicationController

def new
  @assignment = Assignment.new
  @person = Person.find(params[:person_id])
end

  def create
    @person = Person.find(params[:person_id])
    @assignment = @person.assignments.new(params.require(:assignment).permit(:location_id, :role))
    if @assignment.save
    redirect_to person_path(@person)
    else
      flash[:errors] = "This Assignment not be created"
      render :new
  end
  end

  def edit
    @person = Person.find(params[:person_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update_attributes(params.require(:assignment).permit(:location_id, :role))
    if @assignment.save
      redirect_to person_path(params[:person_id])
    else
      flash[:errors] = "This Assignment not be created"
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to person_path(params[:person_id])
  end
end