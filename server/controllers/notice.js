const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let user = query.user
  let limit = query.limit * 1
  let notice_type = query.notice_type * 1
  let level = user.level * 1 
  try {
    var sql = "select id,title,summary,content,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date ,pictures from client_notice"
    switch(notice_type){
      case 0:
        sql = sql + " where school_code='" + user.school_code + "' and level >=" + level + " and notice_type = 0 order by publish_date desc LIMIT " + limit
        break
      case 1:
        sql = sql + " where school_code='" + user.school_code + "' and notice_type = 1 order by publish_date desc LIMIT " + limit
        break
    }
    var result = await mysql.schema.raw(sql)
    var result = result[0]
    for (var index in result) {
      if (result[index].pictures == "") {
        result[index].pictures = []
      }
      else {
        result[index].pictures = result[index].pictures.split(",")
      }
    }
    ctx.state.data = { result }

  }
  catch (err) {
    result = []
    ctx.state.data = { err }
  }

}
