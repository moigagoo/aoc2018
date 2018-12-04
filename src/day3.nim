import tables, strscans, sequtils

type
  Coords = tuple
    x, y: int
  Grid = CountTable[Coords]

func initGrid(): Grid = initCountTable[Coords]()


proc day3task1*(path: string): int =
  var grid = initGrid()

  for line in lines(path):
    var id, x, y, w, h: int

    discard scanf(line, "#$i @ $i,$i: $ix$i", id, x, y, w, h)

    for i in x..<x+w:
      for j in y..<y+h:
        grid.inc (i, j)

  len toSeq(grid.values).filterIt(it > 1)
