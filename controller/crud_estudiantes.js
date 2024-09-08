import { conectar } from "../model/db_conexion.js";
var crud_estudiantes =({});

crud_estudiantes.leer = (req, res) => {
    conectar.query(`SELECT e.id_estudiante, e.carne, e.nombres, e.apellidos, e.direccion, e.telefono, e.correo_electronico, DATE_FORMAT(e.fecha_nacimiento,"%d/%m/%Y") AS fecha_nacimiento, t.sangre
                    FROM estudiantes e
                    INNER JOIN tipos_sangre t ON e.id_tipo_sangre = t.id_tipo_sangre`, (error, results) => {
        if (error) {
            throw error;
        } else {
            // Consulta los tipos de sangre para el formulario
            conectar.query('SELECT * FROM tipos_sangre', (error, tiposSangre) => {
                if (error) {
                    throw error;
                } else {
                    res.render('estudiantes/index', { resultado: results, tiposSangre });
                }
            });
        }
    });
};

crud_estudiantes.cud = (req,res)=>{
    console.log('Solicitud recibida:', req.body);
    const btn_crear = req.body.btn_crear;
    const btn_actualizar = req.body.btn_actualizar;
    const btn_borrar = req.body.btn_borrar;
    const id_estudiante = req.body.txt_id;
    const carne = req.body.txt_carne;
    const nombres = req.body.txt_nombres;
    const apellidos = req.body.txt_apellidos;
    const direccion = req.body.txt_direccion;
    const telefono = req.body.txt_telefono;
    const correo_electronico = req.body.txt_correo;
    const fecha_nacimiento = req.body.txt_fn;
    const id_tipo_sangre = req.body.txt_sangre;
  
    if (btn_crear){
        conectar.query('INSERT INTO estudiantes SET ?',{carne:carne,nombres:nombres, apellidos:apellidos,direccion:direccion,telefono:telefono,correo_electronico:correo_electronico,fecha_nacimiento:fecha_nacimiento,id_tipo_sangre:id_tipo_sangre}, (error, results)=>{
            if(error){
                res.status(500).send('Error al crear el estudiante.');
                throw error;
            }else{
                 
                res.redirect('/');         
            }
        });
       
    }

    if (btn_actualizar){
        conectar.query('UPDATE estudiantes SET ? WHERE id_estudiante = ?',[{carne:carne,nombres:nombres, apellidos:apellidos,direccion:direccion,telefono:telefono,correo_electronico:correo_electronico,fecha_nacimiento:fecha_nacimiento,id_tipo_sangre:id_tipo_sangre},id_estudiante], (error, results)=>{
            if(error){
                res.status(500).send('Error al actualizar los datos del estudiante.');
                throw error;
            }else{
                 
                res.redirect('/');         
            }
        });
       
    } 
    if (btn_borrar){
        conectar.query('DELETE FROM estudiantes WHERE id_estudiante = ?',[id_estudiante], (error, results)=>{
            if(error){
                res.status(500).send('Error al eliminar los datos del estudiante.');
                throw error;
            }else{
                 
                res.redirect('/');         
            }
        });
       
    }

};

export {crud_estudiantes}