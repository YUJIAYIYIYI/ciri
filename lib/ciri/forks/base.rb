# frozen_string_literal: true

# Copyright 2018 Jiang Jinyang <https://justjjy.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Ciri
  module Forks

    class Base
      # gas methods
      def gas_of_operation(vm)
        raise NotImplementedError
      end

      def gas_of_memory(word_count)
        raise NotImplementedError
      end

      def gas_of_call(vm:, gas:, to:, value:)
        raise NotImplementedError
      end

      def intrinsic_gas_of_transaction(transaction)
        raise NotImplementedError
      end

      def calculate_deposit_code_gas(code_bytes)
        raise NotImplementedError
      end

      def mining_rewards_of_block(block)
        raise NotImplementedError
      end

      def calculate_refund_gas(vm)
        raise NotImplementedError
      end

      # chain difficulty method
      def difficulty_time_factor(header, parent_header)
        raise NotImplementedError
      end

      def difficulty_virtual_height(height)
        raise NotImplementedError
      end

      # EVM op code and contract
      def find_precompile_contract(address)
        raise NotImplementedError
      end

      def transaction_class
        raise NotImplementedError
      end
    end

  end
end
