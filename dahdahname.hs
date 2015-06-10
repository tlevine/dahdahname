import System.Environment (getArgs)
import Data.List (intersperse)

main :: IO ()
main = do
  argv <- getArgs
  putStrLn $ parse argv

parse :: [String] -> String
parse argv = concat $ intersperse "/" argv

{-
def parse(index):
    for theclass in [basestring, datetime.date, datetime.datetime, int, type(None)]:
        if isinstance(index, theclass):
            yield from parse_partial(index) # tuple
            break
    else:
        yield from itertools.chain(*map(parse, index)) # iterable

_special = {'.': '\\.', '..': '\\..', '.tmp': '\\.tmp'}
def replace_special(path):
    for item in path:
        if item in _special:
            yield _special[item]
        else:
            yield item

def parse_partial(item):
    if isinstance(item, basestring):
        func = parse_partial_text
    elif isinstance(item, int):
        func = lambda x: (str(x),)
    elif isinstance(item, datetime.date) or isinstance(item, datetime.datetime):
        func = parse_partial_date
    elif item == None:
        func = lambda _: ('',)
    else:
        raise ValueError('item must be string, datetime.date, datetime.datetime or int')
    return tuple(func(item))
#   yield from func(item)

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
