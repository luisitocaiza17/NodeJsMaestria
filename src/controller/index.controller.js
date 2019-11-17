//conexion postgress
const {Pool} = require('pg');
const pool = new Pool({
    host: 'localhost',
    user:'postgres',
    password: 'root',
    database:'Chulla_Vida_db'
    //port :'5432'
});

//////////Funciones///////////
//metodo get
const getChullitas = async(req,res)=>{
    //res.send('hola mundote');
    //llamada a la base de datos , normalmente no espera a la finalizacion de la consulta, por ellos se usa await
    const respuesta = await pool.query('select * from "Chullita"');
    res.send(respuesta.rows);
}
//metodo get
const getFindChullita= async (req,res)=>{
    const id = req.params.id;
    const respuesta = await pool.query('select * from "Chullita" where id=$1',[id]);
    res.json({
        mensaje:'consulta Chullita',
        body:{
            user:respuesta.rows
        }
    });
}

//metodo post
const postCreateChullitas= async (req,res)=>{
    const {nombre,apellido,fechaNacimiento}=req.body;
    const respuesta= await pool.query('insert into "Chullita"(nombre, apellido, "fechaNacimiento") values($1,$2,$3)',[nombre,apellido,fechaNacimiento]);
    console.log(respuesta);
    res.json({
        mensaje:'Chullita creado',
        body:{
            user:{nombre,apellido,fechaNacimiento}
        }
    });
}

//metodo put
const PutUpdateChulllita =async (req,res)=>{
    const id= req.params.id;
    const {nombre,apellido,fechaNacimiento}=req.body;
    const respuesta = await pool.query('update "Chullita" set nombre = $1, apellido= $2 , "fechaNacimiento"= $3 where id=$4',
    [nombre,apellido,fechaNacimiento, id]);
    res.json({
        mensaje:'Chullita actualizado',
        body:{
            body:{
                'id':id,
                'nombre':nombre,
                'apellido':apellido,
                'fechaNacimiento':fechaNacimiento
            }
        }
    });
}
//metodo delete
const deleteChulllita= async (req,res)=>{
    const id = req.params.id;
    const respuesta = await pool.query('delete from "Chullita" where id=$1',[id]);
    res.json({
        mensaje:'Chullita borrado'
    });
}

///Tabla Relacionada//
//metodo get
const getVidas = async(req,res)=>{
    //res.send('hola mundote');
    //llamada a la base de datos , normalmente no espera a la finalizacion de la consulta, por ellos se usa await
    const respuesta = await pool.query('select * from "Chullita" ch inner join "Vida" vi on ch.id=vi."idChullita"');
    res.send(respuesta.rows);
}
//metodo get
const getFindVida= async (req,res)=>{
    const id = req.params.id;
    const respuesta = await pool.query('select * from "Chullita" ch inner join "Vida" vi on ch.id=vi."idChullita"  where vi.id==$1',[id]);
    res.json({
        mensaje:'consulta Vidas',
        body:{
            user:respuesta.rows
        }
    });
}

//metodo post
const postCreateVidas= async (req,res)=>{
    const {numero,idChullita,activo}=req.body;
    const respuesta= await pool.query('insert into "Vida"(numero, "idChullita", activo) values($1,$2,$3)',[numero,idChullita,activo]);
    console.log(respuesta);
    res.json({
        mensaje:'Vida creada',
        body:{
            user:{numero,idChullita,activo}
        }
    });
}

//metodo put
const PutUpdatVidas =async (req,res)=>{
    const id= req.params.id;
    const {numero,idChullita,activo}=req.body;
    const respuesta = await pool.query('update "Vida" set numero = $1, "idChullita"= $2 , activo= $3 where id=$4',
    [numero,idChullita,activo, id]);
    res.json({
        mensaje:'Chullita actualizado',
        body:{
            body:{
                'numero':numero,
                'idChullita':idChullita,
                'activo':activo,
                'Id':id
            }
        }
    });
}


//metodo delete
const deleteVidas= async (req,res)=>{
    const id = req.params.id;
    const respuesta = await pool.query('delete from "Vida" where id=$1',[id]);
    res.json({
        mensaje:'Vida borrada'
    });
}

module.exports = {
    getChullitas,
    postCreateChullitas,
    getFindChullita,
    PutUpdateChulllita,
    deleteChulllita,
    getVidas,
    getFindVida,
    postCreateVidas,
    PutUpdatVidas,
    deleteVidas
}
