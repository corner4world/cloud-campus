const { mysql } = require('../qcloud')
module.exports = async ctx => {
  let query = ctx.request.body;
  try {
    var result = await mysql("client_school").select('*')
    ctx.state.data = { result}
  } catch (err) {
    ctx.state.data = { err }
  }
}