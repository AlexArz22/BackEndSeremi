function authorizeRole(requiredRole) {
  return (req, res, next) => {
    if (req.user.rol !== requiredRole) {
      return res.status(403).json({ message: 'Acceso denegado. No tiene permiso.' });
    }
    next();
  };
}

module.exports = authorizeRole;
