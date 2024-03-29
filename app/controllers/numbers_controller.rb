class NumbersController < ApplicationController
  # GET /numbers
  # GET /numbers.json
  def index
    @numbers = Number.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @numbers }
    end
  end

  def view
    @game_id = params[:game_id]
    yet_nums = Number.get_yet_nums(@game_id)
    @num = Number.get_new_number(yet_nums, @game_id) if yet_nums.size < 75
  end

  # GET /numbers/1
  # GET /numbers/1.json
  def show
    @number = Number.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @number }
    end
  end

  # GET /numbers/new
  # GET /numbers/new.json
  def new
    @number = Number.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @number }
    end
  end

  # GET /numbers/1/edit
  def edit
    @number = Number.find(params[:id])
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(params[:number])

    respond_to do |format|
      if @number.save
        format.html { redirect_to @number, notice: 'Number was successfully created.' }
        format.json { render json: @number, status: :created, location: @number }
      else
        format.html { render action: "new" }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /numbers/1
  # PUT /numbers/1.json
  def update
    @number = Number.find(params[:id])

    respond_to do |format|
      if @number.update_attributes(params[:number])
        format.html { redirect_to @number, notice: 'Number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbers/1
  # DELETE /numbers/1.json
  def destroy
    @number = Number.find(params[:id])
    @number.destroy

    respond_to do |format|
      format.html { redirect_to numbers_url }
      format.json { head :no_content }
    end
  end
end
