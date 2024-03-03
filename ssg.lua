local lfs = require("lfs")

os.execute("pandoc -o home.html templates/home.md")

io.input("home.html")
local body = io.open("body.html", "w")
local t = io.read("*a")
body:write("<section id=\"home\">\n", t, "</section>\n")

local nav = io.open("nav.html", "w")
nav:write("<header>\n",
 "\t<h1>\n",
  "\t\t<a href=\"#home\">Site Title</a>\n",
  "\t</h1>\n",
  "\t<nav>\n")

for file in lfs.dir("sections_nav/") do
  if file ~="." and file ~=".." then
    local dotIndex = string.find(file, "%.") - 1
    local sectionName = string.sub(file, 1, dotIndex)
    os.execute("pandoc -o " .. sectionName .. ".html sections_nav/" .. sectionName ..".md")
    io.input(sectionName .. ".html")
    t = io.read("*a")
    body:write("<section id=\"", sectionName, "\">\n", t, "</section>\n")
    nav:write("\t\t<a href=\"#", sectionName, "\">", sectionName, "</a>\n")
    os.remove(sectionName .. ".html")
  end
end

nav:write("\t</nav>\n</header>\n<main>\n")

for file in lfs.dir("sections/") do
  if file ~="." and file ~=".." then
    local dotIndex = string.find(file, "%.") - 1
    local sectionName = string.sub(file, 1, dotIndex)
    os.execute("pandoc -o " .. sectionName .. ".html sections/" .. sectionName ..".md")
    io.input(sectionName .. ".html")
    t = io.read("*a")
    body:write("<section id=\"", sectionName, "\">\n", t, "</section>\n")
    os.remove(sectionName .. ".html")
  end
end

io.close(body)
io.close(nav)

io.input("templates/head.html")
t = io.read("*a")
io.output("output/index.html")
io.write(t)

io.input("nav.html")
t = io.read("*a")
io.write(t)

io.input("body.html")
t = io.read("*a")
io.write(t)

io.input("templates/foot.html")
t = io.read("*a")
io.write(t)

os.remove("nav.html")
os.remove("body.html")
os.remove("home.html")

io.input("templates/style.css")
io.output("output/style.css")
t = io.read("*a")
io.write(t)
