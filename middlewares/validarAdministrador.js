module.exports = (req, res, next) => {
    console.log(req.headers.authorization);
    console.log(req.user.usuario);
    console.log("es admin?",req.user.usuario.esAdministrador);
    if(req.user.usuario.esAdministrador){
        next();
    } else {
        res.status(401).json('no esta autorizado')
    }
}