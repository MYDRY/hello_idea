class WordsController < ApplicationController
  def index
    @words = Word.all
    random_words = Word.order("RANDOM()").limit(2)
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

  private

  def word_params
    params.require(:word).permit(:word)
  end
end
