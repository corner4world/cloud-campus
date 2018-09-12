const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let school_code = query.school_code
  try {
    var sql = "select img_url from client_campus_top " +
      " where state=1 and school_code='" +school_code+"'" 
      " order by create_date desc"
    var result = await mysql.schema.raw(sql)
    result = result[0]
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { err }
  }

}
