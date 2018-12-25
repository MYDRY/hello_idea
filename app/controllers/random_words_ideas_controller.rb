class RandomWordsIdeasController < ApplicationController
  def create
    @sea = Sea.new(sea_params)
    @sea.user_id = current_user.id
    unless @sea.save
      redirect_to root_path
    end

    @random = RandomWordsIdea.new
    @random.word1_id = params[:sea][:word1]
    @random.word2_id = params[:sea][:word2]
    @random.sea_id = @sea.id
    if @random.save
      redirect_to words_path
    else
      redirect_to root_path #仮
    end
  end

  private

  def sea_params
    params.require(:sea).permit(:body)
  end
end
