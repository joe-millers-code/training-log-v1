class LogsController < ApplicationController
   before_action :find_log, only: [:show, :edit, :update, :destroy]

    def index
        @logs = Log.all
    end

    def show
    end

    def new
        @log = Log.new
    end

    def create
        @log = Log.create(log_params)
        redirect_to @log
    end

    def edit
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

end
