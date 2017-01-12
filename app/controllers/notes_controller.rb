class NotesController < ApplicationController
	before_action :note, only: [:show, :edit, :update, :destroy]

  def index
  	@notes = current_user.notes.all
  end

  def show
  	
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
  	@note.user_id = current_user.id
  	if @note.save
  		flash[:success] = "Note created!"
  		redirect_to '/'
  	else
  		render :new
  	end 
  end

  def edit
  end

  def update
  	if @note.update(note_params)
  		redirect_to '/'
  		flash[:success] = "Note updated!"
  	else
  		render :edit
  	end
  end

  def destroy
  	if @note.destroy
  		render 'destroy'
  	else
  		render '/', notice: "Note could not be deleted"
  	end
  end

  private
    def note_params
      params.require(:note).permit(:title, :date, :body)
    end


    def note
      @note = current_user.notes.find(params[:id])
    end
end
