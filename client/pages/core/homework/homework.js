var config = require('../../../config')
var app = getApp();

Page({
  data: {
    title: '作业',
    homework: [],
    publish_type:"",
    hidden: false,
    limit:10,
    historyData:[],
    
  },
  onPullDownRefresh: function () {
    this.fetchData();
    //wx.stopPullDownRefresh();
  },
  fetchData: function (history,limit) {
    var that = this;
    that.setData({
      hidden: false
    })
    wx.request({
      method: 'post',
      data: {
        user:app.user,
        level: app.level,
        history:history,
        limit:limit
      },
      url: config.host + '/weapp/homework',
      success: function (res) {
        var homework = res.data.data.result
        if (homework.length && res.statusCode === 200 && res.data.code != -1) {
          if(history){
            that.setData({
              historyData: homework,
              hidden: true
            }) 
          }
          else{
            that.setData({
              homework: homework,
              hidden: true
            }) 
          }
          
        } 
        else if (homework.length < 1 && res.statusCode === 200 && res.data.code != -1){
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
    this.fetchData(false,0);
  },
  fetchHistoryData:function(){
    var limit = this.data.limit
    this.fetchData(true, limit)
    limit = limit + 10
    this.setData({ limit: limit })
  }
})