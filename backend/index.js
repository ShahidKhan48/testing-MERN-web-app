const express = require('express');
const app = express();
const PORT = 5000;

app.get('/api', (req, res) => {
    res.json({ message: "Welcome to the backend API!" });
});

app.listen(PORT, () => {
    console.log(`Backend running on http://localhost:${PORT}`);
});
