const express = require('express');
const { body } = require('express-validator');
const router = express.Router();
const UserController = require('../controllers/userController');
const authenticateToken = require('../middlewares/authenticateToken');
const authorizeRoles = require('../middlewares/authorizeRole');

const validateUser = [
  body('email').isEmail().withMessage('El email no es válido'),
  body('password').isLength({ min: 6 }).withMessage('La contraseña debe tener al menos 6 caracteres')
];


router.post('/', validateUser, UserController.store);
router.post('/login', UserController.login);

router.get('/', authenticateToken, authorizeRoles('admin'), UserController.index);

router.get('/:rut', authenticateToken, authorizeRoles('admin'), UserController.show);
router.put('/:rut', authenticateToken, authorizeRoles('admin'), validateUser, UserController.update);
router.delete('/:rut', authenticateToken, authorizeRoles('admin'), UserController.destroy);

module.exports = router;
