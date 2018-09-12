const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let level = query.level * 1
  let user = query.user
  let history = query.history
  let limit = query.limit * 1
  var class_list = []
  try {
    var sql = "select id,hi.title,content,summary,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,s.title as subject_name,pictures from client_homework_information as hi"+
        " inner join client_subject as s on hi.homework_type_value = s.value"+
        " where publish_time > (SELECT DATE_FORMAT(CURDATE(),'%Y-%m-%d %H:%i:%s'))"+
        " and publish_type=2"+
        " and level >=" + level +
        " and school_code='"+user.school_code+"'"+
        " and id in (select homework_inform_id from client_homework_inform_class where class_id in"+                                             "(select class_id from client_user_class where user_id='" + user.id + "')" +
                 ")"+
        " order by publish_date desc"
    //历史纪录
    if(history){
      sql = "select id,hi.title,content,summary,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,s.title as subject_name,pictures from client_homework_information as hi" +
        " inner join client_subject as s on hi.homework_type_value = s.value" +
        " where publish_time < (SELECT DATE_FORMAT(CURDATE(),'%Y-%m-%d %H:%i:%s'))" +
        " and publish_type=2" +
        " and level >=" + level +
        " and school_code='" + user.school_code + "'" +
        " and id in (select homework_inform_id from client_homework_inform_class where class_id in" + 
                            "(select class_id from client_user_class where user_id='" + user.id + "')" +
                    ")" +
        " order by publish_date desc limit " +limit
    }

    var result = await mysql.schema.raw(sql)
    var result = result[0]
    for(var index in result){
      if (result[index].pictures == ""){
        result[index].pictures = []
      }
      else{
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
