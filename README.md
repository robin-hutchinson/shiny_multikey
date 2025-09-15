# shiny_multikey
Building a shiny app for developing a polythetic keys

The example is set up to identify flies in the genera Phalacrotophora (Diptera: Phoridae). To create a shiny app for your own taxon group, follow these steps:

1) Fork the repository
2) Go to the shiny/key subdirectory 
3) In features.csv, add the questions and features relevant to your taxa:
   taxa = the taxon you are keying to
   body_section = the part of the body the feature is on. This corresponds to a tab in the shiny app
   body_part = the specific body part within the section that the question features
   question = the question you need the person using the key to look for
   answer = the correct answer for this taxon
4) In images.csv, add the instructions for accessing the images for each tab:
   body_section = the part of the body the image is of. This corresponds to a tab in the shiny app
   image = the name of the image file
   jpeg = the file type
5) Navigate to the shiny/www directory and upload all of the images you referenced in images.csv
6) In build/create_ui.R, update the title and window title of your shiny app (in line 8)
7) Once you are happy with your changes, go to actions/workflows/build_app.yml and run the workflow. This will take some time  (approx. 20 minutes) as it requires creating a virtual R environment.
8) Visit your new shiny app by visiting the "Deployments" page (available in the about section of the Code tab)

There are still elements that it would be great to add (e.g. github version information available through the app, so it is clear which version of the key is being used), feel free to work on the other parts of the repository to improve the keys!
