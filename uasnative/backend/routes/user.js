// routes/user.js
const express = require('express');
const User = require('../models/User');
const router = express.Router();

// Register user
router.post('/register', async (req, res) => {
  const { username, email, password } = req.body;
  const newUser = new User({ username, email, password });
  try {
    await newUser.save();
    res.status(201).send('User registered');
  } catch (error) {
    res.status(400).send('Error registering user');
  }
});

// Login user
router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne({ email, password });
    if (user) {
      res.status(200).send('User logged in');
    } else {
      res.status(400).send('Invalid credentials');
    }
  } catch (error) {
    res.status(400).send('Error logging in user');
  }
});

module.exports = router;
