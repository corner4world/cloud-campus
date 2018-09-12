const CONF = {
  port: '5757',
  rootPathname: 'campus-cloud',

  // 微信小程序 App ID
  appId: 'wxfbf3106bdbe8608f',

  // 微信小程序 App Secret
  appSecret: '13fc8e9cf77b0a49d6434b9de42f320b',

  // 是否使用腾讯云代理登录小程序
  useQcloudLogin: false,

  /**
   * MySQL 配置，用来存储 session 和用户信息
   * 若使用了腾讯云微信小程序解决方案
   * 开发环境下，MySQL 的初始密码为您的微信小程序 appid
   */
  mysql: {
    host: '127.0.0.1', //222.186.58.116 localhost
    port: 3306,
    user: 'root', //root
    db: 'campus_cloud',//cloud_campus
    pass: '1qaz!QAZ',//wxfbf3106bdbe8608f
    char: 'utf8'//
  },

  cos: {
    /**
     * 地区简称
     * @查看 https://cloud.tencent.com/document/product/436/6224
     */
    region: 'ap-guangzhou',
    // Bucket 名称
    fileBucket: 'uploadfiles',
    // 文件夹
    uploadFolder: 'uploadfiles'
  },
  // 微信登录态有效期
  wxLoginExpires: 7200,
  wxMessageToken: 'abcdefgh',

  // 其他配置 ...
  serverHost: 'https://client.campus-cloud.xyz',
  tunnelServerUrl: 'https://client.campus-cloud.xyz',
  tunnelSignatureKey: '27fb7d1c161b7ca52d73cce0f1d833f9f5b5ec89',
  // 腾讯云相关配置可以查看云 API 密钥控制台：https://console.cloud.tencent.com/capi
  qcloudAppId: '1252875786',
  qcloudSecretId: 'AKIDTkmYdWUj03rqb6CYUGm7HFyRedMrk8wV',
  qcloudSecretKey: 'TjkW3LPEUZUt76qJWTlna6NTIuLXUBco',
  wxMessageToken: 'jp',
  networkTimeout: 30000
}

module.exports = CONF
