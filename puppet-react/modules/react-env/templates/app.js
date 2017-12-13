var express = require('express');
var app = express();
var path = require('path');
var CLIENT_DIR = path.resolve(__dirname, '..', 'client');

app.use(express.static(CLIENT_DIR));
app.get('/', (req, res) => res.sendFile(CLIENT_DIR + '/index.html'));
app.listen(3000, () => console.log('Example app listening on port 3000!'));
