const express = require('express');
const app = express();
<<<<<<< HEAD
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Node.js App!');
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Server running at http://localhost:${port}`);
=======
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send('Hello, Dockerized Node.js App!');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
>>>>>>> f30a208 (Initial commit)
});
