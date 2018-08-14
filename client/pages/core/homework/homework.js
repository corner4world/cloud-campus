var config = require('../../../config')
var app = getApp();
Page({
  data: {
    title: '作业',
    homework: [],
    hidden: false
  },
  onPullDownRefresh: function () {
    this.fetchData();
    wx.stopPullDownRefresh();
  },
  // 跳转到详细页面
  redictDetail: function (e) {
    var id = e.currentTarget.id,
      url = '../detail/detail?id=' + id;

    wx.navigateTo({
      url: url
    })
  },
  fetchData: function () {
    var that = this;
    that.setData({
      hidden: false
    })
    wx.request({
      method: 'post',
      data: {
        level: app.level
      },
      url: config.host + '/weapp/homework',
      success: function (res) {
        console.log(res)
        var homework = res.data.data.result
        if (homework.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            homework: homework
          })
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else {
          wx.showToast({
            title: '服务器维护中..',
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
  onLoad: function () {
    this.fetchData();
  }
})