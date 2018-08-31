const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  //let level = query.level
  //let user = query.user
  let limit = query.limit * 1
  try {
    var sql = "select id,title,show_pic,marks,content,DATE_FORMAT(publist_time, '%Y-%m-%d %H:%i:%S') as publish_date from blog_article " +
      " where del_flag=0" +
      " order by publish_date desc limit " + limit
    var result = await mysql.schema.raw(sql)
    result = result[0]
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { err }
  }

}
