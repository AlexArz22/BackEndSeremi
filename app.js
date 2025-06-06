const express = require('express');
const cors = require('cors');
const userRoutes = require('./routes/userRoute');
const config = require('./config/config');
const app = express();

app.use(cors());

app.use((req, res, next) => {
  console.log(`Método: ${req.method} | Ruta: ${req.path}`);
  next();
});

app.use(express.json());

app.use('/usuarios', userRoutes);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.status || 500).json({
    status: err.status || 500,
    message: err.message || 'Error interno del servidor'
  });
});

const PORT = config.port || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor escuchando en http://localhost:${PORT}`);
});
