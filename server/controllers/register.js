const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let phone = query.phone
  let password = query.password
  let level = query.level * 1

  switch(level){
    case 0:
      var result = await mysql("teacher").select('*')
          .where({ phone: phone})
      if(result.length){
        var sql = "INSERT INTO user (id, username,password,phone,level) " +
          "VALUES (UUID_SHORT(), '" + result[0].name + "', '" +
          password + "', '" + phone + "', " + level + ")"
        try{
          await mysql.schema.raw(sql)
          ctx.state.data = { status: 1 }
        }catch(err){
          ctx.state.data = { status: 0 }
        }
        
      }else{
        ctx.state.data = { status: -1}
      }
      break
    case 1:
      var result = await mysql("parent").select('*')
        .where({ phone: phone })
      if (result.length) {
        var sql = "INSERT INTO user(id, username,password,phone,level) " +
          "VALUES (UUID_SHORT(), '" + result[0].name + "', '" +
          password + "', '" + phone + "', " + level + ")"
        try {
          await mysql.schema.raw(sql)
          ctx.state.data = { status: 1 }
        } catch(err){
          ctx.state.data = { status: 0 }
        }
      } else {
        ctx.state.data = {status:-1}
      }
      break
  }
}