const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let user = query.user
  var sql = "select * from class_category where value in (select class_id from teacher_class where phone = '15388478188')"
  try {
    var result = await mysql.schema.raw(sql)
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { result }
  }

}
