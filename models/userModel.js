const db = require('../config/db');

const UserModel = {
  getAll: (callback) => {
    db.query('SELECT * FROM usuarios', callback);
  },
  create: (user, callback) => {
    db.query('INSERT INTO usuarios SET ?', user, callback);
  }
};

module.exports = UserModel;