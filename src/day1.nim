import strutils


proc day1task1*(path: string): int =
  ## Count the sum of integers in a file (number per line).

  for line in lines(path):
    result += parseInt(line)
