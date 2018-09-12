const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let level = query.level * 1
  try {
    var sql = "select label,icon from client_floating_button where level >="+level
    var result = await mysql.schema.raw(sql)
    result = result[0]
    ctx.state.data = { result }
  }
  catch (err) {
    ctx.state.data = { err }
  }

}
