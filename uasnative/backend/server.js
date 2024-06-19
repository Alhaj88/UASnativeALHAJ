// server.js
const express = require('express');
const mongoose = require('mongoose');
const userRoutes = require('./routes/user');

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// MongoDB connection
mongoose.connect('mongodb+srv://Native:Native@cluster0.dv6zjnq.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0', {
  useNewUrlParser: true,
  useUnifiedTopology: true
}).then(() => {
  console.log('Connected to MongoDB');
}).catch(err => {
  console.error('Failed to connect to MongoDB', err);
});

// Routes
app.use('/api/users', userRoutes);

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Start server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
