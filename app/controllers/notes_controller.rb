class NotesController < ApplicationController
	before_action :users, only: [:index, :show, :edit, :update, :destroy]
	before_action :notes, only: [:index, :show, :edit, :update, :destroy]
	before_action :note, only: [:show, :edit, :update, :destroy]
	respond_to :html, :js

  def index

  end

  def show
  	
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = current_user.notes.create(note_params)
  end

  def edit

  end

  def update
  	@note.update_attributes(note_params)
  end

  def destroy
  	@note.destroy
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end

    def note
      @note = current_user.notes.find(params[:id])
    end

    def notes
    	@notes = current_user.notes.all
    end 

    def users
    	@users = User.all
    end 
end
