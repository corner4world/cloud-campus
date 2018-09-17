const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let id = query.id
  try {
    var sql = "select id,title,summary,content,publisher,level,DATE_FORMAT(publish_time, '%Y-%m-%d %H:%i:%S') as publish_date,pictures from client_notice where id='"+id+"'" 
    var result = await mysql.schema.raw(sql)
    var result = result[0]
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
