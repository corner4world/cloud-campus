const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  //let level = query.level
  //let user = query.user
  let limit = query.limit * 1
  try {
    var sql = "select id,title,show_pic,marks,content,comments,likes,click,DATE_FORMAT(update_date, '%Y-%m-%d %H:%i:%S') as update_date from blog_article " +
      " where del_flag=0" +
      " and is_top=0 and is_recommend=0"
      " order by update_date desc limit " + limit
    var top_sql = "select id,title,show_pic,marks,content,comments,likes,click,DATE_FORMAT(update_date, '%Y-%m-%d %H:%i:%S') as update_date from blog_article " +
      " where del_flag=0" +
      " and (is_top=1 or is_recommend=1)"
      " order by update_date desc limit " + 3
    var result = await mysql.schema.raw(sql)
    var top = await mysql.schema.raw(top_sql)
    result = result[0]
    top = top[0]
    ctx.state.data = { result ,top}
  }
  catch (err) {
    result = []
    ctx.state.data = { err }
  }

}
