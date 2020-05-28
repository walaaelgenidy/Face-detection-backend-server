const handleProfile = (req,res,db)=>{
    const {id} = req.params;
    db.select('*').from('users').where({id})
     .then(user =>{
       if(user.length){ //if the user exist
         res.json(user[0]) 
       }else{
         res.status(404).json('no such user found')
       }
     }).catch(err => res.status(404).json('error getting user')); 
    
 }

 module.exports = {
     handleProfile: handleProfile
 };