const { mysql } = require('../qcloud')
function picstr2array(result){
  for (var index in result) {
    if (result[index].pictures == "") {
      result[index].pictures = []
    }
    else {
      result[index].pictures = result[index].pictures.split(",")
    }
  }
}
module.exports = async ctx => {
  let query = ctx.request.body;
 // let level = query.level

  try {
    var result = []
    //行政简讯
    var administrative_sql = "select id,title,summary,content,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from notice where level > 0 and notice_type = 1 order by publish_date desc LIMIT 1"
    var administrative = await mysql.schema.raw(administrative_sql)
    administrative = administrative[0]
    //图片地址分割
    picstr2array(administrative)
    result.push(administrative[0])
    //班级消息 todo 班级查询
    var class_inform_sql = "select id,title,content,summary,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from homework_information " +
      " where publish_type=2" +
      " and id in (select homework_inform_id from homework_inform_class where class_id in ('25719710465130536'))" +
      " order by publish_date desc limit 1" 
    var class_inform = await mysql.schema.raw(class_inform_sql)
    class_inform = class_inform[0]
    //图片地址分割
    picstr2array(class_inform)
    result.push(class_inform[0])

    ctx.state.data = result

  }
  catch (err) {
    ctx.state.data = { err }
  }

}
