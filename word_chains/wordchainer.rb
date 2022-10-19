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

  def explore_current_words
    new_current_words = []

    @current_words.each do |word|
      adjacent_words(word).each do |adj_word|
        next if @all_seen_words.include?(adj_word)
        new_current_words << adj_word
        @all_seen_words[adj_word] = word
      end
    end

    # new_current_words.each do |ncword|
      # puts ncword + ' ' + @all_seen_words[ncword]
    # end
    new_current_words
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source => nil}
    until @current_words.empty?
      @current_words = explore_current_words
    end
    build_path(target)
  end

  def build_path(target)
    path = [target]
    print "#{@all_seen_words[target]}, #{target}\n"
    while @all_seen_words[target]
      path << @all_seen_words[target]
      target = path.last
    end
    path
  end






end

w = WordChainer.new('dictionary.txt')
# p w.dictionary
p w.run('duck','ruby')
