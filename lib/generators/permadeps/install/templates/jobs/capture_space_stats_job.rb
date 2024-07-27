class CaptureSpaceStatsJob < ApplicationJob
  queue_as :pghero

  def perform
    PgHero.capture_space_stats
  end
end
