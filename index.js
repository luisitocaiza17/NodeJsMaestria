const express= require('express');
const app = express();
//middle ware (trigers en la app)
app.use(express.json());
app.use(express.urlencoded());

//routes (rutas)
app.use(require('./src/router/index'));
app.listen(5000);
console.log('Servidor corrriendo por el puerto 5000');
