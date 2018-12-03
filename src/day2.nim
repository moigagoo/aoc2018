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
