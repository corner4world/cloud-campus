//app.js
App({
  version: 'v0.1.2', //版本号
  onLaunch: function() {
    
  },
  //保存缓存
  saveCache: function(key, value) {
    
  },
  //清除缓存
  removeCache: function(key) {
    
  },
  //后台切换至前台时
  onShow: function(){

  },
  //判断是否有登录信息，让分享时自动登录
  loginLoad: function(onLoad){
    
  },
  //getUser函数，在index中调用
  getUser: function(response) {
    
  },
  processData: function(key){
    
  },
  getUserInfo: function(cb){
    
  },
  //完善信息
  appendInfo: function(data){
    
  },
  showErrorModal: function(content, title){
    wx.showModal({
      title: title || '加载失败',
      content: content || '未知错误',
      showCancel: false
    });
  },
  showLoadToast: function(title, duration){
    wx.showToast({
      title: title || '加载中',
      icon: 'loading',
      mask: true,
      duration: duration || 10000
    });
  },
  util: require('./utils/util'),
  key: function(data){ return this.util.key(data) },
  enCodeBase64:function(data){ return this.util.base64.encode(data)},
  cache: {},
  user:{},
  level:5,
  school_code:"100001"
});