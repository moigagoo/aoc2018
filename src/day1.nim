import strutils, sequtils, math, intsets


proc day1task1*(path: string): int = sum readFile(path).splitLines().mapIt(parseInt(it))
  ## Count the sum of integers in a file (number per line).

proc day1task2*(path: string): int =
  ##[
    While calculating the sum of integers in a file, detect the first repetition
    on the accumulated result.

    When the end of the file is reached, start from the beginning preserving the sum so far.
  ]##

  let steps = readFile(path).splitLines().mapIt(parseInt(it))
  var history = initIntSet(); history.incl 0

  while true:
    for step in steps:
      result += step
      if result in history: return
      history.incl result
