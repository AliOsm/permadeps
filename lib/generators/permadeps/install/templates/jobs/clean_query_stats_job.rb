class CleanQueryStatsJob < ApplicationJob
  queue_as :pghero

  def perform
    PgHero.clean_query_stats
  end
end
