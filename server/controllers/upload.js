const { uploader } = require('../qcloud')

module.exports = async ctx => {
    const data = await uploader(ctx.req)
    ctx.state.data = data
}
