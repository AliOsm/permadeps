class CaptureQueryStatsJob < ApplicationJob
  queue_as :pghero

  def perform
    PgHero.capture_query_stats
  end
end
