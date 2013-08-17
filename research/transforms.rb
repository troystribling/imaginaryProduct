set_config(:beats_per_minute=>120, :time_signature=>'4/4', :resolution=>'1/64')

str 'cycle', np([:Fs, 4], :dorian, :l=>4)[3,1,3,5] do |pattern|
  pattern.push(pattern.shift.first)
end

str 'strum', cp([:As, 4], :dorian, :l=>4)[3,5,7,1].arp!(32) do |pattern|
  pattern
end
