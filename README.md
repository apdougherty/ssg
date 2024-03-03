# ssg

## Description

This is a static site generator that uses the framework of cadars' [John Doe](https://github.com/cadars/john-doe), where the whole website is a single page, using Anchors and display:block to hide and show parts of the page. This page format is interesting to me as a way to build a small, manageable personal website in a simple way. Would make a great Resume or portfolio page.

The script is currently incomplete - the following paragraph is aspirational, not descriptive.

The script takes as input a series of Markdown text files in the folder `./sections/`, and passes them to Pandoc for conversion to HTML. It then wraps the Pandoc output in a `<section>` tag, with an ID attribute equal to the name of the file passed in. For example, About.md will create `<section id="About">`. Each section also has a link added to the Nav element. These sections are then concatenated with head.html and foot.html to generate the full body of the page.

## Development Roadmap:

- [x] Write basic HTML elements - Head and Foot.

- [x] Set up the script to run with a set of static HTML files in ./sections/ as input.

- [x] Change the script to accept arbitrary number/names of HTML files as inputs

- [x] Have the for loop update the Nav element, as well.

- [ ] Clean up intermediate files

- [ ] Set up separate folders for Nav and Non-nav Pages.
 
- [ ] figure out how I'm going to integrate Pandoc into this thing.
