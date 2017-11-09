require 'iching/hexagram'

module Iching
  module Sequences
    # Service object for determining the King Wen sequence number of an Iching
    # hexagram
    class KingWen
      # [Array<Integer>] eight trigrams of Iching
      QIAN = [
        Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YANG
      ].freeze
      DUI = [
        Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YANG
      ].freeze
      LI = [
        Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YANG
      ].freeze
      ZHEN = [
        Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YANG
      ].freeze
      XUN = [
        Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YIN
      ].freeze
      KAN = [
        Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YIN
      ].freeze
      GEN = [
        Iching::Hexagram::YOUNG_YANG, Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YIN
      ].freeze
      KUN = [
        Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YIN, Iching::Hexagram::YOUNG_YIN
      ].freeze
      # [Hash<Array<Integer>, Integer>] Mapping of trigram pairs of lower and upper
      #   trigrams to sequence numbers
      SEQUENCE_NUMBER = {
        [QIAN, QIAN] => 1,
        [QIAN, KUN] => 11,
        [QIAN, ZHEN] => 34,
        [QIAN, KAN] => 5,
        [QIAN, GEN] => 26,
        [QIAN, XUN] => 9,
        [QIAN, LI] => 14,
        [QIAN, DUI] => 43,
        [KUN, QIAN] => 12,
        [KUN, KUN] => 2,
        [KUN, ZHEN] => 16,
        [KUN, KAN] => 8,
        [KUN, GEN] => 23,
        [KUN, XUN] => 20,
        [KUN, LI] => 35,
        [KUN, DUI] => 45,
        [ZHEN, QIAN] => 25,
        [ZHEN, KUN] => 24,
        [ZHEN, ZHEN] => 51,
        [ZHEN, KAN] => 3,
        [ZHEN, GEN] => 27,
        [ZHEN, XUN] => 42,
        [ZHEN, LI] => 21,
        [ZHEN, DUI] => 17,
        [KAN, QIAN] => 6,
        [KAN, KUN] => 7,
        [KAN, ZHEN] => 40,
        [KAN, KAN] => 29,
        [KAN, GEN] => 4,
        [KAN, XUN] => 59,
        [KAN, LI] => 64,
        [KAN, DUI] => 47,
        [GEN, QIAN] => 33,
        [GEN, KUN] => 15,
        [GEN, ZHEN] => 62,
        [GEN, KAN] => 39,
        [GEN, GEN] => 52,
        [GEN, XUN] => 53,
        [GEN, LI] => 56,
        [GEN, DUI] => 31,
        [XUN, QIAN] => 44,
        [XUN, KUN] => 46,
        [XUN, ZHEN] => 32,
        [XUN, KAN] => 48,
        [XUN, GEN] => 18,
        [XUN, XUN] => 57,
        [XUN, LI] => 50,
        [XUN, DUI] => 28,
        [LI, QIAN] => 13,
        [LI, KUN] => 36,
        [LI, ZHEN] => 55,
        [LI, KAN] => 63,
        [LI, GEN] => 22,
        [LI, XUN] => 37,
        [LI, LI] => 30,
        [LI, DUI] => 49,
        [DUI, QIAN] => 10,
        [DUI, KUN] => 19,
        [DUI, ZHEN] => 54,
        [DUI, KAN] => 60,
        [DUI, GEN] => 41,
        [DUI, XUN] => 61,
        [DUI, LI] => 38,
        [DUI, DUI] => 58
      }.freeze

      # Calculates the King Wen sequence number of the given hexagram
      #
      # @param hexagram [Iching::Hexagram] hexagram whose sequence number will
      #   be calculated.
      # @return [Integer] sequence number of the hexagram given
      def calculate(hexagram)
        lower_trigram = hexagram.lines[0...3]
        upper_trigram = hexagram.lines[3...6]
        SEQUENCE_NUMBER[[lower_trigram, upper_trigram]]
      end
    end
  end
end
