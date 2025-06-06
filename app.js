const express = require('express');
const cors = require('cors');
const userRoutes = require('./routes/userRoute');

const app = express();

app.use(cors());
app.use(express.json());
app.use('/usuarios', userRoutes);
config={SERVER:"localhost",PORT:3000}
const PORT = config.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor escuchando en http://localhost:${PORT}`);
});