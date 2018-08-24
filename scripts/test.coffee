{CronJob} = require('cron')
 
module.exports = (robot) ->
    envelope = room: "myhouse"
 
    quizDialog = (category) ->
        answer = yield 'kairaitowanani'
        if /.*操り人形.*/.test answer
            mes = 'seikaidesu'
        else
            mes = 'chigaimasu.seikaiwaayaturiningyodesu'
        delete robot.dialog
        yield mes
 
    registerAlarm = (hour, min, text, motion) ->
        cron = new CronJob "0 #{min} #{hour} * * *", () ->
            robot.send envelope, JSON.stringify({text,motion})
        cron.start()
 
    dsend = (msg, text, motion) ->
        msg.send JSON.stringify({text,motion})
 
    drespond = (reg, text, motion) ->
        robot.respond reg, (msg) ->
            if !robot.dialog?
                dsend msg, text, motion
 
    # アラーム設定
    registerAlarm 6, 30, "kaishaniokureruyo.", [[2,0],[0,15],[2,63]]
 
    # 単純な応答
    drespond /.*こんにちは.*/, "konnitiwa",[[1,0],[0,30],[1,63]]
    drespond /こんばんは/, "konbanwa",[[1,0],[0,30],[1,63]]
    drespond /おはよう/, "ohayougozaimasu",[[1,0],[0,30],[1,63]]
    drespond /話題/, "mo\'-/suguse\'nnkyodane.",[[1,0],[0,30],[1,63]]
 
    # クイズの開始
    robot.respond /.*クイズ.*/, (msg) ->
        if !robot.dialog?
            robot.dialog = quizDialog "一般"
 
    # 対話の進行
    robot.respond /(.*)/, (msg) ->
        if robot.dialog
            dsend msg, robot.dialog.next(msg.match[1]).value, [[1,30],[0,10],[1,20]]