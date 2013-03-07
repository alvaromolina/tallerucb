class CommentsSolutionsController < ApplicationController
  # GET /comments_solutions
  # GET /comments_solutions.json
  def index
    @comments_solutions = CommentsSolution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments_solutions }
    end
  end

  # GET /comments_solutions/1
  # GET /comments_solutions/1.json
  def show
    @comments_solution = CommentsSolution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comments_solution }
    end
  end

  # GET /comments_solutions/new
  # GET /comments_solutions/new.json
  def new
    @comments_solution = CommentsSolution.new
    @comments_solution.solution_id = params[:solution_id];

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comments_solution }
    end
  end

  # GET /comments_solutions/1/edit
  def edit
    @comments_solution = CommentsSolution.find(params[:id])
  end

  # POST /comments_solutions
  # POST /comments_solutions.json
  def create
    @comments_solution = CommentsSolution.new(params[:comments_solution])

    respond_to do |format|
      if @comments_solution.save
        format.html { redirect_to @comments_solution, notice: 'Comments solution was successfully created.' }
        format.json { render json: @comments_solution, status: :created, location: @comments_solution }
      else
        format.html { render action: "new" }
        format.json { render json: @comments_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments_solutions/1
  # PUT /comments_solutions/1.json
  def update
    @comments_solution = CommentsSolution.find(params[:id])

    respond_to do |format|
      if @comments_solution.update_attributes(params[:comments_solution])
        format.html { redirect_to @comments_solution, notice: 'Comments solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comments_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_solutions/1
  # DELETE /comments_solutions/1.json
  def destroy
    @comments_solution = CommentsSolution.find(params[:id])
    @comments_solution.destroy

    respond_to do |format|
      format.html { redirect_to comments_solutions_url }
      format.json { head :no_content }
    end
  end
end
