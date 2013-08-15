## Drum Kit
#
## :bass_drum_1
## :side_stick
## :acoustic_snare
## :hand_clap
#
## :electric_snare
## :low_floor_tom
## :closed_hi_hat
#
## :open_hi_hat
## :low_tom
## :pedal_hi_hat
#
## :high_mid_tom
## :crash_cymbal_1
#
## :splash_cymbal
#
## :cowbell
## :crash_cymbal_2

set_config(:beats_per_minute=>120, :time_signature=>'4/4', :resolution=>'1/64')


str 'kicking-1-3', [pr(:bass_drum_1), n(:R), pr(:bass_drum_1), n(:R)], :ch=>0 do |pattern|
  pattern
end

str 'kicking-and-crashing', nl(pr(:bass_drum_1, :l => 8), pr(:crash_cymbal_2, :l => 8)), :ch=>0 do |pattern|
  pattern
end

str 'motorik', nil, :ch=>0 do |pattern|
  len = 8
  [nl(pr(:bass_drum_1,:l=>len),pr(:open_hi_hat, :l=>len)),
   nl(pr(:bass_drum_1,:l=>len),pr(:open_hi_hat, :l=>len)),
   nl(pr(:acoustic_snare,:l=>len),pr(:open_hi_hat, :l=>len)),
   nl(pr(:bass_drum_1,:l=>len),pr(:open_hi_hat, :l=>len)),
   nl(pr(:bass_drum_1,:l=>len),pr(:open_hi_hat, :l=>len)),
   nl(pr(:bass_drum_1,:l=>len),pr(:open_hi_hat, :l=>len)),
   nl(pr(:acoustic_snare,:l=>len),pr(:open_hi_hat, :l=>len)),
   nl(pr(:bass_drum_1,:l=>len),pr(:open_hi_hat, :l=>len))]
end

fast_speed = 32
str 'gallop', [pr(:low_floor_tom, :l => fast_speed),
               pr(:low_tom, :l => fast_speed),
               n(:R, :l=> fast_speed),
               pr(:high_mid_tom, :l => fast_speed)], :ch=>0 do |pattern|
  pattern
end

if sources.include?('nanoKONTROL')
  fast_speed = 32
  add_input('nanoKONTROL')
  add_cc(:switch, 13, :type => :switch)
  str 'your-beaches', nil, :ch=>0 do |pattern|
    if cc(:switch)
      [pr(:bass_drum_1, :l => fast_speed/2), pr(:low_mid_tom, :l => fast_speed/2)]
    else
      [pr(:bass_drum_1, :l => fast_speed), pr(:low_mid_tom, :l => fast_speed)]
    end
  end
end
