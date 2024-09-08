import mysql from 'mysql2' // o tambien const mysql = require('mysql');
    var conectar = mysql.createConnection({
            host     : 'localhost',
            user     : 'wc',
            password : '05052020',
            database : 'db_nodejs'
    });

    conectar.connect(function(err) {
            if (err) {
                console.error('Error en la conexion a la base de datos: ' + err.stack);
        return;
        }
   
                console.log('Conexion Creada Exitosamente ID: ' + conectar.threadId);
    });

    export {conectar}