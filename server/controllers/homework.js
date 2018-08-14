const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let level = query.level
  try {
    var sql = "select id,title,content,summary,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date from homework where level=" + level + " order by publish_date desc LIMIT 20"

    var result = await mysql.schema.raw(sql)
    var result = result[0]
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { result }
  }

}
