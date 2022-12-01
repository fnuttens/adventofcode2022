let rankings = (open input.txt |
sd '^\n' ';' |
split row ';' |
each { |it|
  lines |
  into int |
  reduce { |it, acc| $acc + $it }
} |
sort |
reverse)

let part1 = ($rankings | get 0)
echo $"Part 1: ($part1)"

let part2 = ($rankings | first 3 | reduce { |it, acc| $it + $acc })
echo $"Part 2: ($part2)"
