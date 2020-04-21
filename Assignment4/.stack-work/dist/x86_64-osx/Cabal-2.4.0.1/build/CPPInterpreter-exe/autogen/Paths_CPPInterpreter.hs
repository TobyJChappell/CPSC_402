{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_CPPInterpreter (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/tobychappell/Documents/CPSC_Courses/CPSC_402/Assignment4/.stack-work/install/x86_64-osx/b2bb4e8b98071a63a5457159c9586658df03c16eb3a0bb05c4edf54279381df3/8.6.4/bin"
libdir     = "/Users/tobychappell/Documents/CPSC_Courses/CPSC_402/Assignment4/.stack-work/install/x86_64-osx/b2bb4e8b98071a63a5457159c9586658df03c16eb3a0bb05c4edf54279381df3/8.6.4/lib/x86_64-osx-ghc-8.6.4/CPPInterpreter-0.1.0.0-5IcZM4HUEES2lnyYQgXuit-CPPInterpreter-exe"
dynlibdir  = "/Users/tobychappell/Documents/CPSC_Courses/CPSC_402/Assignment4/.stack-work/install/x86_64-osx/b2bb4e8b98071a63a5457159c9586658df03c16eb3a0bb05c4edf54279381df3/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/tobychappell/Documents/CPSC_Courses/CPSC_402/Assignment4/.stack-work/install/x86_64-osx/b2bb4e8b98071a63a5457159c9586658df03c16eb3a0bb05c4edf54279381df3/8.6.4/share/x86_64-osx-ghc-8.6.4/CPPInterpreter-0.1.0.0"
libexecdir = "/Users/tobychappell/Documents/CPSC_Courses/CPSC_402/Assignment4/.stack-work/install/x86_64-osx/b2bb4e8b98071a63a5457159c9586658df03c16eb3a0bb05c4edf54279381df3/8.6.4/libexec/x86_64-osx-ghc-8.6.4/CPPInterpreter-0.1.0.0"
sysconfdir = "/Users/tobychappell/Documents/CPSC_Courses/CPSC_402/Assignment4/.stack-work/install/x86_64-osx/b2bb4e8b98071a63a5457159c9586658df03c16eb3a0bb05c4edf54279381df3/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "CPPInterpreter_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "CPPInterpreter_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "CPPInterpreter_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "CPPInterpreter_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "CPPInterpreter_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "CPPInterpreter_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
