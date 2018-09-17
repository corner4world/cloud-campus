const { mysql } = require('../qcloud')
var uuid  = require('uuid');
module.exports = async ctx => {
  let query = ctx.request.body;
  let title = query.title
  let content = query.content
  let pictures = query.pictures
  let class_value = query.class_value
  let publish_type = query.publish_type * 1
  let homework_type_value = query.homework_type_value || 0
  let user = query.user
  var level = 0
  let summary = content.slice(0,50)
  switch (publish_type) {
    case 0:
    case 1:
      if (publish_type == 0) { level = 2}
      if (publish_type == 1) { level = 5}
      var sql = "INSERT INTO client_notice (id, title, content, summary, publisher,publisher_avatar, notice_type,level,school_code, publish_time, pictures) VALUES (UUID_SHORT(),'" + title + "', '" + content + "', '" + summary + "', '" + user.username + "', '"+user.avatar+"'," + publish_type+","+level+",'"+user.school_code+"',CURRENT_TIME(), '" + pictures+"')"
        try {
          await mysql.schema.raw(sql)
          ctx.state.data = { status: 1 }
        } catch (err) {
          ctx.state.data = { status: err }
        }
      break
    case 2:
    case 3:
      var id = uuid.v1()
      var sql = "INSERT INTO client_homework_information (id, title, content, summary, publisher,publisher_avatar, level,school_code,publish_time, pictures,publish_type,homework_type_value) VALUES ('" + id + "','" + title + "', '" + content + "', '" + summary + "', '" + user.username + "','"+user.avatar+"',3,'"+user.school_code+"',CURRENT_TIME(), '" + pictures + "','" + publish_type + "','" + homework_type_value+ "')"
      var class_relation = "insert into client_homework_inform_class(id,homework_inform_id,class_id) values "
      var index = 0
      while(index < class_value.length - 1) {
        var class_id = class_value[index]
        var value = "(UUID_SHORT(),'"+id+"','"+class_id+"'),"
        class_relation = class_relation + value
        index = index + 1
      }
      class_relation = class_relation + "(UUID_SHORT(),'" + id + "','" + class_value[index] + "');"
      try {
        await mysql.schema.raw(sql)
        await mysql.schema.raw(class_relation)
        ctx.state.data = { status: 1 }
      } catch (err) {
        ctx.state.data = { err: err, sql: class_value}
      }
      break
  }
}