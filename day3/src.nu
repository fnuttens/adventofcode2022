let rucksacks = (open input.txt | lines)

let detailed_rucksacks = ($rucksacks |
each { |it|
  let length = ($it | str length) / 2
  let comp1 = ($it | str substring 0..$length)
  let comp2 = ($it | str substring $length..)
  [$comp1 $comp2]
})

let redundant_items = ($detailed_rucksacks |
each { |it|
  let comp1 = ($it.0 | split chars | uniq)
  let comp2 = ($it.1 | split chars | uniq)
  ([$comp1 $comp2] | flatten | histogram | where count == 2).0.value
})

let priorities = ([a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z] |
each --numbered { |it| $it})

let part1 = ($redundant_items |
each { |redundant_item|
  ($priorities | where item == $redundant_item).0.index + 1
} |
math sum)

echo $"Part 1: ($part1)"

let groups = ($rucksacks | window 3 --stride 3)

let trimmed_groups = ($groups |
each { |_|
  each { |it| $it | split chars | uniq | str join }
})

let badges = ($trimmed_groups |
each {|it|
  ($it | str join | split chars | histogram | where count == 3).0.value
})

let part2 = ($badges |
each { |redundant_item|
  ($priorities | where item == $redundant_item).0.index + 1
} |
math sum)

echo $"Part 2: ($part2)"
