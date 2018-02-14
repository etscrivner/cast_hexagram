require 'securerandom'
require 'iching/hexagram'

module Iching
  # Service object for performing divination of an Iching hexagram.
  class CastHexagram
    # [Integer] number of coins to be toss in producing a hexagram.
    NUM_COINS = 3
    # [Integer] value of heads in a coin toss
    HEADS_VALUE = 3
    # [Integer] value of tails in a coin toss
    TAILS_VALUE = 2
    # [Hash<Integer,Integer>] mapping of coin toss results to hexagram lines
    LINE_FOR_TOSS_SUM = {
      6 => Hexagram::OLD_YIN,
      7 => Hexagram::YOUNG_YANG,
      8 => Hexagram::YOUNG_YIN,
      9 => Hexagram::OLD_YANG
    }.freeze

    # Performs Iching hexagram divination and displays the results.
    #
    # @param question [String] the question whose answer you are seeking through
    #   the divination process.
    def run(question)
      puts "QUESTION: #{question}\n"
      puts ""

      primary_hexagram = cast_primary_hexagram

      puts "PRIMARY HEXAGRAM (\##{primary_hexagram.number}):"
      puts primary_hexagram.divination_link
      puts primary_hexagram
      puts ""

      if primary_hexagram.has_changing_lines?
        relating_hexagram = primary_hexagram.relating_hexagram
        puts "RELATING HEXAGRAM (\##{relating_hexagram.number}):"
        puts relating_hexagram.divination_link
        puts relating_hexagram
      end
    end

    # Randomly tosses coins to generate the primary hexagram.
    #
    # @return [Hexagram] hexagram resulting from the coin tosses.
    def cast_primary_hexagram
      # Determine the lines in the primary hexagram. These lines will be in
      # reverse order since the bottom line is determined first in hexagram
      # casting.
      primary_hexagram_lines = (0...Iching::Hexagram::NUM_LINES).map do
        toss_sum = (0...NUM_COINS).map do
          coin_toss
        end.reduce(:+)

        LINE_FOR_TOSS_SUM[toss_sum]
      end

      Hexagram.new(primary_hexagram_lines.reverse)
    end

    # Randomly tosses a coin returning the value corresponding to the coin toss
    # result.
    #
    # @return [Integer] heads or tails value from the coin toss
    def coin_toss
      toss = SecureRandom.random_number(2)
      if toss == 0
        HEADS_VALUE
      else
        TAILS_VALUE
      end
    end
  end
end
