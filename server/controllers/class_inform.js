const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let level = query.level * 1
  let user = query.user
  let limit = query.limit * 1
  var class_list = []
  try {
    var sql = "select id,title,content,summary,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from client_homework_information " +
      " where publish_type=3" +
      " and school_code='" + user.school_code + "'" +
      " and level >="+level+
      " and id in (select homework_inform_id from client_homework_inform_class where class_id in " +
                    " (select class_id from client_user_class where user_id='" + user.id + "')" +
                   ")" +
      " order by publish_date desc limit "+limit 
    var result = await mysql.schema.raw(sql)
    result = result[0]
    //图片地址分割
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
