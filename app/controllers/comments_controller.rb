class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_comment_user, only: [:edit, :update, :destroy]

    # return all the comments or just the comments for a specific pokemon
    def index
        # if there is a pokemon id in the params...
        if params[:pokemon_id] && @pokemon = Pokemon.find_by_id(params[:pokemon_id]) #if there is a pokemon id then it is nested and if we can find pokemon with that ID.
          # ... return that pokemon's comments  
          @comments = @pokemon.comments
        else # there is no pokemon id in the params
            # return all the comments in the database (for any pokemon)
            @comments = Comment.all("created_at DESC")
        end
    end

    def new
        #if it is nested and when we find the post
        if params[:pokemon_id] && @pokemon = Pokemon.find_by_id(params[:pokemon_id]) #if there is a pokemon id then it is nested and if we can find pokemon with that ID.
           @comment = @pokemon.comments.build
        else
            @error ="That Pokemon doesn't exist" if params[:pokemon_id]
            @comment = Comment.new 
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          redirect_to pokemon_path(@comment.pokemon)
        else
          render :new
        end
    end

    def show 
    end

    def edit
    
    end

    def update    
        if @comment.update(comment_params)
          redirect_to pokemon_path(@comment.pokemon)
        else
          render :edit
        end
      end

      def destroy
        @comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to pokemon_path(@comment.pokemon)
	end

  

    private

  def comment_params
    params.require(:comment).permit(:content, :pokemon_id)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    if !@comment
      flash[:message] = "Comment was not found"
      redirect_to pokemons_path
    end
  end

  def redirect_if_not_comment_user
    redirect_to pokemons_path if @comment.user != current_user
    flash[:message] = "You do not have permission to change this entry"
 end

end


