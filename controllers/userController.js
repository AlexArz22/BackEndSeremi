const UserModel = require('../models/userModel'); 
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const config = require('../config/config'); 

const UserController = {
  index: (req, res) => {
    UserModel.getAll((err, results) => {
      if (err) return res.status(500).json({ error: err });
      res.json(results);
    });
  },

  store: async (req, res) => {
    try {
      const {
        rut,
        nombre,
        apellido,
        contrasenia, 
        email,
        region,
        comuna,
        direccion,
        terminos
      } = req.body;

      if (!rut || !nombre || !apellido || !contrasenia || !email || terminos !== 1) {
        return res.status(400).json({ message: 'Faltan datos requeridos o términos no aceptados' });
      }

      const hashedPassword = await bcrypt.hash(contrasenia, 10);

      const newUser = {
        rut,
        nombre,
        apellido,
        contrasenia: hashedPassword,
        email,
        region,
        comuna,
        direccion,
        terminos
      };

      UserModel.create(newUser, (err, result) => {
        if (err) return res.status(500).json({ error: err });
        res.status(201).json({ rut: newUser.rut, email: newUser.email });
      });
    } catch (error) {
      res.status(500).json({ message: 'Error al registrar usuario', error });
    }
  },

  login: async (req, res) => {
    try {
      const { email, contrasenia } = req.body;

      if (!email || !contrasenia) {
        return res.status(400).json({ message: 'Email y contraseña son requeridos' });
      }

      UserModel.findByEmail(email, async (err, user) => {
        if (err) return res.status(500).json({ message: 'Error en la base de datos' });
        if (!user) return res.status(401).json({ message: 'Credenciales inválidas' });

        const passwordMatch = await bcrypt.compare(contrasenia, user.contrasenia);
        if (!passwordMatch) {
          return res.status(401).json({ message: 'Credenciales inválidas' });
        }

        const token = jwt.sign(
          { rut: user.rut, email: user.email },
          config.secretKey,
          { expiresIn: '1h' }
        );
        res.json({ token });
      });
    } catch (error) {
      res.status(500).json({ message: 'Error al iniciar sesión', error });
    }
  },

 show: (req, res) => {
  const { rut } = req.params;
  UserModel.findByRut(rut, (err, user) => {
    if (err) return res.status(500).json({ error: err });
    if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });
    res.json(user);
  });
},

update: async (req, res) => {
  const { rut } = req.params;
  const userData = req.body;

  if (userData.contrasenia) {
    userData.contrasenia = await bcrypt.hash(userData.contrasenia, 10);
  }

  UserModel.update(rut, userData, (err, result) => {
    if (err) return res.status(500).json({ error: err });
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }
    res.json({ message: 'Usuario actualizado correctamente' });
  });
},

destroy: (req, res) => {
  const { rut } = req.params;

  UserModel.delete(rut, (err, result) => {
    if (err) return res.status(500).json({ error: err });
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }
    res.json({ message: 'Usuario eliminado correctamente' });
  });
}

};

module.exports = UserController;
