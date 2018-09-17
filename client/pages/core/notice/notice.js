var config = require('../../../config')
var app = getApp();
Page({
  data: {
    notice: [],
    hidden: false,
    limit: 5,
    notice_type:0

  },
  onPullDownRefresh: function () {
    this.fetchData(5);
    wx.stopPullDownRefresh();
  },
  fetchData: function (limit) {
    var that = this;
    that.setData({
      hidden: false
    })
    wx.request({
      method: 'post',
      data: {
        user:app.user,
        limit: limit,
        notice_type:that.data.notice_type
      },
      url: config.host + '/weapp/notice',
      success: function (res) {
        var notice = res.data.data.result
        if (notice.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            notice: notice
          })
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else if (notice.length < 1 && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            hidden: true
          })
          wx.showToast({
            title: '暂无最新数据',
            icon: 'none',
            duration: 2000
          })
        }
      },
      fail: function (res) {
        wx.hideToast();
        app.showErrorModal(res.errMsg, '服务器维护中');
      }
    })
  },
  onLoad: function (options) {
    var that = this
    var notice_type = options.notice_type
    that.setData({
      notice_type: notice_type
    })
    this.fetchData(5);
  },
  fetchHistoryData: function () {
    var limit = this.data.limit
    limit = limit + 5
    this.fetchData(limit)
    this.setData({ limit: limit })
  }
})