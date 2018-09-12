const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let user = query.user
  var sql = "select * from client_class_category where value in (select class_id from client_user_class where user_id = '"+user.id+"')"
  try {
    var result = await mysql.schema.raw(sql)
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { result }
  }

}
