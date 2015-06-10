

main :: IO ()
main = do
  argv <- getArgs
  putStrLn $ lines argv
