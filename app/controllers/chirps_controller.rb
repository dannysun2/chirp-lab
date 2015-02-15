class ChirpsController < ApplicationController

   before_action :authenticate_user!

   def index
      @chirp = Chirp.new
      @users = User.all
      @timeline = Chirp.timeline(@current_user).page params[:page]
   end

   def create
      @chirp = Chirp.new params.require(:chirp).permit(:message)
      @chirp.user = @current_user #sets the current user

      if @chirp.save
         redirect_to root_path, notice: "Chirped!"
      else
         render :new
      end
   end

end
