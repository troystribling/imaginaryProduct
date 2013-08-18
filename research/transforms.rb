set_config(:beats_per_minute=>120, :time_signature=>'4/4', :resolution=>'1/64')

if sources.include?('nanoKONTROL')
  add_input('nanoKONTROL')
elsif sources.include?('GECO')
  add_input('GECO')
end
add_cc(:mode, 17, :type => :cont, :min => 0, :max => 6, :init => 0)

str 'cycle', np([:Fs, 4], :dorian, :l=>4)[5,3,7,1] do |pattern|
  pattern.push(pattern.shift.first).mode!(cc(:mode).to_i)
end

str 'anti-cycle', np([:Fs, 4], :dorian, :l=>4)[5,3,7,1] do |pattern|
  pattern.unshift(pattern.pop.first).mode!(cc(:mode).to_i)
end

str 'arp', cp([:As, 4], :dorian, :l=>4)[3,5,2,7].arp!(32) do |pattern|
  pattern
end

str 'modes', np([:Fs, 4], :dorian, :l=>4)[5,1,3,7] do |pattern|
  pattern.mode!(cc(:mode).to_i)
end

