var config = require('../../../config')
var app = getApp();
Page({
  data: {
    id: "",
    homework_information: "",
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
  onShareAppMessage:function(){
    var homework_information = this.data.homework_information
    var id = this.data.id
    return{
      title:homework_information.title,
      desc:homework_information.summary,
      path:'/pages/core/homework_information_detail/homework_information_detail?id='+id
    }
  },
  fetchData: function (id) {
    var that = this
    wx.request({
      method: 'post',
      data: {
        id: id
      },
      url: config.host + '/weapp/homework_information_detail',
      success: function (res) {
        var homework_information = res.data.data.result
        if (homework_information.length && res.statusCode === 200 && res.data.code != -1) {
          that.setData({
            homework_information: homework_information[0]
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