var config = require('../../config')
var app = getApp();
Page({
  data: {
    title: '校园风采',
    campus_life: [],
    top:[],
    top_img: [{"img_url":"http://img.zcool.cn/community/0142885afa4dd4a801216045a2977b.jpg@1280w_1l_2o_100sh.jpg"}],
    hidden: false,
    limit: 5,
  },
  onPullDownRefresh: function () {
    this.fetchData(5);
    //wx.stopPullDownRefresh();
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
        school_code: app.school_code,
        limit: limit
      },
      url: config.host + '/weapp/campus_life',
      success: function (res) {
        var top = res.data.data.top
        that.setData({
          top: top
        })
        var campus_life = res.data.data.result
        if (campus_life.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            campus_life: campus_life
          })
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else if (campus_life.length < 1 && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            hidden: true
          })
          wx.showToast({
            title: '暂无最新活动',
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
    this.fetchTopImg()
    this.fetchData(5);
  },
  fetchHistoryData: function () {
    var limit = this.data.limit
    limit = limit + 5
    this.fetchData(limit)
    this.setData({ limit: limit })
  },
  fetchTopImg: function () {
    var that = this;
    wx.request({
      method: 'post',
      data: {
        school_code: app.school_code
      },
      url: config.host + '/weapp/campus_top_img',
      success: function (res) {
        var top_img = res.data.data.result
        if (top_img.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            top_img: top_img
          })
        }
      }
    })
  },
})