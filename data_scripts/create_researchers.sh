#!/bin/bash

curl -X PUT 'http://127.0.0.1:9200/researchers' \
	-H 'Content-Type: application/json' \
	-d '
{
	"mappings": {
		"properties": {
			"nom": {
				"type": "completion"
			},
			"prenom": {
				"type": "completion"
			},
			"about": {
				"type": "text"
			},
			"facebook": {
				"type": "keyword"
			},
			"linkedin": {
				"type": "keyword"
			},
			"twitter": {
				"type": "keyword"
			},
			"orcid": {
				"type": "keyword"
			},
			"affiliations": {
				"type": "nested",
				"properties": {
					"organisation": {
						"type": "keyword"
					},
					"equipe": {
						"type": "keyword"
					},
					"dateDebut": {
						"type": "date",
						"format": "yyyy-MM-dd"
					},
					"dateFin": {
						"type": "date",
						"format": "yyyy-MM-dd"
					},
					"pays": {
						"type": "keyword"
					}
				}
			}
		}
	}
}
'