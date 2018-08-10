const { mysql } = require('../qcloud')
module.exports = async ctx => {
  try {
    var result = await mysql("parent").select('*')
    ctx.state.data = { result }
  }
  catch (err) {
    result = []
    ctx.state.data = { result }
  }

}
