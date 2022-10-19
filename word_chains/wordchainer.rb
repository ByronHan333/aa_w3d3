require 'Set'

class WordChainer
  attr_reader :dictionary
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp).to_set

  end

  def adjacent_words(string)
    alphabet = ('a'..'z').to_a
    res_arr = []
    string.each_char.with_index do |char, i|
      alphabet.each do |letter|
        new_word = string[0...i]+letter+string[i+1..-1]
        res_arr << new_word if @dictionary.include?(new_word) && new_word != string
      end
    end
    res_arr
  end

  def method_name
    
  end



end

w = WordChainer.new('dictionary.txt')
p w.dictionary
p w.adjacent_words('cat')
