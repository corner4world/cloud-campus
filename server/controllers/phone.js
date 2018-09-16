const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let user_type = query.user_type * 1
  let user = query.user
  let level = query.level * 1

  var sql = "select * from client_user where 1=1 "
  try {
    switch(user_type){
      case 1: //老师
        sql = sql + "and user_type=1 and school_code='"+user.school_code+"'"
        break
      case 2: //家长
        if(level == 1){
          sql = sql + "and user_type=2 and school_code='" + user.school_code + "'"
        }else{
          sql = sql + "and user_type=2 and school_code='" + user.school_code + "'" +
            " and id in (select user_id from client_user_class where user_id <>'" + user.id + "' and class_id in  " +
            "(select class_id from client_user_class where user_id='" + user.id + "'))"
        }
        break
    }
    var result = await mysql.schema.raw(sql)
    result = result[0]
    ctx.state.data = { result }
  }
  catch (err) {
    ctx.state.data = { err }
  }

}
