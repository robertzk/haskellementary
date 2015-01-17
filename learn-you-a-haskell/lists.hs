{- Experiments with lists -}

-- Let's try to grab the next 5 ASCII characters after 'a'.
take 5 (reverse ['a'..])
-- "\1114111\1114110\1114109\1114108\1114107"
-- What went wrong? This starts at the last enumerable character! Not what we wanted.

take 5 (['b', 'a'..])
-- "ba`_^"
-- By giving the hint on the infinite list to descend, we get the correct result.

{--- Just for fun!
  Prelude> take 100 (['b', 'a'..])
  "ba`_^]\\[ZYXWVUTSRQPONMLKJIHGFEDCBA@?>=<;:9876543210/.-,+*)('&%$#\"! \US\RS\GS\FS\ESC\SUB\EM\CAN\ETB
  \SYN\NAK\DC4\DC3\DC2\DC1\DLE\SI\SO\r\f\v\n\t\b\a\ACK\ENQ\EOT\ETX\STX\SOH\NUL"
  Prelude> (==) (maxBound :: Char) (head (reverse ['a'..]))
  True
-}



