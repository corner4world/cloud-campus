const app = getApp()
Page({
  data: {
    items: [
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/account.png',
        text: '账号信息',
        path: '/pages/user/account/account'
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/album.png',
        text: '班级相册',
        path: '/pages/address/list/index'
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/hot-line.png',
        text: '客户热线',
        path: '18521708248',
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/opinion.png',
        text: '反馈意见',
        path: '/pages/help/list/index',
      },
    ],
    settings: [
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/clear.png',
        text: '清除缓存',
        path: ''
      },
      {
        icon: 'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/about.png',
        text: '关于我们',
        path: '/pages/about/index'
      },
    ],
    storage:0,
    username:'',
    avatar:'https://uploadfiles-1252875786.cos.ap-guangzhou.myqcloud.com/uploadfiles/campus-client/avatar.png'
  },
  onLoad() {
    var that = this 
    var user = app.user
    that.setData({
      username: user.username,
      avatar:user.avatar
    })
    var settings = that.data.settings
    wx.getStorageInfo({
      success: function(res) {
        settings[0].path = res.currentSize+'kb'
        that.setData({
          settings: settings
        })
      },
    })
  },
  navigateTo(e) {
    const index = e.currentTarget.dataset.index
    const path = e.currentTarget.dataset.path
    wx.navigateTo({
      url: path,
    })
  },
  bindtap(e) {
    var that = this 
    const index = e.currentTarget.dataset.index
    switch(index){
      case 0:
        var settings = that.data.settings
        wx.showModal({
          title: '友情提示',
          content: '确定要清除缓存吗？',
          success:function(res){
            if(res.confirm){
              wx.clearStorage()
              settings[0].path = '0kb'
              that.setData({
                settings: settings
              })
            }
          }
        })
        break
      case 1:

        break
    }
    
  },
  logout(){
    wx.showModal({ title: '友情提示', content: '确定要登出吗？',
      success:function(){
        wx.reLaunch({
          url: '/pages/login/login',
        })
      }
    })
  },
})