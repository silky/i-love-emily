{-----------------------------------------------------------------------------
    SARA
------------------------------------------------------------------------------}
module SARA.Example where

import IO.ReadCope

import SARA.Database
import SARA.Types

import Types

{-
runProb1 134 $ simpleCompose chopin_maz_one "chopin-maz-one" "chopin-maz-one-7/4/1-mea-1" 5 3
-}

{-----------------------------------------------------------------------------
    Build the full example database
------------------------------------------------------------------------------}
chopin_maz_one = makeDatabase [chopin_7_4_1]

{-----------------------------------------------------------------------------
    Example database
------------------------------------------------------------------------------}

{-
chopin-maz-one-7/4/1-network
 "c1 p3 a3 a3 c1 a1 p1 c1 c1 a1 a1 c1 c1 p3 a3 a3 c1 a1 p1 c1 c1 a1 a1 c1"

'full-cadence-list

chopin-maz-one-c1-lexicon (make-instance 'lexicon)))
         (setf (slot-value chopin-maz-one-c1-lexicon 'triple-function-list)
      (cons 'chopin-maz-one-7/4/1-mea-1 (slot-value chopin-maz-one-c1-lexicon 'triple-function-list)))
(setf (slot-value chopin-maz-one-c1-lexicon 'first-note-list)
      (cons (second (first (get-sounding-channel 1 (slot-value chopin-maz-one-7/4/1-mea-1 'music)))) (slot-value chopin-maz-one-c1-lexicon 'first-note-list)))

-}

parseMusic :: String -> Notes
parseMusic = readNotes

chopin_7_4_1 :: Piece
chopin_7_4_1 = makePiece name cadence $ map measure [1..count]
    where
    name  = "chopin-maz-one-7/4/1"
    count = 6 :: Int -- number of measures

    meta = defaultMeasure
        { creator = getSection name
        , matching_line_number = 1
        , mode  = Major
        , tempo = 66
        , meter = 3
        , measures = makeMeasureNames name count
        }

    cadence = meta
        { music    = parseMusic "((0 57 1000 3 100) (0 69 1000 2 100) (0 65 1000 2 100) (0 60 1000 2 100) (0 84 500 1 100) (750 77 250 1 100) (1000 55 1000 3 100) (1000 67 1000 2 100) (1000 60 1000 2 100) (1000 76 500 1 100) (1500 79 500 1 100) (2000 55 1000 3 100) (2000 67 1000 2 100) (2000 64 1000 2 100) (2000 72 500 1 100) (2500 73 500 1 100) (3000 55 1000 3 100) (3000 67 1000 2 100) (3000 65 1000 2 100) (3000 74 500 1 100) (3500 77 500 1 100) (4000 55 1000 3 100) (4000 67 1000 2 100) (4000 65 1000 2 100) (4000 69 500 1 100) (4500 71 500 1 100) (5000 60 1000 3 100) (5000 67 1000 2 100) (5000 64 1000 2 100) (5000 72 500 1 100))"
        , analysis = words "p1 c1 c1 a1 a1 c1"
        }

    measure 1 = meta
        { music       = parseMusic "((0 60 1000 3 100) (0 67 1000 2 100) (0 64 1000 2 100) (0 72 333 1 100) (333 74 333 1 100) (666 72 333 1 100) (1000 60 1000 3 100) (1000 68 1000 2 100) (1000 65 1000 2 100) (1000 71 500 1 100) (1500 72 500 1 100) (2000 60 1000 3 100) (2000 65 1000 2 100) (2000 68 1000 2 100) (2000 74 500 1 100) (2500 76 500 1 100))"
        , analysis    = words "c1 p3 a3"
        , destination = ([77,68,59], "a3")
        }

    measure 2 = meta
        { music       = parseMusic "((0 59 1000 3 100) (0 68 1000 2 100) (0 62 1000 2 100) (0 77 333 1 100) (333 79 333 1 100) (666 77 333 1 100) (1000 60 1000 3 100) (1000 67 1000 2 100) (1000 64 1000 2 100) (1000 76 500 1 100) (1500 77 500 1 100) (2000 59 1000 3 100) (2000 67 1000 2 100) (2000 62 1000 2 100) (2000 79 1000 1 100))"
        , analysis    = words "a3 c1 a1"
        , destination = ([84,69,57], "p1")
        }

    measure 3 = meta
        { music       = parseMusic "((0 57 1000 3 100) (0 69 1000 2 100) (0 65 1000 2 100) (0 60 1000 2 100) (0 84 500 1 100) (750 77 250 1 100) (1000 55 1000 3 100) (1000 67 1000 2 100) (1000 60 1000 2 100) (1000 76 500 1 100) (1500 79 500 1 100) (2000 55 1000 3 100) (2000 67 1000 2 100) (2000 64 1000 2 100) (2000 72 500 1 100) (2500 73 500 1 100))"
        , analysis    = words "p1 c1 c1"
        , destination = ([74,67,55], "a1")
        }
    
    measure 4 = meta
        { music       = parseMusic "((0 55 1000 3 100) (0 67 1000 2 100) (0 65 1000 2 100) (0 74 500 1 100) (500 77 500 1 100) (1000 55 1000 3 100) (1000 67 1000 2 100) (1000 65 1000 2 100) (1000 69 500 1 100) (1500 71 500 1 100) (2000 60 1000 3 100) (2000 67 1000 2 100) (2000 64 1000 2 100) (2000 72 1000 1 100))"
        , analysis    = words "a1 a1 c1"
        , destination = ([72,67,60], "c1")
        }

    measure 5 = meta
        { music       = parseMusic "((0 60 1000 3 100) (0 67 1000 2 100) (0 64 1000 2 100) (0 72 333 1 100) (333 74 333 1 100) (666 72 333 1 100) (1000 60 1000 3 100) (1000 68 1000 2 100) (1000 65 1000 2 100) (1000 71 500 1 100) (1500 72 500 1 100) (2000 60 1000 3 100) (2000 68 1000 2 100) (2000 65 1000 2 100) (2000 74 500 1 100) (2500 76 500 1 100))"
        , analysis    = words "c1 p3 a3"
        , destination = ([77,68,59], "a3")
        }

    measure 6 = meta
        { music       = parseMusic "((0 59 1000 3 100) (0 68 1000 2 100) (0 62 1000 2 100) (0 77 333 1 100) (333 79 333 1 100) (666 77 333 1 100) (1000 60 1000 3 100) (1000 67 1000 2 100) (1000 64 1000 2 100) (1000 76 500 1 100) (1500 77 500 1 100) (2000 59 1000 3 100) (2000 67 1000 2 100) (2000 62 1000 2 100) (2000 78 500 1 100) (2500 79 500 1 100))"
        , analysis    = words "a3 c1 a1"
        , destination = ([84,69,57], "p1")
        }
