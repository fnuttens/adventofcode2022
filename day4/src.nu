let assignments = (open input.txt |
lines |
each { |it| $it | parse "{a_from}-{a_to},{b_from}-{b_to}" | get 0 })

let part1 = ($assignments |
reduce --fold 0 { |it, acc|
  let a_from = ($it.a_from | into int)
  let a_to   = ($it.a_to | into int)
  let b_from = ($it.b_from | into int)
  let b_to   = ($it.b_to | into int)
  if ($a_from >= $b_from and $a_to <= $b_to) or (
  $b_from >= $a_from and $b_to <= $a_to) {
    $acc + 1
  } else {
    $acc
  }
})

echo $"Part 1: ($part1)"

let part2 = ($assignments |
reduce --fold 0 { |it, acc|
  let a_from = ($it.a_from | into int)
  let a_to   = ($it.a_to | into int)
  let b_from = ($it.b_from | into int)
  let b_to   = ($it.b_to | into int)
  if ($a_from >= $b_from and $a_from <= $b_to) or (
    $a_to >= $b_from and $a_to <= $b_to) or (
    $b_from >= $a_from and $b_from <= $a_to) or (
    $b_to >= $a_from and $b_to <= $a_to) {
    $acc + 1
  } else {
    $acc
  }
})

echo $"Part 2: ($part2)"
