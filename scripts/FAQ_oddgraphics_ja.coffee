module.exports = (robot) -> 
	FAQ_oddgraphics_ja = -> 
		Q1_bDg2SWnDtU = yield '''
			SVGの表示がおかしい　ですね？
最も近い症状を選んでください
１．文字や埋め込み画像が表示されない
２．表示された内容が異なっている
３．サイズや位置がおかしい
１・２・３
			'''
		if Q1_bDg2SWnDtU == '１' 
			Q2_4g6Z26ObyM = yield '''
				１
FABOOLDesktopでは、SVGの文字と
埋め込み画像には対応していません
文字の場合は、SVG作成ソフトで”ストロークをパスに変換”を行うと表示される場合があります
				'''
		else if Q1_bDg2SWnDtU == '２' 
			Q2_AxOAzKvsJW = yield '''
				２
どのように異なっていますか？
１．作成したソフト上のものと比較してデータが欠損している
２．FaboolSoftwareと比較してデータが欠損している
１・２
				'''
			if Q2_AxOAzKvsJW == '１' 
				Q3_uGz8jnKLSQ = yield '''
					１
未対応のSVGタグがあるかもしれません
SVG作成ソフトにて、”ストロークをパスに変換”などを行うと改善する場合があります
改善しない場合は下記URLよりお問い合わせください
https://support.smartdiys.com/hc/ja/requests/new
					'''
			else if Q2_AxOAzKvsJW == '２' 
				Q3_zKc2WjG4eo = yield '''
					２
FaboolSoftwareでは表示上は問題なくても、加工すると欠損が生じる場合があります
FABOOLDesktopでは表示結果がそのまま加工結果になるので、FABOOLDesktopの表示が正常です
					'''
			else 
			 	　'''選択肢がありません''' 
		else if Q1_bDg2SWnDtU == '３' 
			Q2_RTtIe3G2ce = yield '''
				３
どのようにおかしいですか？
１．作成したソフト上のものと比較してサイズが違う
２．FaboolSoftwareと比較してサイズや位置が違う
１・２
				'''
			if Q2_RTtIe3G2ce == '１' 
				Q3_YdAy4srxUT = yield '''
					１
対応していないSVG作成ソフトの可能性があります
下記URLにアクセスし、ご使用中のソフトが存在するか確認してください
https://support.smartdiys.com/hc/ja/articles/360004717352-%E5%8A%A0%E5%B7%A5%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6
					'''
			else if Q2_RTtIe3G2ce == '２' 
				Q3_Qtu5kZgyv9 = yield '''
					２
作成したソフトはInkscapeですか？
Inkscapeはv0.92よりDPIが90→96へ変更になりました
また、FaboolSoftwareはInkscapeで作られたデータを、90DPI固定でインポートしています
従って、Inkscape_v0.92以降で作成されたデータをFaboolSoftwareでインポートすると、サイズが小さく表示されます
FABOOLDesktopのインポート結果が本来のサイズになっています
また、FaboolSoftwareでは、SVGの余白が間違って表示される場合があります
FABOOLDesktopは表示結果がそのまま加工結果になるので、FABOOLDesktopの表示が正常です
					'''
			else 
			 	　'''選択肢がありません''' 
		else 
		 	　'''選択肢がありません''' 
			 
	reactedUserName = ""		 
	next_value = (input) -> 
		robot.FAQ_oddgraphics_ja.next(input).value 
	robot.respond /(?=.*VG)(?=.*おかし)|(?=.*グラフィック)(?=.*おかし)/i, (msg) -> 
		robot.ignore_input = true 
		robot.FAQ_oddgraphics_ja = FAQ_oddgraphics_ja() 
		reactedUserName = msg.message.user.name
		msg.send(next_value()) 
	robot.hear /(.*)s*$/i, (msg) -> 
		if !('FAQ_oddgraphics_ja' of robot and robot.FAQ_oddgraphics_ja) 
			return 
		if 'ignore_input' of robot and robot.ignore_input 
			delete robot.ignore_input 
			return 
		if reactedUserName != msg.message.user.name
			return	
		msg.send(next_value msg.match[1]) 
