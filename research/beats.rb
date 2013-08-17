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
## :ride_cymbal_1
#
## :high_mid_tom
## :crash_cymbal_1
#
## :splash_cymbal
#
## :cowbell
## :crash_cymbal_2

set_config(:beats_per_minute=>120, :time_signature=>'4/4', :resolution=>'1/64')

if sources.include?('nanoKONTROL')
  add_input('nanoKONTROL')
  add_cc(:mult, 17, :type => :cont, :min => 0, :max => 3, :init => 0)
end

vlen = 8
motoric = [nl(pr(:bass_drum_1,:l=>vlen),pr(:open_hi_hat, :l=>vlen)),
           nl(pr(:bass_drum_1,:l=>vlen),pr(:open_hi_hat, :l=>vlen)),
           nl(pr(:acoustic_snare,:l=>vlen),pr(:open_hi_hat, :l=>vlen)),
           nl(pr(:bass_drum_1,:l=>vlen),pr(:open_hi_hat, :l=>vlen)),
           nl(pr(:bass_drum_1,:l=>vlen),pr(:open_hi_hat, :l=>vlen)),
           nl(pr(:bass_drum_1,:l=>vlen),pr(:open_hi_hat, :l=>vlen)),
           nl(pr(:acoustic_snare,:l=>vlen),pr(:open_hi_hat, :l=>vlen)),
           nl(pr(:bass_drum_1,:l=>vlen),pr(:open_hi_hat, :l=>vlen))]
str 'motorik', motoric, :ch=>0 do |pattern|
  pattern.length!((2**cc(:mult).to_i)*vlen)
end

len = 4
str 'gallop', [pr(:low_floor_tom, :l => len),
               pr(:low_tom, :l => len),
               n(:R, :l=> len),
               pr(:high_mid_tom, :l => len)], :ch=>0 do |pattern|
  pattern.length!((2**cc(:mult).to_i)*len)
end

str 'your-beaches', [pr(:bass_drum_1, :l => len), pr(:low_mid_tom, :l => len)], :ch=>0 do |pattern|
  pattern.length!((2**cc(:mult).to_i)*len)
end
