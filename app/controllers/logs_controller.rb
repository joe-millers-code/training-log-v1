class LogsController < ApplicationController
   before_action :find_log, only: [:show, :edit, :update, :destroy]
   helper_method :sort_column, :sort_direction

   def show
   end

   def edit
   end

   def index
        @logs = Log.order(sort_column + " " + sort_direction)
        #@logs = current_user.logs.all when the user model comes in
    end

    def new
        @log = Log.new
    end

    def create
        @log = Log.create(log_params)
        # @log.user_id = current_user.id
        redirect_to @log
    end

    def update 
        @log.update(log_params)
        redirect_to @log
    end

    def destroy
        @log.destroy
        redirect_to @log
    end


    private

    def log_params
        params.require(:log).permit(:title, :date, :session_type, :duration, :intensity, :description)
    end

    def find_log
        @log = Log.find(params[:id])
    end

    def sort_column
        Log.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end
