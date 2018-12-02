import strutils


proc day1task1*(path: string): int =
  ## Count the sum of integers in a file (number per line).

  for line in lines(path):
    result += parseInt(line)

proc day1task2*(path: string): int =
  ##[
    While calculating the sum of integers in a file, detect the first repetition
    on the accumulated result.

    When the end of the file is reached, start from the beginning preserving the sum so far.
  ]##

  let steps = readFile(path).splitLines()
  var history: seq[int] = @[0]

  while true:
    for step in steps:
      result += parseInt(step)
      if result in history: return
      history.add result
