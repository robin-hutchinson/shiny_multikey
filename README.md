# shiny_multikey
Building a shiny app for online multiple entry keys

The example is set up to identify flies in the genera Phalacrotophora (Diptera: Phoridae). To create a shiny app for your own taxon group, follow these steps:

1) Click "Use this template" to create a new version of the repo on your page.
2) Go to the shiny/key subdirectory 
3) In features.csv, add the questions and features relevant to your taxa:\
   taxa = the taxon you are keying to\
   body_section = the part of the body the feature is on. This corresponds to a tab in the shiny app\
   body_part = the specific body part within the section that the question features\
   question = the question you need the person using the key to look for\
   answer = the correct answer for this taxon
4) In images.csv, add the instructions for accessing the images for each tab:\
   body_section = the part of the body the image is of. This corresponds to a tab in the shiny app\
   image = the name of the image file\
   jpeg = the file type
5) Navigate to the shiny/www directory and upload all of the images you referenced in images.csv
6) In the text folder, update the title, introduction and instructions for your shiny app.
7) Once you are happy with your changes, wait for the changes to be pushed through to server.R and ui.R by the workflow. You can check on the progress in the Actions tab.
8) Visit your new shiny app through the "About" section in the code page.
