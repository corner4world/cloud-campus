const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body; 
  let username = query.username
  let password = query.password
  var result = await mysql("user").select('*')
                  .where({username:username,password:password})
  ctx.state.data = {result}
}
