[[
        Injects everything that ends in *.tex from ./content/
        in alphabetical ascending order. Essentially "\input{content/*.tex}"
    ]]

local contents = {}
for file in lfs.dir("content") do
    if file:match".tex$" then
        table.insert(contents, file)
    end
end
table.sort(contents)
for _, file in ipairs(contents) do
    tex.print("\\input{content/"..file.."}")
end
