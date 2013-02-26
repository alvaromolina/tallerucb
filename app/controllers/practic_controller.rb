class PracticController < ApplicationController
  require 'rag/lib/auto_grader.rb'

  def show
    @exercises = Exercise.find(:all,
                              :joins => "LEFT JOIN solutions ON solutions.exercise_id = exercises.id and solutions.user_id = "+current_user.id.to_s,
                              :conditions => ['practice_id = ?', params[:id]],
                              :order => "number",
                              :select => "exercises.*, solutions.points, solutions.result"
                              )
            puts YAML::dump(@exercises)
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
  
  def grade(exercise_num, solutions_id, solutions_file_file_name)
      root_dir = Rails.root.to_s
      Dir.chdir(root_dir+"/lib/rag/")
      spec = '../ejercicios/'+exercise_num.to_s+'.rb'
      sub = root_dir+'/public/assets/solutions/'+solutions_id.to_s+'/original/'+solutions_file_file_name
      output = `ruby grade #{sub} #{spec}`
      score, comments = parse_grade(output)
      puts YAML::dump(output)
      return [comments, score]
  end
  def save
    
    @exercise = Exercise.find(params[:solution][:exercise_id])

    if (params[:solution][:id]!="")
      @solution = Solution.find(params[:solution][:id])
      
      if @solution.update_attributes(params[:solution])
        
        params[:solution][:result], params[:solution][:points] = grade(@exercise.number, @solution.id, @solution.file_file_name)
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
        @solution.result, @solution.points = grade(@exercise.number, @solution.id, @solution.file_file_name)
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
    
  end
  
  
  def solve
    @current_user = current_user
    @solution = Solution.find(:first,
                              :conditions => ['exercise_id = ? and user_id = ?', params[:id],current_user.id]
                            )
    unless @solution
      @solution = Solution.new
    end
    @exercise = Exercise.find(params[:id])
  end

  def index
    @practices = Practice.find(:all,
                              :joins =>
                              "LEFT JOIN exercises ON exercises.practice_id = practices.id" +
                              " LEFT JOIN solutions ON solutions.exercise_id = exercises.id and solutions.user_id = " +
                              current_user.id.to_s,
                              :select => "practices.*, sum(solutions.points) AS points",
                              :group => "practices.id"
                              )
    

                               
  end
end
