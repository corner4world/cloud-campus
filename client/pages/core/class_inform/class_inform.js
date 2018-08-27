var config = require('../../../config')
var app = getApp();
Page({
  data: {
    title: '班级通知',
    class_inform: [],
    hidden: false,
    limit: 5,
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
        //user:app.user,
        //level: app.level,
        limit:limit
      },
      url: config.host + '/weapp/class_inform',
      success: function (res) {
        console.log(res)
        var class_inform = res.data.data.result
        if (class_inform.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            class_inform: class_inform
          })
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else if (class_inform.length < 1 && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            hidden: true
          })
          wx.showToast({
            title: '暂无最新通知',
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
  previewImage(e) {
    const { current } = e.currentTarget.dataset
    var urls = e.currentTarget.id
    urls = urls.split(",")
    wx.previewImage({
      current,
      urls,
    })
  },
  onLoad: function (options) {
    this.fetchData(5);
  },
  fetchHistoryData: function () {
    var limit = this.data.limit
    limit = limit + 5
    this.fetchData(limit)
    this.setData({ limit: limit })
  }
})