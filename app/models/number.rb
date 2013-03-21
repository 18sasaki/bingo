class Number < ActiveRecord::Base
  attr_accessible :division, :game_id, :num

  def self.get_new_number(yet_nums, game_id)
    while true
      num = rand(75) + 1
      break unless yet_nums.include?(num)
    end
    number = Number.new(:num => num, :game_id => game_id)
    number.save
    return num
  end

  def self.get_yet_nums(game_id)
    yet_numbers = Number.find(:all, :conditions => ['game_id = ?', game_id], :order => 'num')
    yet_nums = []
    yet_numbers.each do |yet_number|
      yet_nums << yet_number.num
    end
    return yet_nums
  end

  def self.get_separated_num_list(yet_nums)
    b_list = []
    i_list = []
    n_list = []
    g_list = []
    o_list = []
    yet_nums.each do |num|
      case num
      when 1...15
        b_list << num
      when 16...30
        i_list << num
      when 31...45
        n_list << num
      when 46...60
        g_list << num
      when 61...75
        o_list << num
      end
    end
    ret = [b_list, i_list, n_list, g_list, o_list]
  end
end
