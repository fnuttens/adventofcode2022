let plan = (open input.txt |
lines |
split column ' ' opponent strategy)

let part1 = ($plan |
each { |it|
  let shape = if $it.strategy == X { 1 } else if $it.strategy == Y { 2 } else { 3 }
  mut outcome = 3
  if $shape == 1 and $it.opponent == C or $shape == 2 and $it.opponent == A or $shape == 3 and $it.opponent == B {
    $outcome = 6
  } else if $shape == 1 and $it.opponent == B or $shape == 2 and $it.opponent == C or $shape == 3 and $it.opponent == A {
    $outcome = 0
  }
  $shape + $outcome
} |
math sum)

echo $"Part 1: ($part1)"

let part2 = ($plan |
each { |it|
  let outcome = if $it.strategy == X { 0 } else if $it.strategy == Y { 3 } else { 6 }
  mut shape = 0
  if $outcome == 0 and $it.opponent == B or $outcome == 3 and $it.opponent == A or $outcome == 6 and $it.opponent == C {
    $shape = 1
  } else if $outcome == 0 and $it.opponent == C or $outcome == 3 and $it.opponent == B or $outcome == 6 and $it.opponent == A {
    $shape = 2
  } else if $outcome == 0 and $it.opponent == A or $outcome == 3 and $it.opponent == C or $outcome == 6 and $it.opponent == B {
    $shape = 3
  }
  $shape + $outcome
} |
math sum)

echo $"Part 2: ($part2)"
