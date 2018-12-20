# frozen_string_literal: true

class WordsController < ApplicationController
  before_action :admin_user, only: :destroy

  def index
    @words = Word.all
    random_words = Word.order('RANDOM()').limit(2)
    @word1 = random_words[0]
    @word2 = random_words[1]
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to words_path
    else
      render 'new'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    flash[:success] = '単語を削除しました'
    redirect_to words_path
  end

  private

  def word_params
    params.require(:word).permit(:word)
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
