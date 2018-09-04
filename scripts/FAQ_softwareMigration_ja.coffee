module.exports = (robot) -> 
	FAQ_softwareMigration_ja = -> 
		Q1_EwW7umXjxg = yield '''
			ソフトウェア移行の手続き　ですね？
現在ご使用のマシンを選んでください
１．SmartLaserシリーズ（基板未アップデート）
２．SmartLaserシリーズ（基板アップデート済み）
３．FaboolLaserシリーズ
※プロジェクトデータの移行は”プロジェクト　移行”でFAQしてください
１・２・３
			'''
		if Q1_EwW7umXjxg == '１' 
			Q2_1mGrShanm9 = yield '''
				１
SmartSoftwareからFABOOLSoftware liteへの移行をガイドします

１．インストーラをダウンロードします
Win：https://www.smartdiys.com/data/v290/SmartInstallerWin.msi
Mac：https://www.smartdiys.com/data/v290/SmartInstallerMac_v290.pkg

２．インストーラを実行してインストールします

３．Firefox、またはChromeを起動し、アドレスバーに下記URLを入力、実行します
127.0.0.1:4444

※下記ページにて、インストールの全工程を確認できます
https://www.smartdiys.com/manual/user-registration-driver-installation/

FABOOLSoftware liteが実行できましたか？
はい・いいえ
				'''
			if Q2_1mGrShanm9 == 'はい' 
				Q3_hEp1AbW3s5 = yield '''
					はい
マシンとPCをUSB接続したとき、FABOOLSoftware liteの画面の右下のドライバーが”接続”になっていますか？
はい・いいえ
					'''
				if Q3_hEp1AbW3s5 == 'はい' 
					Q5_7993rPi0QO = yield '''
						はい
よかったです
レーザー加工機を楽しんでください！
							'''
				else if Q3_hEp1AbW3s5 == 'いいえ' 
					Q4_FZBpThOAiW = yield '''
						いいえ
以下を確認してください
・マシンとPCはつないでいますか？
・SmartSoftware、FABOOLDesktopは終了していますか？

解決しましたか？
はい・いいえ
						'''
					if Q4_FZBpThOAiW == 'はい' 
						Q5_0B6oJaVC1U = yield '''
							はい
良かったです
レーザー加工機を楽しんでください！
							'''
					else if Q4_FZBpThOAiW == 'いいえ' 
						Q5_O2I8UNKfxD = yield '''
							いいえ
”FaboolSoftware”　”非接続”　をキーワードにFAQを呼び出してください

							'''
					else 
					 	　'''選択肢がありません''' 
				else 
				 	　'''選択肢がありません''' 
			else if Q2_1mGrShanm9 == 'いいえ' 
				Q3_aVT6g8A5XU = yield '''
					いいえ
以下を確認してください
・SmartSoftwareは終了させていますか？
・アクセスしているURLは間違いないですか？
・使用しているブラウザはFirefoxまたはChromeで間違いないですか？

解決しましたか？
はい・いいえ
					'''
				if Q3_aVT6g8A5XU == 'はい' 
					Q4_lEVdpVWWV0 = yield '''
						はい
よかったです
接続状態に異常があるときは”FaboolSoftware”　”非接続”をキーワードにFAQを呼び出してください

						'''
				else if Q3_aVT6g8A5XU == 'いいえ' 
					Q4_AIAqhgI9gF = yield '''
						いいえ
原因不明です

下記URLから報告お願いします

https://support.smartdiys.com/hc/ja/requests/new
上記URLにアクセスし、下記内容を記入してお問い合わせください

＜お問い合わせ＞ソフトウェアに関するサポート
お問い合わせ内容：その他の不具合
件名：FABOOLSoftwareLiteが表示されない
お問い合わせ内容：FAQの指示に従って移行したが、FABOOLSoftwareLiteが表示されない
						'''
				else 
				 	　'''選択肢がありません''' 
			else 
			 	　'''選択肢がありません''' 
		else if Q1_EwW7umXjxg == '２' 
			Q2_5G0MaX6gkO = yield '''
				２
どの移行を参照しますか？
１．SmartSoftware→FABOOLSoftware lite
２．SmartSoftware→FABOOLDesktop
※FABOOLSoftwareLite→FABOOLDesktopやFABOOLDesktop→FABOOLSoftware liteへの移行は
FaboolLaserシリーズを参考にしてください
１・２
				'''
			if Q2_5G0MaX6gkO == '１' 
				Q3_1KxQoZ37F5 = yield '''
					１
SmartSoftwareを終了させた後、下記インストーラをダウンロード＆インストールしてください
Win：https://www.smartdiys.com/data/v280/FaboolInstallerWin.msi
Mac：https://www.smartdiys.com/data/v280/FaboolInstallerMac_v280.pkg
					'''
			else if Q2_5G0MaX6gkO == '２' 
				Q3_DqiUlLuzHs = yield '''
					２
SmartSoftwareを終了させた後、下記インストーラをダウンロード＆インストールしてください
Win：http://download.smartdiys.com/fabooldesktop/online_installer/FABOOLDesktop_online_installer_win.exe
Mac：http://download.smartdiys.com/fabooldesktop/online_installer/FABOOLDesktop_online_installer_mac.dmg
					'''
			else 
			 	　'''選択肢がありません''' 
		else if Q1_EwW7umXjxg == '３' 
			Q2_OIdVwKj42h = yield '''
				３
どちらを希望しますか？
１．FABOOLSoftware lite→FABOOLDesktopへの移行
２．FABOOLDesktop→FABOOLSoftware liteへの移行
１・２
				'''
			if Q2_OIdVwKj42h == '１' 
				Q3_fTzU03qZKY = yield '''
					１
※　FABOOLDesktopのインストール時にFABOOLSoftwareLiteがアンインストールされます
※　FABOOLSoftwareLiteがアンインストールされてもプロジェクトデータはローカルPCに残っているので、再度FABOOLSoftwareLiteをインストールすれば利用可能です

１．下記URLからインストーラをダウンロードします
Win：http://download.smartdiys.com/fabooldesktop/online_installer/FABOOLDesktop_online_installer_win.exe
Mac：http://download.smartdiys.com/fabooldesktop/online_installer/FABOOLDesktop_online_installer_mac.dmg

２．インストーラを実行します
指示通りに次へを押していきます

３．インストール完了後、FABOOLDesktopが起動すればOKです

起動できましたか？
はい・いいえ
					'''
				if Q3_fTzU03qZKY == 'はい' 
					Q4_qB51sTXAEh = yield '''
						はい
良かったです
レーザー加工機を楽しんでください！
						'''
				else if Q3_fTzU03qZKY == 'いいえ' 
					Q4_CJhnLrItAc = yield '''
						いいえ
インストールに失敗しています
以下を確認して再インストールしてください
・ネットワークには接続していますか？
・空き容量は十分ですか？
・ほかのアプリケーションを終了していますか？
・（Winのみ）インストール時のコンポーネント選択にて全部にチェックが入っていますか？
・（Macのみ）バージョンv1.4.5以降は試されましたか？
解決しましたか？
はい・いいえ
						'''
					if Q4_CJhnLrItAc == 'はい' 
						Q5_MKA9UPjncU = yield '''
							はい
良かったです
レーザー加工機を楽しんでください！
							'''
					else if Q4_CJhnLrItAc == 'いいえ' 
						Q5_amFodb458u = yield '''
							いいえ
原因不明です

下記URLから報告お願いします

https://support.smartdiys.com/hc/ja/requests/new
上記URLにアクセスし、下記内容を記入してお問い合わせください

＜お問い合わせ＞ソフトウェアに関するサポート
お問い合わせ内容：その他の不具合
件名：FABOOLDesktopが表示されない
お問い合わせ内容：FAQの指示に従って移行したが、FABOOLDesktopが表示されない

							'''
					else 
					 	　'''選択肢がありません''' 
				else 
				 	　'''選択肢がありません''' 
			else if Q2_OIdVwKj42h == '２' 
				Q3_UZv3U4nFOe = yield '''
					２
FABOOLDesktopインストール後、FABOOLSoftwareLiteを使用したい場合は、FABOOLSoftwareLiteをインストールしなおすだけでOKです
Win：https://www.smartdiys.com/data/v280/FaboolInstallerWin.msi
Mac：https://www.smartdiys.com/data/v280/FaboolInstallerMac_v280.pkg

※下記はWindows限定
もしその後でFABOOLDesktopを使用したくなった場合は、スタートメニューからサービスを選択し、”FaboolLaserWin”を選択
右クリックして”停止”を実行した後、FABOOLDesktopを起動すればOKです
					'''
			else 
			 	　'''選択肢がありません''' 
		else 
		 	　'''選択肢がありません''' 
			 
	reactedUserName = ""
	next_value = (input) -> 
		robot.FAQ_softwareMigration_ja.next(input).value 
	robot.respond /(?=.*ソフト)(?=.*移行)/i, (msg) -> 
		robot.ignore_input = true 
		robot.FAQ_softwareMigration_ja = FAQ_softwareMigration_ja() 
		reactedUserName = msg.message.user.name
		msg.send(next_value()) 
	robot.hear /(.*)s*$/i, (msg) -> 
		if !('FAQ_softwareMigration_ja' of robot and robot.FAQ_softwareMigration_ja) 
			return 
		if 'ignore_input' of robot and robot.ignore_input 
			delete robot.ignore_input 
			return 
		if reactedUserName != msg.message.user.name
			return			
		msg.send(next_value msg.match[1]) 
