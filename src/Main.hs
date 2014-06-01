{-# LANGUAGE MultiParamTypeClasses, OverloadedStrings, QuasiQuotes, TemplateHaskell, TypeFamilies #-}
module Main where

import Yesod

data Piggies = Piggies

instance Yesod Piggies

mkYesod "Piggies" [parseRoutes|
  /      HomeR  GET
  /about AboutR GET
|]

getHomeR = defaultLayout [whamlet|
  Welcome to the Pigsty!
  <br>
  <a href=@{AboutR}>About Us.
|]

getAboutR = defaultLayout [whamlet|
  Enough about us!
  <br>
  <a href=@{HomeR}>Back Home.
|]

main = warpEnv Piggies