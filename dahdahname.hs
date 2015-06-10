import System.Environment (getArgs)

main :: IO ()
main = do
  argv <- getArgs
  putStrLn $ unlines argv
