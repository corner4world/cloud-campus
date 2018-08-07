const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body; 
  let phone = query.phone
  let password = query.password
  var result = await mysql("user").select('*')
                  .where({phone:phone,password:password})
  ctx.state.data = {result}
}
