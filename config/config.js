require('dotenv').config();

module.exports = {
  port: process.env.PORT || 3000,
  secretKey: process.env.SECRET_KEY || 'tu_clave_secreta',
  dbHost: process.env.DB_HOST || 'localhost',
  dbUser: process.env.DB_USER || 'root',
  dbPassword: process.env.DB_PASSWORD || '',
  dbName: process.env.DB_NAME || 'Seremi'
};
