class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.keys.include?(char.upcase)}
  end

  def self.random(size)
    code = []
    while code.length < size
      code << POSSIBLE_PEGS.keys.sample
    end
    Code.new(code)
  end

  def self.from_string(peg_str)
    Code.new(peg_str.split(""))
  end

  attr_reader :pegs

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "The pegs you provided are not valid; use only R, G, B, Y in the format RGBY"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index { |ele, idx| count += 1 if self[idx] == ele}
    count
  end

  def num_near_matches(guess)
    raw_sum = 0
    guess_hash = Hash.new(0)
    answer_hash = Hash.new(0)
    guess.pegs.each { |peg| guess_hash[peg] += 1}
    self.pegs.each { |peg| answer_hash[peg] += 1}
    guess_hash.each { |peg, count| raw_sum += [guess_hash[peg], answer_hash[peg]].min}
    raw_sum - self.num_exact_matches(guess)
  end

  def ==(code_inst)
    code_inst.pegs == self.pegs
  end
end
