const {Router}= require('express');
const router = Router();


//importar controladores
const{getChullitas,postCreateChullitas,getFindChullita,PutUpdateChulllita,deleteChulllita,getVidas,getFindVida,postCreateVidas,PutUpdatVidas,deleteVidas}=require('../controller/index.controller');
router.get('/chullitas',getChullitas);//Metodo get
router.get('/chullitas/:id',getFindChullita);//Metodo get
router.post('/chullitas',postCreateChullitas);//metodo post
router.put('/chullitas/:id',PutUpdateChulllita);
router.delete('/chullitas/:id',deleteChulllita);

router.get('/vidas',getVidas);//Metodo get
router.get('/vidas/:id',getFindVida);//Metodo get
router.post('/vidas',postCreateVidas);//metodo post
router.put('/vidas/:id',PutUpdatVidas);
router.delete('/vidas/:id',deleteVidas);
module.exports = router;
