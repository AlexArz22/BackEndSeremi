const UserModel = require('../models/userModel');

const UserController = {
  index: (req, res) => {
    UserModel.getAll((err, results) => {
      if (err) return res.status(500).json({ error: err });
      res.json(results);
    });
  },
  store: (req, res) => {
    const newUser = req.body;
    UserModel.create(newUser, (err, result) => {
      if (err) return res.status(500).json({ error: err });
      res.status(201).json({ id: result.insertId, ...newUser });
    });
  }
};

module.exports = UserController;