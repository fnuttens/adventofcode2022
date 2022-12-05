let stack_levels = 3
let input = (open sample.txt | lines)
let length = ($input | length)

$input |
first $stack_levels |
reverse |
each { |it| $it | split chars } |
each { |it| {
  0: $it.1
  1: $it.5
  2: $it.9
}} |
transpose -i

$input |
last ($length - ($stack_levels + 2)) |
parse "move {nb_stacks} from {from} to {to}"
