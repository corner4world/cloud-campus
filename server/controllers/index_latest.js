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
  let user = query.user
  let level = user.level * 1
  let notice_url = "/pages/core/notice_detail/notice_detail"
  let homework_information_url = "/pages/core/homework_information_detail/homework_information_detail"
  try {
    var result = []
    //行政简讯
    var administrative_sql = "select id,title,summary,content,publisher,publisher_avatar,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from client_notice where school_code='" + user.school_code + "' and level >=" + level+" and notice_type = 0 order by publish_date desc LIMIT 1"
    var notice_sql = "select id,title,summary,content,publisher,publisher_avatar,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from client_notice where school_code='" + user.school_code + "' and notice_type = 1 order by publish_date desc LIMIT 1"
    var administrative = await mysql.schema.raw(administrative_sql)
    var notice = await mysql.schema.raw(notice_sql)
    administrative = administrative[0]
    notice = notice[0]
    //图片地址分割
    picstr2array(administrative)
    if (administrative[0]){
      administrative[0]['redirect'] = notice_url
      result.push(administrative[0])
    }
    picstr2array(notice)
    if (notice[0]) {
      notice[0]['redirect'] = notice_url
      result.push(notice[0])
    }
    

    //班级消息 
    var class_inform_sql = "select id,title,content,summary,publisher,publisher_avatar,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from client_homework_information " +
      " where publish_type=3" +
      " and school_code='" + user.school_code + "'" +
      " and level >=" + level +
      " and id in (select homework_inform_id from client_homework_inform_class where class_id in "+
                    " (select class_id from client_user_class where user_id='"+user.id+"')"+
                  ")" +
      " order by publish_date desc limit 1" 
    var class_inform = await mysql.schema.raw(class_inform_sql)
    class_inform = class_inform[0]
    //图片地址分割
    picstr2array(class_inform)
    if (class_inform[0]) {
      class_inform[0]['redirect'] = homework_information_url
      result.push(class_inform[0])
    }
    ctx.state.data = result

  }
  catch (err) {
    ctx.state.data = { err }
  }

}
