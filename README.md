# ssg

## Description

This is a static site generator that uses the framework of cadars' [John Doe](https://github.com/cadars/john-doe), where the whole website is a single page, using Anchors and display:block to hide and show parts of the page. This page format is interesting to me as a way to build a small, manageable personal website in a simple way. Would make a great Resume or portfolio page.

The script takes as input a series of Markdown text files in the folder `./sections/`, and passes them to Pandoc for conversion to HTML. It then wraps the Pandoc output in a `<section>` tag, with an ID attribute equal to the name of the file passed in. For example, About.md will create `<section id="About">`. Each section also has a link added to the Nav element. These sections are then concatenated with head.html and foot.html to generate the full body of the page.

## Pre-Requisites:

Lua, the LuaFileSystem extension installable through LuaRocks, and Pandoc. I'm not sure if the pandoc integration works on windows.

## Usage:

Edit the files in templates/ to your liking - set up head.html with your site description, add any footer you like to foot.html, and put the content you want on the homepage into home.md. If you want to make changes to the stylesheet, edit style.css

Add site pages you want to be linked in the navbar to sections_nav/ as Markdown files. Add pages you don't want in the navbar to sections/. Then, run `lua ssg.lua`

The script will output as `output/index.html` and `output/style.css`. the output folder is gitignored, so you can set up your own git repo to sync to the static site host of your choice. 
