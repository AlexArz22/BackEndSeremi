const express = require('express');
const { body } = require('express-validator');
const router = express.Router();
const UserController = require('../controllers/userController');
const authenticateToken = require('../middlewares/authenticateToken');

const validateUser = [
  body('email').isEmail().withMessage('El email no es válido'),
  body('password').isLength({ min: 6 }).withMessage('La contraseña debe tener al menos 6 caracteres')
];

router.post('/', validateUser, UserController.store);
router.post('/login', UserController.login);

router.get('/', authenticateToken, UserController.index);

module.exports = router;
