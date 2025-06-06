const db = require('../config/db');

const UserModel = {
  getAll: (callback) => {
    db.query('SELECT * FROM usuarios', callback);
  },

  create: (user, callback) => {
    db.query('INSERT INTO usuarios SET ?', user, callback);
  },

  findByEmail: (email, callback) => {
    db.query('SELECT * FROM usuarios WHERE email = ?', [email], (err, results) => {
      if (err) return callback(err);
      if (results.length === 0) return callback(null, null);
      return callback(null, results[0]);
    });
  }
};

module.exports = UserModel;
