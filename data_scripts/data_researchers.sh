#!/bin/bash

curl -X POST 'http://127.0.0.1:9200/_bulk' \
  -H 'Content-Type: application/json' \
  -d '
{"create": { "_id": "1", "_index": "researchers" } }
{ "nom": "Généreux", "prenom": "Hugh", "about": "I am a machine learning specialist, and a great cook!", "facebook": "Hugh Généreux", "linkedin": "Hugh Généreux", "twitter": "H_Généreux",	"orcid": "Hugh Généreux", "affiliations": [{ "organisation": "Commissariat à l\u0027énergie atomique", "equipe": "Equipe de recherche en fission nucléaire", "dateDebut": "2020-01-06", "dateFin": null, "pays": "France" }]}

{"create": { "_id": "2", "_index": "researchers" } }
{ "nom": "Correa Jr", "prenom": "Edilson", "about": "I am an NLP specialist, and a great football player!", "facebook": "Edilson Correa", "linkedin": "Edilson Correa", "twitter": "",	"orcid": "Edilson Correa Jr", "affiliations": [{ "organisation": "University of Sao Paulo", "equipe": "Machine Learning Team", "dateDebut": "2013-02-15", "dateFin": null, "pays": "Brésil" }]}

{"create": { "_id": "3", "_index": "researchers" } }
{ "nom": "Bengio", "prenom": "Yoshua", "about": "I am a neural network specialist, and a great musician!", "facebook": "Yoshua Bengio", "linkedin": "Yoshua Bengio", "twitter": "Yosh_Ben",	"orcid": "Yoshua Bengio", "affiliations": [{ "organisation": "University of Ottawa", "equipe": "Neural Network Elite Team", "dateDebut": "2015-06-30", "dateFin": "2017-01-31", "pays": "Canada" }, { "organisation": "University of Montréal", "equipe": "Picture processing team", "dateDebut": "2017-06-30", "dateFin": null, "pays": "Canada" }]}

{"create": { "_id": "4", "_index": "researchers" } }
{ "nom": "Martin", "prenom": "Frank", "about": "I am a chemistry specialist, and a great book-writer!", "facebook": "Frank Martin", "linkedin": "Frank Martin", "twitter": "",	"orcid": "", "affiliations": [{ "organisation": "University of Liverpool", "equipe": "Liverpool  Chemistry main Lab", "dateDebut": "2020-07-05", "dateFin": null, "pays": "Angleterre" }]}

{"create": { "_id": "5", "_index": "researchers" } }
{ "nom": "Smith", "prenom": "Selena", "about": "I am an infectious disease specialist, and a martial artist!", "facebook": "", "linkedin": "Selena Smith", "twitter": "sel_smith83",	"orcid": "Selena Smith", "affiliations": [{ "organisation": "University of New-York", "equipe": "New-York Infectious Disease Center", "dateDebut": "2014-01-01", "dateFin": null, "pays": "Etats-Unis" }]}



{"create": { "_id": "6", "_index": "researchers" } }
{ "nom": "Fritz", "prenom": "Hermann", "about": "I am a machine learning specialist!", "facebook": "Hermann Fritz", "linkedin": "", "twitter": "", "orcid": "", "affiliations": [{ "organisation": "University of Sao Paulo", "equipe": "Machine Learning Team", "dateDebut": "2013-02-15", "dateFin": null, "pays": "Brésil" }]}

{"create": { "_id": "7", "_index": "researchers" } }
{ "nom": "Muphy", "prenom": "Eddie", "about": "I am a movie specialist!", "facebook": "Ed Murphy", "linkedin": "Eddie Murphy", "twitter": "", "orcid": "", "affiliations": [{ "organisation": "University of New-York", "equipe": "New-York Infectious Disease Center", "dateDebut": "2014-01-01", "dateFin": null, "pays": "Etats-Unis" }]}

{"create": { "_id": "8", "_index": "researchers" } }
{ "nom": "Button", "prenom": "Benjamin", "about": "I am a picture specialist!", "facebook": "Benjamin Button", "linkedin": "", "twitter": "b_button", "orcid": "", "affiliations": [{ "organisation": "University of Ottawa", "equipe": "Neural Network Elite Team", "dateDebut": "2015-06-30", "dateFin": "2017-01-31", "pays": "Canada" }, { "organisation": "University of Montréal", "equipe": "Picture processing team", "dateDebut": "2017-06-30", "dateFin": null, "pays": "Canada" }]}

{"create": { "_id": "9", "_index": "researchers" } }
{ "nom": "Vaz", "prenom": "Fernand", "about": "I am a machine learning specialist!", "facebook": "", "linkedin": "", "twitter": "", "orcid": "Fernand Vaz", "affiliations": [{ "organisation": "Commissariat à l\u0027énergie atomique", "equipe": "Equipe de recherche en fission nucléaire", "dateDebut": "2020-01-06", "dateFin": null, "pays": "France" }]}

{"create": { "_id": "10", "_index": "researchers" } }
{ "nom": "Simpson", "prenom": "Aaron", "about": "I am a machine learning specialist!", "facebook": "Aaron Simpson", "linkedin": "", "twitter": "", "orcid": "", "affiliations": [{ "organisation": "University of Liverpool", "equipe": "Liverpool  Chemistry main Lab", "dateDebut": "2020-07-05", "dateFin": null, "pays": "Angleterre" }]}

'