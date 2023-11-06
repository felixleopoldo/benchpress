import apitest


apitest.estimate("pcalg_pc", {
       "id": "pc-gaussCItest",
         "alpha": 0.001,
         "NAdelete": True,
         "mmax": "Inf",
         "u2pd": "relaxed",
         "skelmethod": "stable",
         "conservative": False,
         "majrule": False,
         "solveconfl": False,
         "numCores": 1,
         "verbose": False,
         "indepTest": "gaussCItest",
         "timeout": None
       }, "mydata.csv")
