import System.Environment (getArgs)
import Data.List (intersperse)

main :: IO ()
main = do
  putStrLn $ unwords $ split '/' "aoeu/oeu/oeu/u"
--argv <- getArgs
--putStrLn $ concat $ intersperse "/" $ map parse argv

split :: String -> String -> [String]
split delimeter "" = []
split delimeter original = left:(split delimeter $ tail right)
  where
    (left, right) = break (== delimeter) "oeu/oeu/oeu"

parse :: String -> String
parse x = x





{-

def parse_partial_text(item):
    for a in parse_partial_url(item):
        for b in a.split('\\'):
            if b != '':
                yield b

def parse_partial_url(item):
    url = urlsplit(item)
    path = []

    if url.scheme:
        path.append(url.scheme)

    if url.netloc:
        path.append(url.netloc)

    if url.path:
        for y in filter(None, url.path.split('/')):
            path.append(y)

    if len(path) == 0:
        path = ['']

    if url.query:
        path[-1] += '?' + url.query

    if url.fragment:
        path[-1] += '#' + url.fragment

    return tuple(path)

def parse_partial_date(item):
    date = ('%04d' % item.year, '%02d' % item.month, '%02d' % item.day)
    if hasattr(item, 'minute'):
        time = ('%02d' % item.hour, '%02d' % item.minute)
    else:
        time = tuple()
    return date + time

def safe_type(index):
    for bad in [set,dict]:
        if isinstance(index, bad):
            return False
    else:
        return True
-}
