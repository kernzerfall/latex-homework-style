[[
    Defines printMinted that can be used to print the text between
    two lines from a code file. The default implementation is for haskell.
    In LuaTeX, just do
    \directlua{dofile('selprc.lua')} in the preamble and then
    \directlua{
      printminted('path/to/file.hs', '3a')
    }  
  ]]

function textbetween(text, sdelim, edelim)
  if not text:find(edelim=="end" and "$" or edelim) then edelim = "end" end
  local re = (sdelim=="start" and "^" or sdelim) .. "(.-)" .. (edelim=="end" and "$" or edelim)
  return text:match(re) or ""
end

function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

function printMinted(file, exercise)
    local fcon = readAll(file)
    local target = textbetween(fcon,
      "{---- exercise "..exercise.." ----}",
      "{---- /exercise "..exercise.." ----}")

    -- remove first and last newlines
    target = string.sub(target, 2, string.len(target) - 1)

    tex.print("\\begin{minted}[linenos]{haskell}")
    tex.print("{- selprc.lua: exercise ".. exercise .." -}")
    tex.print(target)
    tex.print("\\end{minted}")
end

function testPrintMinted(file, exercise)
    local fcon = readAll(file)
    local target = textbetween(fcon,
      "{---- exercise "..exercise.." ----}",
      "{---- /exercise "..exercise.." ----}")
    print("\\begin{minted}[linenos]{haskell}")
    print("{- selprc.lua: exercise "..exercise.." -}")
    print(target)
    print("\\end{minted}")
end
