# frozen_string_literal: true

class WordsController < ApplicationController
  before_action :admin_user, only: %i[index new create destroy]

  def index
    random_words = Word.order('RANDOM()').limit(2)
    @word1 = random_words[0]
    @word2 = random_words[1]
    @sea = Sea.new
    @ideas = RandomWordsIdea.where(word1_id: [@word1.id, @word2.id])
                            .where(word2_id: [@word1.id, @word2.id])
  end

  def new
    @word = Word.new
    @words = Word.all
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = '単語追加しました'
      redirect_to words_path
    else
      @words = Word.all
      render :new
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    flash[:success] = '単語を削除しました'
    redirect_to new_word_path
  end

  private

  def word_params
    params.require(:word).permit(:word)
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
