#!/bin/bash

curl -X POST 'http://127.0.0.1:9200/_bulk' \
  -H 'Content-Type: application/json' \
  -d '
{"create": { "_id": "1", "_index": "publications" } } 
{ "titre": "Radioactive materials and their effects to health", "auteurs": [{ "nom": "Edilson Correa Jr" }, { "nom": "Yoshua Bengio" }], "annee": "2016", "langue": "ENG"}

{"create": { "_id": "2", "_index": "publications" } } 
{ "titre": "Patterns of authors contribution in scientific manuscripts", "auteurs": [{ "nom": "Hugh Généreux" }, { "nom": "Frank Martin" }, { "nom": "Selena Smith" }], "annee": "2017", "langue": "ENG"}

{"create": { "_id": "3", "_index": "publications" } } 
{ "titre": "Energy and Policy Considerations for Deep Learning in NLP", "auteurs": [{ "nom": "Yoshua Bengio" }, { "nom": "Frank Martin" }, { "nom": "Edilson A. Corrêa Jr" }], "annee": "2010", "langue": "ENG"}

{"create": { "_id": "4", "_index": "publications" } } 
{ "titre": "Grid Information Services for Distributed Resource Sharing", "auteurs": [{ "nom": "Hugh Généreux" }, { "nom": "Frank Martin" }, { "nom": "Selena Smith" }], "annee": "2009", "langue": "FR"}

{"create": { "_id": "5", "_index": "publications" } } 
{ "titre": "The impact of COVID-19 lockdown on food priorities", "auteurs": [{ "nom": "Hugh Généreux" }, { "nom": "Frank Martin" }, { "nom": "Yoshua Bengio" }], "annee": "2013", "langue": "ENG"}

{"create": { "_id": "6", "_index": "publications" } } 
{ "titre": "Machine learning: Trends, perspectives, and prospects", "auteurs": [{ "nom": "Hugh Généreux" }, { "nom": "Frank Martin" }, { "nom": "Selena Smith" }], "annee": "2015", "langue": "ENG"}

{"create": { "_id": "7", "_index": "publications" } } 
{ "titre": "Discussao sobre modelos de funçoes continuas aproximadas a dados discretos com uso de interface criada a partir do software scilab ", "auteurs": [{ "nom": "Edilson Correa Jr" }, { "nom": "Frank Martin" }, { "nom": "Selena Smith" }], "annee": "2013", "langue": "PT"}

{"create": { "_id": "8", "_index": "publications" } } 
{ "titre": "La fission nucléaire expliquée par l\u0027exemple", "auteurs": [{ "nom": "Hugh Généreux" }, { "nom": "Edilson A. Corrêa Jr" }, { "nom": "Selena Smith" }], "annee": "2019", "langue": "FR"}
'