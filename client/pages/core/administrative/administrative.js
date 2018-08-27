var config = require('../../../config')
var app = getApp();
Page({
  data: {
    title: '行政简讯',
    administrative: [],
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
        limit: limit
      },
      url: config.host + '/weapp/administrative',
      success: function (res) {
        console.log(res)
        var administrative = res.data.data.result
        if (administrative.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            administrative: administrative
          })
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else if (administrative.length < 1 && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            hidden: true
          })
          wx.showToast({
            title: '暂无最新简讯',
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