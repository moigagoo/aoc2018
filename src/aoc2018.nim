import cligen
import day1


when isMainModule:
  dispatchMulti(
    [day1task1, echoResult=true],
    [day1task2, echoResult=true]
  )
