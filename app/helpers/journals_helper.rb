module JournalsHelper
  def journal_graph_data
    Journal.group_by_day(:date).sum(:happiness)
  end

end
