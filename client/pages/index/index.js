//index.js
//获取应用实例
var config = require('../../config')
var app = getApp();
Page({
  data: {
    offline: false,
    remind: '加载中',
    cores: [],
    card: {},
    types: ['topLeft', 'topRight', 'bottomLeft', 'bottomRight'],
    typeIndex: 3,
    colors: ['light', 'stable', 'positive', 'calm', 'balanced', 'energized', 'assertive', 'royal', 'dark'],
    colorIndex: 4,
    buttons: [],
    buttons_hidden:true,
    position: 'bottomRight',
    visible: false,
  },
  //按钮
  buttonClicked(e) {
    const { index } = e.detail
    var label  = e.detail.value.label
    //行政简讯
    label === "行政简讯" && wx.navigateTo({
      url: '/pages/publish/publish?publish_type=0'
    })
    //公告新闻
    label === "公告新闻" && wx.navigateTo({
      url: '/pages/publish/publish?publish_type=1'
    })
    //作业
    label === "班级作业" && wx.navigateTo({
      url: '/pages/publish/publish?publish_type=2'
    })
    //班级消息
    label === "班级消息" && wx.navigateTo({
      url: '/pages/publish/publish?publish_type=3'
    })
    
  },
  //分享
  onShareAppMessage: function(){
    return {
      title: '云校园',
      desc: '碎片化、一站式、一体化校园移动门户',
      path: '/pages/index/index'
    };
  },
  //下拉更新
  onPullDownRefresh: function(){
    this.getCardData()
    //wx.stopPullDownRefresh();
  },
  onShow: function(){
    this.getCardData()
  },
  onLoad: function(){
    //this.login();
    //拉取导航功能
    var level = app.user.level
    if(level < 3){
      this.setData({
        buttons_hidden:false
      })
    }
    this.fetchNavigation()
    this.fetch_floating_button()
    this.getCardData()
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
  //获取导航功能
  fetchNavigation:function(){
    var that = this
    wx.request({
      method: 'post',
      data: {
        level: app.level
      },
      url: config.host + '/weapp/navigation',
      success: function (res) {
        var navigation = res.data.data.result
        if (navigation.length && res.statusCode === 200) {
          that.setData({
            cores: [navigation]
          })
        }
      }
    })
  },
  fetch_floating_button:function(){
    var that = this
    wx.request({
      method: 'post',
      data: {
        level: app.level
      },
      url: config.host + '/weapp/floating_button',
      success: function (res) {
        var floating_button = res.data.data.result
        if (floating_button.length && res.statusCode === 200) {
          that.setData({
            buttons: floating_button
          })
        } 
      }
    })
  },
  //获得最新的公告和作业信息
  getCardData:function(){
    var that = this
    wx.request({
      method: 'post',
      data: {
        user: app.user
      },
      url: config.host + '/weapp/index_latest',
      success: function (res) {
        var card = res.data.data
        if (card.length && res.statusCode === 200) {
          that.setData({
              card:card
            })
        }
      },
      fail: function (res) {
        wx.hideToast();
      }
    })
  }
});