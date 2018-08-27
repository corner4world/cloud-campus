var config = require('../../../config')
var WxParse = require('../../../utils/wxParse/wxParse.js');
var app = getApp();
Page({
  data: {
    title: '学校公告',
    notice: [],
    hidden: false,
    limit: 5,
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
      url: config.host + '/weapp/notice',
      success: function (res) {
        console.log(res)
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
            title: '暂无最新公告',
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

    //test
    var that = this;
    wx.request({
      url: 'https://www.baidu.com',
      method: 'get',
      success: function (res) {
        //console.log(res)
        var article = "<p><img src='http://192.168.137.1:8080/static/upload/1fd941c4-1c24-4b10-b107-aee0687be3df.jpg' style='max-width:100%;'><br></p><p><video src='https://chimee.org/vod/1.mp4' controls=''>     您的浏览器不支持Video标签。 </video></p><p><br></p><p><br></p>";
        WxParse.wxParse('article', 'html', article, that, 0);
      }
    })
  },
  fetchHistoryData: function () {
    var limit = this.data.limit
    limit = limit + 5
    this.fetchData(limit)
    this.setData({ limit: limit })
  }
})