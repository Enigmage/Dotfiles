-- Base
import XMonad
import XMonad.StackSet as W
import XMonad.ManageHook
import Data.Monoid

-- Util
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab 
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Themes

-- Layouts
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.Spacing
import XMonad.Layout.MagicFocus
import XMonad.Layout.NoBorders
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Tabbed
import XMonad.Layout.LayoutModifier -- needed for spacing thing, dunno why.
import XMonad.Layout.Maximize
import XMonad.Layout.Renamed
import XMonad.Layout.Accordion

-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (docksEventHook, avoidStruts)
import XMonad.Hooks.DynamicLog 
import XMonad.Hooks.SetWMName

-- Actions
import XMonad.Actions.GridSelect
import XMonad.Actions.Search

-- Prompts
import XMonad.Prompt
-- import XMonad.Prompt.Ssh
import XMonad.Prompt.Man
import XMonad.Prompt.Window as Win


-- These applications will be opened on startup of xmonad.
myStartupHook :: X()
myStartupHook = do
    spawnOnce "xfce4-power-manager"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawnOnce "setxkbmap -option caps:ctrl_modifier"
    spawnOnce "nm-applet"
    spawnOnce "volumeicon"
    spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 7 --transparent true --tint 0x5f5f5f --height 24 &"
    setWMName "LG3D" -- For some GUI apps.

-- Configuration constants.

-- myTerminal :: String
-- myTerminal = "wezterm"

myTerminal2 :: String
myTerminal2 = "alacritty"

myTerminal3 :: String
myTerminal3 = "st"

myModKey :: KeyMask
myModKey = mod4Mask


--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing x = spacingRaw False (Border x x x x) True (Border x x x x) True

-- search engines
braveSearch :: SearchEngine
braveSearch = searchEngine "brave search" "https://search.brave.com/search?q="

googleSearch :: SearchEngine 
googleSearch = searchEngine "google" "https://google.com/search?q="

-- Scratchpads.
myScratchpads :: [NamedScratchpad]
myScratchpads = [
      NS "htop" "st -e htop" (title =? "htop") generalLayout
    , NS "calculator" "st -e ghci" (title=? "ghci") generalLayout
    , NS "generalTerm" "st -c generalTerm" (className=? "generalTerm") generalLayout
    , NS "pavucontrol" "pavucontrol" (className=? "Pavucontrol") generalLayout
    , NS "cmus" "st -c mymusic -e cmus" (className=? "mymusic") generalLayout
    , NS "python-repl" "st -e python3" (title=? "python3") generalLayout
    ]
        where
            generalLayout = customFloating $ W.RationalRect l t w h
                where
                    l = 1/6
                    t = 1/6
                    w = 2/3
                    h = 2/3
                    

myXPConfig :: XPConfig 
myXPConfig = def 
    { font = "xft:Fira Sans Medium:pixelsize=18"
    , position = CenteredAt 0.5 0.5
    , bgColor = "#1d2021"
    , fgColor = "#d79921"
    , borderColor = "red"
    , height = 50
    }

    
-- All event handlers.
myEventHook =  handleEventHook def 
            <+> fullscreenEventHook 

-- Layout config.
nmaster = 1
delta = 3/100
ratio = 1/2

baseTiled = renamed [Replace "Tall"] 
        $ mySpacing 2 
        $ maximize
        $ Tall nmaster delta ratio
threeCol = renamed [Replace "ThreeCol"] 
        $ maximize
        $ ThreeColMid nmaster delta ratio
centeredMaster = renamed [Replace "Centered Master"]
        $ magicFocus
        $ maximize
        $ ThreeColMid nmaster delta ratio
threeCol2 = renamed [ Replace "ThreeCol2"]
        $ magnifiercz 1.2 
        $ maximize
        $ ThreeColMid nmaster delta ratio
centeredMaster2 = renamed [Replace "Centered Master 2"]
        $ magicFocus 
        $ maximize
        $ magnifiercz 1.2
        $ ThreeColMid nmaster delta ratio

-- all the layouts.
myLayouts = baseTiled 
        ||| centeredMaster
        ||| centeredMaster2 
        ||| threeCol
        ||| threeCol2
        ||| Full 
        ||| tabbed shrinkText (theme darkTheme)
        ||| simpleFloat
        ||| Accordion
        ||| Mirror Accordion

-- my layout hook.
myLayoutLayoutHook = smartBorders . avoidStruts $ myLayouts


-- Manage Hook
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = namedScratchpadManageHook myScratchpads


-- Emacs style keybinds.
myKeys :: [(String, X())]
myKeys = 
    [
    -- Launchers/Prompts
     ("M-/", spawn "rofi -show combi")
    ,("C-M1-m", manPrompt myXPConfig)
    ,("C-M1-b", promptSearch myXPConfig braveSearch)
    ,("C-M1-w", Win.windowPrompt myXPConfig { autoComplete = Just 500000 } Goto Win.allWindows)
    ,("C-M1-q", selectSearch googleSearch)
    -- Show all running applications and navigate to them.
    ,("M1-<Tab>", goToSelected def)
    --  Applications
    ,("C-M1-t", spawn "alacritty")
    ,("C-M1-s", spawn "deepin-screenshot")
    -- Layout
    ,("C-M-j", decWindowSpacing 4) -- Decrease window spacing
    ,("C-M-k", incWindowSpacing 4) -- Increase window spacing
    ,("C-M-h", decScreenSpacing 4) -- Decrease screen spacing
    ,("C-M-l", incScreenSpacing 4) -- Increase screen spacing
    ,("C-M-;", withFocused (sendMessage . maximizeRestore))
    -- Keeping this one differnt for convenience.
    ,("C-<Return>", namedScratchpadAction myScratchpads "generalTerm")
    -- Scratchpads keybinding group -> Mod-s
    ,("M-s h", namedScratchpadAction myScratchpads "htop")
    ,("M-s c", namedScratchpadAction myScratchpads "calculator")
    ,("M-s p", namedScratchpadAction myScratchpads "pavucontrol")
    ,("M-s m", namedScratchpadAction myScratchpads "cmus")
    ,("M-s r", namedScratchpadAction myScratchpads "python-repl")
    -- Fn keys.
    ,("<XF86MonBrightnessUp>", spawn "lux -a 10%")
    ,("<XF86MonBrightnessDown>", spawn "lux -s 10%")
    ,("<XF86ScreenSaver>", spawn "slock")
    ]

myXmobarPP :: PP
myXmobarPP = xmobarPP {
      ppHidden          = xmobarColor "#666666" "#222222" . pad
    , ppVisible         = xmobarColor "#ffffff" "#666666" . pad
    , ppCurrent         = xmobarColor "#ffffff" "#E66752" . pad
    , ppHiddenNoWindows = const []
    , ppUrgent          = xmobarColor "red"     "yellow"
    , ppLayout          = xmobarColor "#5f5f5f" "#222222"
    , ppSep             = " | "
    , ppWsSep           = []
    }


myConfig = def
    { modMask = myModKey
    , layoutHook = myLayoutLayoutHook 
    , startupHook = myStartupHook
    , handleEventHook = myEventHook
    , manageHook = myManageHook
    , terminal = myTerminal3
    , focusFollowsMouse = False
    , focusedBorderColor = "#00ff00"
    } `additionalKeysP` myKeys

main :: IO()
main = xmonad 
     . ewmh 
     =<< statusBar "xmobar ~/.config/xmobar/xmobarrc" myXmobarPP toggleStrutsKey myConfig
    where
        toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
        toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)

-- main :: IO ()
-- main = do 
--     xmproc0 <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
--     xmproc1 <- spawnPipe "xmobar -x 1 ~/.config/xmobar/xmobarrc"
--     xmonad $ ewmh def { modMask = mod4Mask -- Rebind Super as Mod key
--     , layoutHook = myLayouts -- My custom layout
--     , startupHook = myStartupHook -- All the startup hooks
--     , logHook = dynamicLogWithPP $ xmobarPP 
--         { ppOutput = \x -> hPutStrLn xmproc0 x
--                         >> hPutStrLn xmproc1 x
--         }
--     } `additionalKeysP` myKeys
