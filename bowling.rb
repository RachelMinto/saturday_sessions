require 'pry'

class Game
  def initialize
    @pins_by_frame = []
    10.times { @pins_by_frame.push([]) }
    @current_frame = 0
  end

  def roll(pins)
    unless pins_error?(pins) || frame_number_error?
      @current_frame += 1 if next_frame?
      frame.push(pins)
      raise 'Pin count exceeds pins on the lane' if total_error?
    end
  end

  def roll_n_times(num_rolls, pins)
    num_rolls.times { roll(pins) }
  end

  def next_frame?
    if @current_frame != 9 || (@current_frame == 9 && !fill_ball?)
      frame.count == 2 || frame.reduce(:+) == 10
    end
  end

  def score
    scored_frames = []
    score_error?

    @pins_by_frame[0..8].each_with_index do |pins, frame_number|
      scored_frames.push(score_first_9_frames(pins, frame_number))
    end

    scored_frames.reduce(:+) + @pins_by_frame[9].reduce(:+)
  end

  private

  def score_first_9_frames(pins, frame_number)
    if strike?(frame_number)
      score_strike(pins, frame_number)
    elsif spare?(frame_number)
      score_spare(pins, frame_number)
    else
      pins.reduce(:+)
    end
  end

  def pins_error?(pins)
    raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(pins)
  end

  def total_error?
    if !last_frame?
      frame.size == 2 && frame.reduce(:+) > 10
    elsif last_frame_strike_and_not_spare
      frame[1] + frame[2] > 10
    end
  end

  def score_error?
    if @pins_by_frame[9] == [] || !game_complete?
      raise 'Score cannot be taken until the end of the game'
    end
  end

  def last_frame_strike_and_not_spare
    frame.size == 3 && frame[0] == 10 && frame[1] != 10
  end

  def frame_number_error?
    if @current_frame == 9 && next_frame?
      raise 'Should not be able to roll after game is over'
    end
  end

  def game_complete?
    @pins_by_frame[9] != [] && last_frame_complete?
  end

  def last_frame_complete?
    fill_ball? ? @pins_by_frame[9].size == 3 : @pins_by_frame[9].size == 2
  end

  def strike?(frame_number)
    @pins_by_frame[frame_number][0] == 10
  end

  def spare?(frame_number)
    current_frame = @pins_by_frame[frame_number]
    current_frame.size == 2 && current_frame.reduce(:+) == 10
  end

  def fill_ball?
    first_of_last_frame = @pins_by_frame[9][0]
    second_of_last_frame = @pins_by_frame[9][1]

    return true if first_of_last_frame == 10
    if first_of_last_frame && second_of_last_frame
      return true if first_of_last_frame + second_of_last_frame == 10
    end
  end

  def next_pin(frame_number)
    @pins_by_frame[frame_number + 1][0]
  end

  def last_frame?
    @current_frame == 9
  end

  def second_next_pin(frame_number)
    if @pins_by_frame[frame_number + 1][1]
      @pins_by_frame[frame_number + 1][1]
    else
      @pins_by_frame[frame_number + 2][0]
    end
  end

  def score_strike(pins, frame_num)
    pins.reduce(:+) + next_pin(frame_num) + second_next_pin(frame_num)
  end

  def score_spare(pins, frame_number)
    pins.reduce(:+) + next_pin(frame_number)
  end

  def frame
    @pins_by_frame[@current_frame]
  end
end
