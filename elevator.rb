class Elevator
  def initialize(elevator, floors)
    @elevator = elevator
    @floors = floors
    @target_floors = elevator['target_floors']
    @capacity = elevator['capacity']
  end

  def floor
    if free_spaces < 3
      most_requested_floor
    else
      next_floor_with_people
    end
  end

  def free_spaces
    @capacity - @target_floors.size
  end

  def most_requested_floor
    counts = @target_floors.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
    @target_floors.max_by { |v| counts[v] }
  end

  def next_floor_with_people
    while 1
      next_floor = (@elevator['current_floor'] += 1) % 15
      panel = @floors[next_floor]['panel']
      break if panel['up'] || panel['down']
    end
    next_floor
  end
end
