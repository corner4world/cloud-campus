const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  //let level = query.level
  //let user = query.user
  let limit = query.limit * 1
  var class_list = []
  try {
    //var user_type = user.user_type * 1
    /*
    switch(user_type){
      case 1:
        //class_list = await mysql.schema.raw("select class_id from teacher_class where phone = '"+user.phone+"'")
        break
      case 2:
       // class_list = await mysql.schema.raw("select class_id from parent phone = '" + user.phone + "'")
        break
    }*/
    var sql = "select id,title,content,summary,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from homework_information " +
      " where publish_type=2" +
      " and id in (select homework_inform_id from homework_inform_class where class_id in ('25719710465130536'))" +
      " order by publish_date desc limit " +limit
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
