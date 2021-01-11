const { Client } = require('@elastic/elasticsearch')
const client = new Client({ 
    node: 'http://localhost:9200' 
})
const port = 8081;

var express = require('express');
var app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());

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

//POST METHOD TO UPDATE USER INFOS (NOM, PRENOM, ABOUT)
app.post('/updateUserInfos', function (req, res) {
    req.header('Content-type', 'application/json');
    
    client.update({
        index: 'researchers',
        id: req.body.id,
        body: {
            script: {
              source: "if(params.nom != '') {ctx._source.nom = params.nom;} if(params.prenom != '') {ctx._source.prenom = params.prenom;} if(params.about != '') {ctx._source.about = params.about;}",
              lang: 'painless',
              params: {
                  nom: req.body.nom,
                  prenom: req.body.prenom,
                  about: req.body.about
              }
            }
          }
    }, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            return res.status(200).send({
                message: 'Successfully updated nom / prenom / about'
            })
        }
    }); 
})

//POST METHOD TO UPDATE SOCIAL MEDIA PROFILES
app.post('/updateSocialMedia', function (req, res) {
    req.header('Content-type', 'application/json');
    
    client.update({
        index: 'researchers',
        id: req.body.id,
        body: {
            script: {
              source: "if(params.name == 'Facebook') {ctx._source.facebook = params.identifier;} if(params.name == 'LinkedIn') {ctx._source.linkedin = params.identifier;} if(params.name == 'Twitter') {ctx._source.twitter = params.identifier;} if(params.name == 'Orcid') {ctx._source.orcid = params.identifier;}",
              lang: 'painless',
              params: {
                  name: req.body.social_media,
                  identifier: req.body.identifier
              }
            }
          }
    }, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            return res.status(200).send({
                message: 'Successfully updated social media profiles'
            })
        }
    }); 
})

app.post('/removeSocialMedia', function (req, res) {
    req.header('Content-type', 'application/json');
    
    client.update({
        index: 'researchers',
        id: req.body.id,
        body: {
            script: {
              source: "if(params.name == 'Facebook') {ctx._source.facebook = '';} if(params.name == 'LinkedIn') {ctx._source.linkedin = '';} if(params.name == 'Twitter') {ctx._source.twitter = '';} if(params.name == 'Orcid') {ctx._source.orcid = '';}",
              lang: 'painless',
              params: {
                  name: req.body.social_media
              }
            }
          }
    }, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            return res.status(200).send({
                message: 'Successfully removed social media id'
            })
        }
    }); 
})

app.listen(port, () => {console.log('listening on port ' + port)});