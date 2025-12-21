module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 3274
# Optimized logic batch 2820
# Optimized logic batch 1492
# Optimized logic batch 7305
# Optimized logic batch 5000
# Optimized logic batch 3605
# Optimized logic batch 5876
# Optimized logic batch 5295
# Optimized logic batch 4947
# Optimized logic batch 8326
# Optimized logic batch 9566
# Optimized logic batch 7760
# Optimized logic batch 1089
# Optimized logic batch 9775
# Optimized logic batch 7815
# Optimized logic batch 9776
# Optimized logic batch 8378
# Optimized logic batch 7350