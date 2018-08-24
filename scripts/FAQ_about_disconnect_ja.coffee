# Description:
#   
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   
#
# Notes:
#   
#
# Author:
#   

module.exports = (robot) ->
  cal = -> 
    first = yield '''
                まずは次のことを確認してみてください
                1. PCとマシンを1対1でUSB接続している？
                2．USBの接続にハブを介していない？
                3．基板のスイッチはヒートシンク側になっている？
                解決しましたか？
              '''
    if first == 'いいえ'　or first == '/(N|n)o/i'
      OS = yield '''
                    ご使用のOSはMacですか？それともWindowsですか？
                  '''
      if OS == '/(W|w)in/i'　
        second = yield '''
                      Windowsですね？
                      では次のことを確認してください
                      １．サービスを開き、”FaboolLaserWin”または”SmartLaserWin”が存在しないこと
                      ２．PCとマシンをUSBをつないだ状態でデバイスマネージャを開き、”ポート（COMとLPT）”に”STMicroelectronics Virtual COM Port（COMｘ）”が表示されること
                      解決しましたか？
                    '''
        if second == 'いいえ' or second == '/(N|n)o/'
          secondError = yield '''
                          1番と2番、どちらが違っていましたか？
                        '''
          if secondError == '1'
            third = yield '''
                          "FaboolLaserWin"あるいは"SmartLaserWin"が存在したのですね？
                          以下のどちらかを実施してください
                          ・サービスー該当するプログラムを右クリックー”停止”を実行
                          ・コントロールパネルー”プログラムと機能”ー該当するプログラムを右クリックー”アンインストール”
                          解決しましたか？
                        '''
          else if secondError == '2'
            third = yield '''
                          デバイスマネージャに”STMicroelectronics Virtual COM Port（COMX）”がなかったのですね？
                          Arduino mega 2560が存在しますか？
                          →　存在する場合は右クリックー”デバイスのアンインストール”を実施してください
                          下記URLにジャンプしてデバイスをインストールしてください
                          https://support.smartdiys.com/hc/ja/articles/360002320492-Win-%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%AB%E3%83%89%E3%83%A9%E3%82%A4%E3%83%90-%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%97%E3%81%A6%E3%82%82%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E3%83%9E%E3%83%8D%E3%83%BC%E3%82%B8%E3%83%A3%E3%83%BC%E3%81%ABSTMicroelectronics-Virtual-COM-Port%E3%81%8C%E8%A1%A8%E7%A4%BA%E3%81%95%E3%82%8C%E3%81%AA%E3%81%84
                          解決しましたか？
                        '''
  
  next_value = (input) ->
    robot.cal.next(input).value
              　
  robot.respond /非接続/i, (msg) ->
    robot.ignore_input = true
    robot.cal = cal()
    msg.send(next_value())

  robot.hear /(.*)\s*$/i, (msg) ->
                if !('cal' of robot and robot.cal)
                        return
                if 'ignore_input' of robot and robot.ignore_input
                        delete robot.ignore_input
                        return
                msg.send(next_value msg.match[1])


