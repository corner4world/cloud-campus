const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  var sql = "select * from subject "
  try {
    var result = await mysql.schema.raw(sql)
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { err }
  }

}
