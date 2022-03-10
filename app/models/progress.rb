class Progress < ApplicationRecord
  belongs_to :game
  belongs_to :question

  # 同じゲーム内で1から連番を発行する
  def assign_sequence
    # 新たに発番する番号(next_sequence)を1で初期化
    next_sequence = 1
    if game.present?
      all_progress = game.progresses
      if all_progress.count > 0
        next_sequence = all_progress.maximum(:sequence) + 1
      end
    end
    self.sequence = next_sequence
  end
end
