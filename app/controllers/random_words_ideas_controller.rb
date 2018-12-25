# frozen_string_literal: true

class RandomWordsIdeasController < ApplicationController
  def index
    word1 = params[:word1]
    word2 = params[:word2]
    @ideas = RandomWordsIdea.where(word1_id: [word1, word2])
                            .where(word2_id: [word1, word2])
    @word1 = Word.find(word1)
    @word2 = Word.find(word2)
  end

  def create
    @sea = Sea.new(sea_params)
    @sea.user_id = current_user.id
    redirect_to words_path unless @sea.save

    @random = RandomWordsIdea.new
    @random.word1_id = params[:sea][:word1]
    @random.word2_id = params[:sea][:word2]
    @random.sea_id = @sea.id
    if @random.save
      redirect_to random_words_ideas_path(word1: @random.word1_id, word2: @random.word2_id)
    else
      redirect_to words_path
    end
  end

  private

  def sea_params
    params.require(:sea).permit(:body)
  end
end
