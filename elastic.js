const { Client } = require('@elastic/elasticsearch')
const client = new Client({ 
    node: 'http://localhost:9200' 
})
const port = 8081;

var express = require('express');
var app = express();

app.use((req, res, next) => {

    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type');

    next();
})

//GET METHOD FOR AUTOCOMPLETE USER SEARCH FIELD
app.get('/getUser/:username', function (req, res) {
    req.header('Content-type', 'application/json');
    
    client.search({
        index: 'researchers',
        body: {
            suggest: {
                suggest_nom: {
                    prefix: req.params.username,        
                    completion: {         
                        field: 'nom'  
                    }
                },
                suggest_prenom: {
                    prefix: req.params.username,        
                    completion: {         
                        field: 'prenom'  
                    }
                }
            }
        }
    }, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            console.log(result.body.suggest)
            return res.status(200).send(
                result.body.suggest
            )
        }
    }); 
})

//GET METHOD TO GET A USER BY HIS ID
app.get('/getUserById/:id', function (req, res) {
    req.header('Content-type', 'application/json');
    
    client.search({
        index: 'researchers',
        body: {
            query: {
              nested: {
                path: 'affiliations',
                query: {
                  match: {
                    _id: req.params.id
                  }
                },
                inner_hits: {
                  sort: [
                    {
                      'affiliations.dateDebut': {
                        order: 'desc'
                      }
                    }
                  ]
                }
              }
            }
          }
    }, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            console.log(result.body.hits.hits[0])
            return res.status(200).send(
                result.body.hits.hits[0]
            )
        }
    }); 
})

app.listen(port, () => {console.log('listening on port ' + port)});