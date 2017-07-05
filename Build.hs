import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util
 
main :: IO ()
main = shakeArgs shakeOptions{shakeFiles="_build"} $ do
    want ["_build/main.lua",
          "_build/conf.lua",
          "_build/globals.lua",
          "_build/actions/action.lua",
          "_build/actions/circle.lua",
          "_build/obj/bullet.lua",
          "_build/states/game.lua",
          "_build/states/menu.lua",
          "_build/states/ingame.lua",
          "_build/updatestack.lua",
          "_build/actions/test.lua"]

    "_build//*.lua" %>  \out -> do
        let src = "src" </> (dropDirectory1 $ out -<.> "moon")
        need [src]
        cmd "moonc" "-o" out src