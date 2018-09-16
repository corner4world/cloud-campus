const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let user = query.user
  let field = query.field
  let value = query.value
  try {
    var sql = "update client_user set "+field+"='"+value+"'" +" where id='"+user.id+"'"
    await mysql.schema.raw(sql)
    var new_user = await mysql("client_user").select('*').where({ id: user.id })
    ctx.state.data = {status:1,user:new_user[0]}
  }
  catch (err) {
    ctx.state.data = {err:err,status:0}
  }

}
