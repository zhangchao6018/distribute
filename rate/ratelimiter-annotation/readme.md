## redis+lua实现非入侵式式限流注解



step1:项目中引入ratelimiter-annotation该模块
step2:需要redis
step3:启动,访问 http://localhost:10086/test-annotation


{
    "timestamp": "2020-05-21T13:41:28.022+0000",
    "status": 500,
    "error": "Internal Server Error",
    "message": "Your access is blocked",
    "path": "/test"
}