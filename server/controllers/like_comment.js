const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let id = query.id * 1
  let operation = query.operation
  //let user = query.user
    if(operation == "comment_select"){
      let limit = query.limit * 1
      let offset = query.offset * 1
      var sql = "select content,DATE_FORMAT(create_date, '%Y-%m-%d %H:%i:%S') as create_date from blog_comment " +
        " where del_flag=0 and article_id=" +id+
        " order by create_date desc limit " + offset+","+limit
      try{
        var result = await mysql.schema.raw(sql)
        result = result[0]
        ctx.state.data = { result }
      }
      catch(err){
        ctx.state.data = { err }
      }
    }
    else if(operation == "comment_insert"){
      let content = query.content
      var sql = "insert into blog_comment(article_id,content,create_by,create_date,del_flag) values("+
                id + ",'" + content +"','user_id',CURRENT_TIME(),0)"
      var update_sql = "update blog_article set comments = comments + 1 where id="+id
      try {
        await mysql.schema.raw(sql)
        await mysql.schema.raw(update_sql)
        ctx.state.data = { status: 1 }
      } catch (err) {
        ctx.state.data = { status: err }
      }
    }
    else if (operation == "like") {
      var update_sql = "update blog_article set likes = likes + 1 where id=" + id
      try {
        await mysql.schema.raw(update_sql)
        ctx.state.data = { status: 1 }
      } catch (err) {
        ctx.state.data = { status: err }
      }
    }
    else if (operation == "click") {
      var update_sql = "update blog_article set click = click + 1 where id=" + id
      try {
        await mysql.schema.raw(update_sql)
        ctx.state.data = { status: 1 }
      } catch (err) {
        ctx.state.data = { status: err }
      }
    }
}
