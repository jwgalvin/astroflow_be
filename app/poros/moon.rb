class Moon
  attr_reader :date,
              :phase

  def initialize(result)
    @date = result[:TargetDate]
    @phase = result[:Phase]
  end
end
