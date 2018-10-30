module SidekiqWorkerExtension
  def log_job(out)
    Sidekiq.redis do |redis|
      redis.rpush('spec_results', out)
    end
  end
end

Sidekiq::Worker.send(:include, SidekiqWorkerExtension)
