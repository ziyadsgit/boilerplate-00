'use strict';

const express = require('express');
const compression = require('compression');
const path = require('path');

// Constants
const PORT = 8081;
const HOST = '0.0.0.0';

// App
const app = express();

// Middleware
app.use(compression())

// Middleware for serving static files
app.use('/', express.static(path.join(__dirname, 'public')))
app.use(express.static('public'));

app.listen(PORT, HOST);

console.log(`Running on http://${HOST}:${PORT}`);