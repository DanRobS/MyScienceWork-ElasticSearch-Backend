#!/bin/bash

curl -X PUT 'http://127.0.0.1:9200/publications' \
	-H 'Content-Type: application/json' \
	-d '
{
	"mappings": {
		"properties": {
			"titre": {
				"type": "completion"
			},
			"auteurs": {
				"type": "nested"
			},
			"annee": {
				"type": "completion"
			},
			"langue": {
				"type": "keyword"
			}
		}
	}
}
'