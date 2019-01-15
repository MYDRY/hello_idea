# frozen_string_literal: true

class RandomWordsIdeasController < ApplicationController
  before_action :authorize, only: %i[index create]

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
    @word1 = Word.find(params[:sea][:word1])
    @word2 = Word.find(params[:sea][:word2])
    @sea.user_id = current_user.id
    if @sea.save
      current_user.change_point(10)
      flash[:success] = 'アイデアを投稿しました。10 ポイント獲得！！'
    else
      @ideas = RandomWordsIdea.where(word1_id: [@word1.id, @word2.id])
                              .where(word2_id: [@word1.id, @word2.id])
      render 'words/index'
      return
    end

    @random = RandomWordsIdea.new
    @random.word1 = @word1
    @random.word2 = @word2
    @random.sea_id = @sea.id
    if @random.save
      redirect_to random_words_ideas_path(word1: @random.word1, word2: @random.word2)
    else
      redirect_to words_path
    end
  end

  private

  def sea_params
    params.require(:sea).permit(:body)
  end
end
