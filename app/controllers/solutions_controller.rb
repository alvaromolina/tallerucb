class SolutionsController < ApplicationController
  load_and_authorize_resource

  

  # GET /solutions
  # GET /solutions.json
  def index
    @solutions = Solution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solutions }
    end
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solution }
    end
  end

  # GET /solutions/new
  # GET /solutions/new.json
  def new
    @solution = Solution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solution }
    end
  end

  # GET /solutions/1/edit
  def edit
    @solution = Solution.find(params[:id])
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = Solution.new(params[:solution])

    respond_to do |format|
      if @solution.save
        format.html { redirect_to @solution, notice: 'Solution was successfully created.' }
        format.json { render json: @solution, status: :created, location: @solution }
      else
        format.html { render action: "new" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def solve
    @current_user = current_user
    @solution = Solution.where('exercise_id = ? and user_id = ?', params[:excercise_id],current_user.id).first
    unless @solution
      @solution = Solution.new
    end
    @exercise = Exercise.find(params[:excercise_id])
    
    @comments_solutions = CommentsSolution.where('solution_id = ?', @solution.id)
  end

  def parse_grade(str)
    # Used for parsing the stdout output from running grade as a shell command
    # FIXME: This feels insecure and fragile
    puts str
    tmp = str
    score_regex = /Score out of 100:\s*(\d+(?:\.\d+)?)$/
    score = str.match(score_regex, str.rindex(score_regex))[1].to_f
    comments = str.match(/^---BEGIN rspec comments---\n#{'-'*80}\n(.*)#{'-'*80}\n---END rspec comments---$/m)[1]
    comments = comments.split("\n").map do |line|
      line.gsub(/\(FAILED - \d+\)/, "(FAILED)")
    end.join("\n")
    [score, comments]
  rescue
    puts "sss"
    puts tmp
    [0, tmp]
  end
  
  
  
  def grade(practices_num, exercise_num, solutions_id, solutions_file_file_name)
      root_dir = Rails.root.to_s
      Dir.chdir(root_dir+"/lib/rag/")
      spec = '../ejercicios/'+practices_num.to_s+exercise_num.to_s+'.rb'
      sub = root_dir+'/public/assets/solutions/'+solutions_id.to_s+'/original/'+solutions_file_file_name
      output = `ruby grade #{sub} #{spec}`
      score, comments = parse_grade(output)
      puts YAML::dump(output)
      return [comments, score]
  end
  
  
  def save
    @exercise = Exercise.find(params[:solution][:exercise_id])
    @practice = Practice.find(@exercise.practice_id)
    
    #TODO: Arreglar esta vaina
    puts Time.zone.now
    puts @practice.due_date
    if(Time.zone.now <= @practice.due_date)
      if (params[:solution][:id]!="")
        @solution = Solution.find(params[:solution][:id])
        if @solution.update_attributes(params[:solution])
          params[:solution][:result], params[:solution][:points] = grade(@practice.number,@exercise.number, @solution.id, @solution.file_file_name)
          if @solution.update_attributes(params[:solution])
            flash[:notice] = 'Solution was successfully updated.'
            redirect_to :action => "solve", :id => @solution.exercise_id
          else
            render action: "solve"
          end
        else
          render action: "solve"
        end
      else
        @solution = Solution.new(params[:solution])
        if (@solution.save)
          @solution.result, @solution.points = grade(@practice.number,@exercise.number, @solution.id, @solution.file_file_name)
          if (@solution.save)
            flash[:notice] = 'Solution was successfully created.'
            redirect_to :action => "solve", :id => @solution.exercise_id
          else
            render action: "solve"
          end
        else
          render action: "solve"
        end
      end
    else
      flash[:notice] = 'Tiempo expiro para subir soluciones'
      redirect_to :action => "solve", :id => @exercise.id
    end
    
    
  end
  
  # PUT /solutions/1
  # PUT /solutions/1.json
  def update
    @solution = Solution.find(params[:id])

    respond_to do |format|
      if @solution.update_attributes(params[:solution])
        format.html { redirect_to @solution, notice: 'Solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to solutions_url }
      format.json { head :no_content }
    end
  end
  
  
  def report
    if(params[:practice_number])
      condition = 'practices.number = '+ params[:practice_number]
    else
      condtion = ''
    end
    @users = User.find(:all,
                       :joins =>"LEFT JOIN solutions ON solutions.user_id = users.id " +
                       " LEFT JOIN exercises ON exercises.id = solutions.exercise_id " +
                       " LEFT JOIN practices ON practices.id = exercises.practice_id ",
                       :select => "users.*, practices.number as practice, count( solutions.exercise_id) sol, sum(solutions.points) points ",
                       :conditions => condition,
                       :order => "users.email, points desc, users.name",
                       :group => 'users.id')
  end
  
  def report2
    
    if(params[:user_id])
      condition = 'users.id = '+ params[:user_id].to_s + ' and practices.number = ' +  params[:practice_number]
    else
      condtion = ''
    end
    @users = User.find(:all,
                       :joins =>"LEFT JOIN solutions ON solutions.user_id = users.id "+
                       "LEFT JOIN exercises ON exercises.id = solutions.exercise_id "+
                       " LEFT JOIN practices ON practices.id = exercises.practice_id ",
                       :select => "users.*, practices.number as practice, solutions.points, solutions.id AS solutions_id, solutions.file_file_name, solutions.result, exercises.number, exercises.name AS exercise_name ",
                       :conditions => condition,
                       :order => "users.name, exercises.number")
  end
end
