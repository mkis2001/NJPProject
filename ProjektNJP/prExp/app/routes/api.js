module.exports=function(express, pool, crypto){
    const apiRouter = express.Router();

    apiRouter.get('/', function(req, res){
        console.log("Dobro dosli")
        res.json({message: "Dobro dosli na nas api"})
    });

    apiRouter.route('/users').get(async function(req,res){
        try{
            let conn = await pool.getConnection();
            let rows = await conn.query('SELECT * FROM users');
            conn.release();
            res.json(rows);
        }catch(e){
            console.log(e);
            return res.json({'code':100,'status':'Error with query'});
        }
    }).post(async function(req,res){
        try{
            let conn = await pool.getConnection();
            req.body.salt = crypto.randomBytes(128).toString('base64');

            req.body.password = crypto.pbkdf2Sync(req.body.password, req.body.salt, 10000,64,'sha512');
            let q = await conn.query('INSERT INTO users SET ?',req.body);
            conn.release();
            return res.json({status:'OK',insertId:q.insertId});
        }catch(e){
            console.log(e);
            return res.json({status: 'NOT OK'});
        }
    })

    /*ITEM----------------------------------------------------------------------*/
    apiRouter.route('/items').get(async function(req,res){
        try{
            let conn = await pool.getConnection();
            let rows = await conn.query('SELECT * FROM item');
            conn.release();
            return res.json(rows);
        }catch(e){
            console.log(e);
            return res.json({'code':100,'status':'Error with query'});
        }
    }).post(async function(req,res){
        try{
            let conn = await pool.getConnection();
            let q = await conn.query('INSERT INTO item SET ?',req.body);
            conn.release();
            return res.json({status:'OK',insertId:q.insertId});
        }catch(e){
            console.log(e);
            return res.json({status: 'NOT OK'});
        }
    }).put(async function(req, res){
        try{
            let conn = await pool.getConnection();
            let q = await conn.query("UPDATE item SET units = ? where id = ?",[req.body.units,req.body.id]);
            conn.release();
            return res.json({status: 'OK',changedRows:q.changedRows});
        }catch (e){
            return res.json({status: 'NOT OK'});
        }
    })

    apiRouter.route('/items/:id').delete(async function(req,res){
        try {
            let conn = await pool.getConnection();
            let q = await conn.query('DELETE FROM item WHERE id = ?', req.params.id);
            conn.release();
            return res.json({status: 'OK', affectedRows:q.affectedRows});
        } catch (e){
            return res.json({ status: 'NOT OK' });
        }
    });


    /*TRANSACTION------------------------------------------------------------------------*/
    apiRouter.route('/transactions').get(async function(req,res){
        try{
            let conn = await pool.getConnection();
            let rows = await conn.query('SELECT * FROM transaction');
            conn.release();
            return res.json(rows);
        }catch(e){
            console.log(e);
            return res.json({'code':100,'status':'Error with query'});
        }
    }).post(async function(req,res){
        try{
            let conn = await pool.getConnection();
            let q = await conn.query('INSERT INTO transaction SET ?',req.body);
            conn.release();
            return res.json({status:'OK',insertId:q.insertId});
        }catch(e){
            console.log(e);
            return res.json({status: 'NOT OK'});
        }
    })

    /*ALBUMS---------------------------------------------------------------------*/
    apiRouter.route('/albums').get(async function(req,res){
        try{
            let conn = await pool.getConnection();
            let rows = await conn.query('SELECT * FROM album');
            conn.release();
            return res.json(rows);
        }catch(e){
            console.log(e);
            return res.json({'code':100,'status':'Error with query'});
        }
    }).post(async function(req,res){
        try{
            let conn = await pool.getConnection();
            let q = await conn.query('INSERT INTO album SET ?',req.body);
            conn.release();
            res.json({status:'OK',insertId:q.insertId});
        }catch(e){
            console.log(e);
            res.json({status: 'NOT OK'});
        }
    })

    apiRouter.get('/me', function (req, res){
        res.send({status:200, user:req.decoded});
    });

    return apiRouter;
}