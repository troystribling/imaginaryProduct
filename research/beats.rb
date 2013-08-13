set_config(:beats_per_minute=>120, :time_signature=>'4/4', :resolution=>'1/64')


str 'kicking-1-2', [pr(:bass_drum_1), n(:R), pr(:bass_drum_1), n(:R)], :ch=> 0 do |pattern|
  pattern
end

str 'kicking-and-crashing', nl(pr(:bass_drum_1, :l => 8), pr(:crash_cymbal_2, :l => 8)), :ch=> 0 do |pattern|
  pattern
end

str 'toms', [pr(:low_floor_tom, :l => 16), pr(:low_tom, :l => 16), n(:R, :l=>16) , pr(:low_mid_tom, :l => 16)], :ch=> 0 do |pattern|
  pattern
end

if sources.include?('nanoKONTROL')
  add_input('nanoKONTROL')
  add_cc(:switch, 13, :type => :switch)
  fast_speed = 16
  str 'your-beaches', nil, :ch=>0 do |pattern|
    if cc(:switch)
      [pr(:bass_drum_1, :l => fast_speed/2), pr(:low_mid_tom, :l => fast_speed/2)]
    else
      [pr(:bass_drum_1, :l => fast_speed), pr(:low_mid_tom, :l => fast_speed)]
    end
  end
end
