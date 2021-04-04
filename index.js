require('dotenv').config();
//trae expres y lo inicia en app
const express = require ('express');
const app = express();
const jwt = require('jsonwebtoken');
const expressJwt= require('express-jwt');
const conexion = require('./conexion')
const bcrypt = require('bcryptjs');
const sequelize = require('./conexion');

//agregar middleware para trasformar todo a JSON
app.use(express.json());

app.use(expressJwt({secret: process.env.jwt_pass, algorithms:['HS256']})
.unless({
    path:['/login', '/registrar'] // se protegen estas rutas
}));

//se crea login
app.post('/login', async (req,res) => {
    
    const { nombre_usuario, contrasena } = req.body;
    
    let result

    try {
        result = await conexion.query('SELECT * FROM usuario WHERE nombre_usuario = ? OR email = ?', {
            type: sequelize.QueryTypes.SELECT,
            replacements : [ nombre_usuario, nombre_usuario ]
        });    

        console.log(result);

        if(result.length >  0 && bcrypt.compareSync(contrasena, result[0].contrasena)) {
            const{ nombre_apellido, email, direccion_envio, esAdministrador, id } = result[0]
            // console.log(result[0]);
    
            let usuario = { 
                nombre_apellido, 
                email, 
                direccion_envio, 
                esAdministrador,
                id
            }
    
            const token = jwt.sign({ usuario }, process.env.jwt_pass);
            res.send(token);
        } else { //si no, el usuario o cont. estàn malos
            res.status(401).json('usuario y/o contraseña incorrectas');
        }

    } catch (error) {
        console.log(error);
        console.log("ERROR");
        res.status(500)
        res.send("Error interno")
    }

});

// se crea registrar
app.post('/registrar', async (req,res) => {
const {
    nombre_usuario,
    nombre_apellido,
    email,
    direccion_envio, 
    telefono,
    contrasena,
    esAdministrador
}  = req.body;

try {
    const passwordHash = bcrypt.hashSync(contrasena,10);

    await  conexion.query(`
        INSERT INTO usuario ( 
        nombre_usuario,
        nombre_apellido,
        email,
        direccion_envio,
        telefono,
        contrasena,
        esAdministrador ) 
        VALUES ( ?, ?, ?, ?, ?, ?, ?)`,{
            replacements:[nombre_usuario, nombre_apellido, email, direccion_envio, telefono, passwordHash, esAdministrador]
        }
    )
    
    res.status(201).send("Recurso creado");
} catch (error) {
    console.error(error);
    res.status(500).send("Error interno")
}

});

//rutas
app.use('/api/usuarios', require('./routes/usuarios.routes'));
app.use('/api/productos', require('./routes/productos.routes.js'));
app.use('/api/pedidos', require('./routes/pedidos.routes'));

app.listen(process.env.PORT, () => {console.log('servidor escuchando en el  puerto' + process.env.PORT);}
);