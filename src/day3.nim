import tables, strscans, sequtils

type
  Coords = tuple
    x, y: int
  Cell = tuple
    id, value: int
  Claim = tuple
    id, x, y, w, h: int


proc day3task1*(path: string): int =
  ## Calculate the number of grid cells occupied by more than one "claim."
  var grid = initCountTable[Coords]()

  for line in lines(path):
    var id, x, y, w, h: int

    discard scanf(line, "#$i @ $i,$i: $ix$i", id, x, y, w, h)

    for i in x..<x+w:
      for j in y..<y+h:
        grid.inc (i, j)

  len toSeq(grid.values).filterIt(it > 1)

proc day3task2*(path: string): int =
  var
    grid = initTable[Coords, Cell]()
    claims: seq[Claim]

  for line in lines(path):
    var claim: Claim

    discard scanf(line, "#$i @ $i,$i: $ix$i", claim.id, claim.x, claim.y, claim.w, claim.h)

    claims.add claim

    for i in claim.x..<claim.x+claim.w:
      for j in claim.y..<claim.y+claim.h:
        discard grid.hasKeyOrPut((i, j), (claim.id, 0))

        inc grid[(i, j)].value

  for claim in claims:
    block checkClaim:
      for i in claim.x..<claim.x+claim.w:
        for j in claim.y..<claim.y+claim.h:
          if grid[(i, j)].value != 1: break checkClaim

      return claim.id
