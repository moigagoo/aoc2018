import tables, sequtils


proc day2task1*(path: string): int =
  ##[
    Calculate the number of lines with exactly two occurences of the same character
    multiplied by the number of lines with exactly three occurences of the same character.
  ]##

  var doubles, triples: Natural

  for line in lines(path):
    let counts = toSeq(toCountTable(line).values)

    if 2 in counts: inc doubles
    if 3 in counts: inc triples

  doubles * triples


func differByOneChar(s1, s2: string): bool =
  var diffChars: Natural = 0

  for pair in zip(s1, s2):
    if pair.a != pair.b: inc diffChars
    if diffChars > 1: return

  return diffChars == 1

func commonChars(s: seq[string]): string =
  let m = min(s.mapIt(len(it)))

  for i in 0..<m:
    let charsAtI = s.mapIt(it[i])
    if allIt(charsAtI, it == charsAtI[0]): result.add charsAtI[0]

proc day2task2*(path: string): string =
  ##[
    Find the lines that differ by exactly one character on the same position
    and return their common characters as a single string.
  ]##

  var
    history: seq[string]
    correctIds: seq[string]

  for line in lines(path):
    for visitedLine in history:
      if differByOneChar(line, visitedLine):
        correctIds.add line
        correctIds.add visitedLine

    history.add line

  result = commonChars(correctIds)
