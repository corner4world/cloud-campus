var config = require('../../../config')
var app = getApp();
Page({
  data: {
    id: "",
    notice: "",
  },
  onLoad: function (options) {
    var that = this
    that.setData({
      id: options.id
    })
    var id = options.id
    this.fetchData(id)
  },
  onPullDownRefresh: function () {
    wx.stopPullDownRefresh();
  },
  fetchData: function (id) {
    var that = this
    wx.request({
      method: 'post',
      data: {
        id: id
      },
      url: config.host + '/weapp/notice_detail',
      success: function (res) {
        var notice = res.data.data.result
        if (notice.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            notice: notice[0]
          })
        } 
      },
      fail: function (res) {
        wx.hideToast();
        app.showErrorModal(res.errMsg, '服务器维护中');
      }
    })
  },
  previewImage(e) {
    const { current } = e.currentTarget.dataset
    var urls = e.currentTarget.id
    urls = urls.split(",")
    wx.previewImage({
      current,
      urls,
    })
  }
})