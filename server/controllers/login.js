const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body; 
  let phone = query.phone
  let password = query.password
  try{
    var result = await mysql("client_user").select('*')
      .where({ phone: phone, password: password })
    ctx.state.data = { result }
  }
  catch(err){
    result = []
    ctx.state.data = {result}
  }
  
}
