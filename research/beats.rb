set_config(:beats_per_minute=>120, :time_signature=>'4/4', :resolution=>'1/64')

str 'on_beat_kick', [pr(:bass_drum_1), pr(:electric_snare), pr(:bass_drum_1), n(:R)], :ch=> 0 do |pattern|
  pattern
end
