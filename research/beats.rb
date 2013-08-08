set_config(:beats_per_minute=>120, :time_signature=>'4/4', :resolution=>'1/64')

str 'on_beat_kick', [pr(:bass_drum_1), pr(:crash_cymbal_1), pr(:bass_drum_1), pr(:splash_cymbal)], :ch=> 0 do |pattern|
  pattern
end
