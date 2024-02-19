# GasCert

This flutter application aims to simplify the data entry process for Gas Safety certificates. 

The application uses numerous packages to achieve the intended goal, including flutter_pdfview to create and view PDF files that contain user entered data, image_picker to allow for the custom entry of user company
logos, and cloud_firestore to enable the application to store and access data using the Firestore cloud database. 

The application contains pages to allow for data entry which include sub-pages for each section of the Gas Safety certificate, and a page to view previous reports created by a user, which includes a search feature to filter reports, any report can be clicked on in this page to view the data contained within the report or to turn the report into a PDF file which can be shared externally or printed. 

## Example Images:
![New Project](https://github.com/liiiiamb/gascert-code/assets/82280429/aa6f9690-327f-4a43-a872-c076d868ffec)

## Future Work: 
- **Currently** - working on adding in more data stored within the Firebase collection to the created PDF file, and using the pdf package to reposition elements within the file. 
- Implement a way to allow users to create a future report that includes previous report data.
- Allow users to backup all data externally to cloud-based services such as Google Drive or Dropbox - currently users are only able to backup locally.
- Implement an invoice creation feature after a report has been created.
- Implement further settings of the application including language changing and notification usage. 
