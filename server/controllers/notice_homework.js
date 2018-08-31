const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let user = query.user
  try {
    var user_type = user.user_type * 1
    var notice_sql = "select id,title,content,summary,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from client_notice where level>=" + user.level + " and notice_type>=" + user.user_type + " order by publish_date desc LIMIT 1"

    switch(user_type){
      case 0:
        
        break
      case 1:
        var homework_sql ="select calss from client_parent where phone = user.phone"

        break
      case 2:
        break
    }

    

    /*
    var result = await mysql("notice").select("*,")
      .where({ level: level, level: 0 }).limit(20).orderBy('publish_time', 'desc')
    */
    var result = await mysql.schema.raw(sql)
    var result = result[0]
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { result }
  }

}
