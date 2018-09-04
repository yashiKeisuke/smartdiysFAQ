
module.exports = (robot) -> 

	FAQ_disconnect_ja = -> 
		Q1_CwLBcHXV3C = yield '''
			接続状態にならないですね？
1. PCとマシンを1対1でUSB接続している？
2．USBの接続にハブを介していない？
3．基板のスイッチはヒートシンク側になっている？
解決しましたか？
はい・いいえ
			'''
		if Q1_CwLBcHXV3C == 'はい' 
			Q2_xaptDcVDhL = yield '''
				はい
よかったです
またのご利用お待ちしております
				'''
		else if Q1_CwLBcHXV3C == 'いいえ' 
			Q2_8Swmsad0fk = yield '''
				いいえ
ご使用中のPCのOSは以下のうちどれですか？
Win・Mac
				'''
			if Q2_8Swmsad0fk == 'Win' 
				Q3_KexT5ewRfa = yield '''
					Win
では次のことを確認してください
１．サービスを開き、”FaboolLaserWin”または”SmartLaserWin”が存在しないこと
２．PCとマシンをUSBをつないだ状態でデバイスマネージャを開き、”ポート（COMとLPT）”に”STMicroelectronics Virtual COM Port（COMｘ）”が表示されること
解決しましたか？
はい・いいえ
					'''
				if Q3_KexT5ewRfa == 'はい' 
					Q4_Q2dw5Ro4cO = yield '''
						はい
よかったです
またのご利用お待ちしております
						'''
				else if Q3_KexT5ewRfa == 'いいえ' 
					Q4_LWcZrCaGna = yield '''
						いいえ
１．が間違っていた場合
　→　コントロールパネルの”プログラムと機能”にて、”FaboolLaserWin”あるいは”SmartLaserWin”をアンインストールしてください
２．が間違っていた場合
　→　https://support.smartdiys.com/hc/ja/articles/360002320492-Win-%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%AB%E3%83%89%E3%83%A9%E3%82%A4%E3%83%90-%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%97%E3%81%A6%E3%82%82%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E3%83%9E%E3%83%8D%E3%83%BC%E3%82%B8%E3%83%A3%E3%83%BC%E3%81%ABSTMicroelectronics-Virtual-COM-Port%E3%81%8C%E8%A1%A8%E7%A4%BA%E3%81%95%E3%82%8C%E3%81%AA%E3%81%84
　　　上記URLにアクセスし、ドライバをインストールしてください
解決しましたか？
はい・いいえ
						'''
					if Q4_LWcZrCaGna == 'はい' 
						Q5_Kt8EUt2pch = yield '''
							はい
良かったです
レーザー加工機を楽しんでください！
							'''
					else if Q4_LWcZrCaGna == 'いいえ' 
						Q5_PEiZIk1PDc = yield '''
							いいえ
原因不明です

下記URLから報告お願いします

https://support.smartdiys.com/hc/ja/requests/new
上記URLにアクセスし、下記内容を記入してお問い合わせください

＜お問い合わせ＞ソフトウェアに関するサポート
お問い合わせ内容：その他の不具合
件名：STMドライバの再インストールを行っても接続しない
お問い合わせ内容：FAQの指示に従って非接続を解消しようとしたが、解消しなかった
							'''
					else 
					 	　'''選択肢がありません''' 
				else 
				 	　'''選択肢がありません''' 
			else if Q2_8Swmsad0fk == 'Mac' 
				Q3_VVx8DAUU9s = yield '''
					Mac
					'''
			else 
			 	　'''選択肢がありません''' 
		else 
		 	　'''選択肢がありません''' 

		delete robot.FAQ_disconnect_ja
		return

	next_value = (input) -> 
		robot.FAQ_disconnect_ja.next(input).value 
	robot.respond /非接続|(?=.*接続)(?=.*しな)|(?=.*接続)(?=.*ならな)/i, (msg) -> 
		robot.ignore_input = true 
		robot.FAQ_disconnect_ja = FAQ_disconnect_ja() 
		msg.send(next_value()) 
	robot.hear /(.*)s*$/i, (msg) -> 
		if !('FAQ_disconnect_ja' of robot and robot.FAQ_disconnect_ja) 
			return 
		if 'ignore_input' of robot and robot.ignore_input 
			delete robot.ignore_input 
			return 
		if /bot/.test msg.message.user.name
			return
		msg.send(next_value msg.match[1]) 
