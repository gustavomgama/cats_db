class CatsController < ApplicationController
  before_action :set_id, only: [ :show, :edit, :update, :destroy ]
  # protect_from_forgery with: :null_session

  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end
  
  def create
    @cat = Cat.new cat_params
    if @cat.save
      redirect_to @cat, notice: "Cat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @cat.update cat_params
      redirect_to @cat, notice: "Cat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy
    redirect_to root_path, notice: "Cat was successfully destroyed."
  end

  private

    def set_id
      @cat = Cat.find params[:id]
    end

    def cat_params
      params.require(:cat).permit(:name, :age, :weight, :eye_color)
    end 
end
