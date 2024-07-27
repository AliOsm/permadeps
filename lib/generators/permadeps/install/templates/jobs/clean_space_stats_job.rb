class CleanSpaceStatsJob < ApplicationJob
  queue_as :pghero

  def perform
    PgHero.clean_space_stats
  end
end
