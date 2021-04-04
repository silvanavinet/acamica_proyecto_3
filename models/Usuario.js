const sequelize = require('./../conexion');
const Usuario = {};

Usuario.crear = async (nombre_usuario, nombre_apellido, email, direccion_envio, telefono)  => {
    try {
        const result = await sequelize.query('INSERT INTO usuario (nombre_usuario, nombre_apellido, email, direccion_envio, telefono) VALUES (?, ?, ?, ?, ?)', {
            replacements: [nombre_usuario, nombre_apellido, email, direccion_envio, telefono, contrasena]
        });
        console.log(result);
        return result;
    } catch (error) {
        console.log(error);
    }
};

Usuario.obtenerTodos = async () => {
    const result = await sequelize.query('SELECT id, nombre_usuario, nombre_apellido, email, direccion_envio, telefono FROM usuario',
        { type: sequelize.QueryTypes.SELECT });
    return result;
}

Usuario.obtenerUno = async (id) => {
    const result = await sequelize.query(`
        SELECT id, nombre_usuario, nombre_apellido, email, direccion_envio, telefono 
        FROM usuario
        WHERE id = ?`,
        { 
            replacements: [id],
            type: sequelize.QueryTypes.SELECT 
        });
    return result[0];
}

Usuario.actualizar = async (
    id_usuario, 
    nombre_usuario, 
    nombre_apellido, 
    email, 
    direccion_envio, 
    telefono,
    contrasena,
    esAdministrador
    ) => {
    try {
        let result = await sequelize.query(
            `
            UPDATE 
                usuario 
            SET 
                nombre_usuario = ?, 
                nombre_apellido = ?, 
                email = ?, 
                direccion_envio = ?, 
                telefono = ?,
                contrasena = ?,
                esAdministrador  = ?
            WHERE 
                id = ?
                `, {
            replacements: [ 
                nombre_usuario, 
                nombre_apellido, 
                email, 
                direccion_envio, 
                telefono,
                contrasena,
                esAdministrador,
                id_usuario,
            ],
            // type: sequelize.QueryTypes.UPDATE 
        });
        
        result = await sequelize.query(`
        SELECT *
        FROM usuario
        WHERE id = ?`,
        { 
            replacements: [id_usuario],
            type: sequelize.QueryTypes.SELECT 
        });
        return result;
    } catch (error) {
        console.log(error);
    }
}

Usuario.borrar = async (id) => {
    const result = await sequelize.query('DELETE FROM usuario WHERE id = ?', {
        replacements: [id]
    });
    return result;
}

module.exports = Usuario;