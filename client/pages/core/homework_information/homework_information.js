var config = require('../../../config')
var app = getApp();
Page({
  data: {
    homework_information: [],
    hidden: false,
    limit: 5,
    hi_type:2,
    homework_history:false,
    homeworkHistoryData:[]
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
    var hi_type = that.data.hi_type
    var url = ''
    switch(hi_type * 1){
      case 2:
        url = config.host + '/weapp/homework'
        break
      case 3:
        url = config.host + '/weapp/class_inform'
        break
      default:
        url = config.host + '/weapp/homework'
    }
    wx.request({
      method: 'post',
      data: {
        user: app.user,
        level: app.level,
        limit: limit,
        history: that.data.homework_history,
      },
      url: url,
      success: function (res) {
        var homework_information = res.data.data.result
        if (homework_information.length && res.statusCode === 200 && res.data.code != -1) {
          if (that.data.homework_history){
                that.setData({
                  homeworkHistoryData: homework_information,
                  homework_information:[]
              })
            }else{
                that.setData({
                  homework_information: homework_information,
                  homeworkHistoryData:[]
                })
            }
          setTimeout(function () {
            that.setData({
              hidden: true
            })
          }, 300)
        } else if (homework_information.length < 1 && res.statusCode === 200 && res.data.code != -1) {
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
    var hi_type = options.hi_type
    this.setData({
      hi_type:hi_type
    })
    this.fetchData(5);
  },
  fetchHistoryData: function () {
    var limit = this.data.limit
    limit = limit + 5
    if(this.data.hi_type * 1 == 2){
      this.setData({
        homework_history: true
      })
    }
    this.fetchData(limit)
    this.setData({ limit: limit })
  },
})