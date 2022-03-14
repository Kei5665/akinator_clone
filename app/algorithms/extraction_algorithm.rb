class ExtractionAlgorithm
  # このクラスの外からはこの2変数に値を代入できず、読み取りしかできないようにする
  attr_reader :game
  attr_reader :query

  def initialize(game)
    # Rails.logger.debugはログ出力
    Rails.logger.debug('ExtractionAlgorithm initialized.')
    @game = game
    @query = Comic.all
  end
  
  def compute
    progresses = @game.progresses
    progresses.each do |progress|
      # question
      question = progress.question

      # =============================================
      # ここに絞り込み処理を実装予定 
      # =============================================

      Rails.logger.debug('On the way query is ' + @query.to_sql.to_s)
      Rails.logger.debug('On the way comics are ' + @query.pluck(:title).to_a.to_s)
    end
    @query
  end
end
