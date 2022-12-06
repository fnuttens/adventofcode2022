let sample = (open sample.txt | lines | get 3)

let nb_windows_processed = (open input.txt |
split chars |
window 4 |
each { |it| $it | uniq | length } |
each while { |it|
  if $it != 4 { true } else { null }
} |
length)

echo $"Part 1: ($nb_windows_processed + 4)"

let nb_windows_processed = (open input.txt |
split chars |
window 14 |
each { |it| $it | uniq | length } |
each while { |it|
  if $it != 14 { true } else { null }
} |
length)

echo $"Part 2: ($nb_windows_processed + 14)"
