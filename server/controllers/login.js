const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body; 
  let phone = query.phone
  let password = query.password
  let school_code = query.school_code
  try{
    var result = await mysql("client_user").select('*')
      .where({ phone: phone, password: password, school_code: school_code})
    ctx.state.data = { result }
  }
  catch(err){
    result = []
    ctx.state.data = {result}
  }
  
}
