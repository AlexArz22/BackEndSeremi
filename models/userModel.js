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
  },

 findByRut: (rut, callback) => {
  db.query('SELECT * FROM usuarios WHERE rut = ?', [rut], (err, results) => {
    if (err) return callback(err);
    if (results.length === 0) return callback(null, null);
    return callback(null, results[0]);
  });
},

update: (rut, userData, callback) => {
  db.query('UPDATE usuarios SET ? WHERE rut = ?', [userData, rut], (err, result) => {
    if (err) return callback(err);
    return callback(null, result);
  });
},

delete: (rut, callback) => {
  db.query('DELETE FROM usuarios WHERE rut = ?', [rut], (err, result) => {
    if (err) return callback(err);
    return callback(null, result);
  });
}
};

module.exports = UserModel;
