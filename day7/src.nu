mut fs = [[dir, size]; [/, 0]]
mut pwd = "/"
let input = (open sample.txt | lines)

$input | each { |it|
  let is_command = ($it | str starts-with "$")
  # echo $it

  if $is_command {
    # echo "Command is..."
    let is_ls = ($it | str ends-with "ls")
    # echo $is_ls
    # if $is_ls == false { echo "Change directory!" }
  } else {
    parse_ls_entry $it
  }
}

def parse_ls_entry [entry: string] {
  let entry = ($entry | parse -r '(?P<size>\d+) (?P<file>[a-z.]+)')

  let is_file = (($entry | length) != 0)
  if $is_file == false { return }

  let entry = $entry.0

  let dir = ($fs | find $pwd)
  let is_parent_dir_known = (($dir | length) != 0)

  if $is_parent_dir_known == true  {
    let new_size = ($dir.0.size + $entry.size)
    $fs = ($fs | update size { |it|
      if $it.dir == $pwd {
        $new_size
      } else {
        
      }
    })
  } else {
  }
}
