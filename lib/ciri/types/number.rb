# frozen_string_literal: true

# Copyright (c) 2018, by Jiang Jinyang. <https://justjjy.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'ciri/utils'
require 'ciri/rlp'

module Ciri
  module Types

    class Number
      class << self
        attr_reader :size

        def rlp_encode(item)
          RLP.encode new(item).to_bytes
        end

        def rlp_decode(encoded)
          Utils.big_endian_decode(RLP.decode(encoded))
        end
      end

      @size = 0

      def initialize(value)
        raise "can't initialize size #{self.class.size} number" if self.class.size <= 0
        @value = value
      end

      def serialized
        Utils.big_endian_encode_to_size(@value, size: bytes_size)
      end

      alias to_bytes serialized

      def bytes_size
        self.class.size / 8
      end

      def to_i
        @value
      end
    end

    class U256 < Number
      @size = 256
    end

  end
end