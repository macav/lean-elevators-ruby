class Elevator
  def initialize(elevator)
    @elevator = elevator
    @target_floors = elevator['target_floors']
    @capacity = elevator['capacity']
  end

  def floor
    if capacity_of_elevator < 3
      most_requested_floor
    else
      (@elevator['current_floor'] += 1) % 15
    end
  end

  def capacity_of_elevator
    @capacity - @target_floors.size
  end

  def most_requested_floor
    counts = @target_floors.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
    @target_floors.max_by { |v| counts[v] }
  end
end
