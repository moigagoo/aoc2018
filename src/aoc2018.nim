import cligen
import day1, day2, day3


when isMainModule:
  dispatchMulti(
    [day1task1, echoResult=true],
    [day1task2, echoResult=true],
    [day2task1, echoResult=true],
    [day2task2, echoResult=true],
    [day3task1, echoResult=true],
    [day3task2, echoResult=true]
  )
