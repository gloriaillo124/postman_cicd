echo 'lancer newman'
newman run "collections/collection1.json" -r cli,junit --reporter-junit-export results1.xml && \
newman run "collections/collection2.json" -r cli,junit --reporter-junit-export results2.xml
