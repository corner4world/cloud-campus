const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  let level = query.level
  try {
    var result = await mysql("navigation").select('*')
      .where({ level:level,level:0 })
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { result }
  }

}
