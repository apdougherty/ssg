local lfs = require("lfs")

io.input("head.html")
local t = io.read("*a")
io.output("output/index.html")
io.write(t)

for file in lfs.dir("sections/") do
  if file ~="." and file ~=".." then
    local dotIndex = string.find(file, "%.") - 1
    print(dotIndex)
    local sectionName = string.sub(file, 1, dotIndex)
    io.input("sections/" .. file)
    t = io.read("*a")
    io.write("<section id=\"", sectionName, "\">\n", t, "</section>\n")
  end
end

io.input("foot.html")
t = io.read("*a")
io.write(t)
