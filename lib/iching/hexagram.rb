module Iching
  # Entity object representing an Iching hexagram
  class Hexagram
    # [Array<Integer>] lines of the encapsulated hexagram
    attr_reader :lines

    # [Integer] number of lines in a hexgram
    NUM_LINES = 6
    # [Integer] represents the various line types in a hexagram
    OLD_YIN = 0
    YOUNG_YANG = 1
    YOUNG_YIN = 2
    OLD_YANG = 3
    # [Hash<Integer,String>] maping of hexagram lines to string representations
    STRING_FOR_LINE = {
      OLD_YIN => '---X---',
      YOUNG_YANG => '-------',
      YOUNG_YIN => '--- ---',
      OLD_YANG => '--( )--',
    }.freeze
    # [Hash<Integer,Integer>] mapping of changing lines to the lines they change
    #   into. Non-changing lines are simply preserved.
    CHANGING_LINE_RESULT = {
      OLD_YIN => YOUNG_YANG,
      YOUNG_YANG => YOUNG_YANG,
      YOUNG_YIN => YOUNG_YIN,
      OLD_YANG => YOUNG_YIN
    }.freeze
    # [Hash<Integer,Integer>] mapping of changing lines to lines without the
    #   changing mark.
    UNCHANGED_LINE_RESULT = {
      OLD_YIN => YOUNG_YIN,
      YOUNG_YANG => YOUNG_YANG,
      YOUNG_YIN => YOUNG_YIN,
      OLD_YANG => YOUNG_YANG
    }.freeze
    # [Array<Integer>] all changing lines
    CHANGING_LINES = [OLD_YIN, OLD_YANG].freeze

    # Default constructor
    #
    # @param 
    def initialize(hexagram_lines)
      if hexagram_lines.length != NUM_LINES
        raise ArgumentError,
              "Exactly #{NUM_LINES} lines compose a valid hexagram. You gave " \
              "a hexagram with #{hexagram_lines.count} lines"
      end

      @lines = hexagram_lines
    end

    # @return [Hexagram] relating hexagram for the current hexgram with any
    #   changing lines converted. Returns the same hexagram if there are no
    #   changing lines.
    def relating_hexagram
      relating_hexagram_lines = @lines.map do |line|
        CHANGING_LINE_RESULT[line]
      end
      Hexagram.new(relating_hexagram_lines)
    end

    # @return [Hexagram] identical hexagram to the current one, but without the
    #   changing line marks. This is used to help determine the sequence number
    #   of the current hexagram.
    def without_changing_lines
      unchanged_lines = @lines.map do |line|
        UNCHANGED_LINE_RESULT[line]
      end
      Hexagram.new(unchanged_lines)
    end

    # @return [Boolean] true if the primary hexagram has changing lines, false
    #   otherwise.
    def has_changing_lines?
      @lines.any? { |line| CHANGING_LINES.include?(line) }
    end

    # Calculates the King Wen sequence number of the current hexagram.
    #
    # @return [Integer] King Wen sequence number of the current hexagram
    def number
      Sequences::KingWen.new.calculate(self.without_changing_lines)
    end

    # @return [String] string representation of the hexagram
    def to_s
      @lines.map { |line| STRING_FOR_LINE[line] }.join("\n")
    end
  end
end
