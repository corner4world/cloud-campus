const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let id = query.id * 1
  let operation = query.operation
  //let user = query.user
    if(operation == "select"){
      let limit = query.limit * 1
      var sql = "select content,DATE_FORMAT(create_date, '%Y-%m-%d %H:%i:%S') as create_date from blog_comment " +
        " where del_flag=0 and article_id=" +id+
        " order by create_date desc limit " + limit
      try{
        var result = await mysql.schema.raw(sql)
        result = result[0]
        ctx.state.data = { result }
      }
      catch(err){
        ctx.state.data = { err }
      }
    }
    else if(operation == "insert"){
      let content = query.content
      var sql = "insert into blog_comment(article_id,content,create_by,create_date,del_flag) values("+
                id + ",'" + content +"','user_id',CURRENT_TIME(),0)"
      try {
        await mysql.schema.raw(sql)
        ctx.state.data = { status: 1 }
      } catch (err) {
        ctx.state.data = { status: err }
      }
    }
}
