/**
 * 테스트에 필요한 문제 및 결과
 */
 	
 	var q = {
			1: {"title" : "전자제품 매장에서 노트북을 구경중인 나. 직원이 친절한 미소를 지으며 다가온다.<br>이때 나의 반응은?", "type" : "EI", "A" : "와! 설명도 잘해주시고 친절하셔서 좋다.<br>궁금했던거 다 물어봐야겠어", "B" : "혼자 조용히 보고싶은데..<br>역시 쇼핑은 온라인인가봐ㅠㅠ"},	
			2: {"title" : "\"코끼리는 어떤 휴대폰을 쓸까?\"<br>친구의 질문에 대한 나의 대답은?", "type" : "SN", "A" : "코끼리가 휴대폰을 어떻게 써.", "B" : "터치가 되는 65인치 티비는 어때?<br>코끼리 코로도 터치가 되려나?<br>강화유리필름은 얼마나 좋은걸 붙여야하지?"},
			3: {"title" : "내 프로젝트를 본 친구의 반응<br>\"와 네가 제일 잘했다! 근데 너 별로 열심히 안 한 것 같은데 코딩에 재능있나봐\"", "type" : "TF", "A" : "젤 잘했다고? 개좋아", "B" : "내가 얼마나 열심히 노력했는데..!(울컥)"},
			4: {"title" : "내 휴대폰 알림, 메일함 상태는?", "type" : "JP", "A" : "숫자가 떠있는 꼴은 못보지!<br>바로바로 읽어서 깨끗한 상태", "B" : "카카오톡, 메일, 문자··<br>안읽은 숫자 배지로 도배 돼있다."},	
			5: {"title" : "주중 내내 열심히 일한 당신. 주말을 보내는 방법은?", "type" : "EI", "A" : "내내 회사(실내)였으니 주말엔 밖에 나가야한다.", "B" : "내내 회사(집밖)였으니 주말엔 집에 있어야한다."},
			6: {"title" : "[사과] 하면 생각나는 것은?", "type" : "SN", "A" : "빨간색, 그냥 과일, 달다", "B" : "중력, 뉴턴, 백설공주"},
			7: {"title" : "친구가 \"나 우울해서 아이패드 질렀어\" 라고 했을 때 내 반응은?", "type" : "TF", "A" : "헐 아이패드 무슨 기종? 보자!", "B" : "뭐가 힘들었는데ㅠ 지금은 괜찮아?"},
			8: {"title" : "휴대폰 음량 조절 버튼에 문제가 생겼다.<br>당장 사용하는데 큰 지장은 없는 상황에서 어떻게 할것인가?", "type" : "JP", "A" : "시간을 내서 바로바로 해결한다.", "B" : "최대한 미루고 여유 있을 때 해결한다."},	
			9: {"title" : "함께 즐겁게 논 친구와 집 가는 동선이 겹친다. 이때 나는?", "type" : "EI", "A" : "집 가는길이 심심하지 않고 좋다!<br>얘기하면서 집 가야지.", "B" : "혼자 귀가하면서 쉬고싶은데.. 다소 괴롭다."},
			10: {"title" : "\"만약에.. 누군가 너한테 100만원을 주면 온잇에서 뭘 살거야??<br>근데 대신 너가 젤 싫어하는 사람한테도 하나를 사줘야돼 또 만약에...\"<br>친구의 만약에 질문에 대한 내 반응은?", "type" : "SN", "A" : "아이패드..? 걔도 걍 사주지 뭐<br>(대충 대답은 하지만 더 캐물으면 피곤해진다.)", "B" : "헐 뭘 사야하지? 싫어하는게 어느정도인데??<br>(흥미진진해하며 고민한다.)"},	
			11: {"title" : " 헤드폰을 사려는 나에게 본인 추천 아이템을 말해주는 친구.<br>\"생각해볼게\" 라고 말한 나의 의중은?", "type" : "TF", "A" : "정말로 곰곰이 '생각'해보겠다는 뜻", "B" : "대충 거절. 내가 알아서 한다는 뜻"},
			12: {"title" : "여행을 앞둔 당신의 전자기기 배터리 상태는?", "type" : "JP", "A" : "무조건 미리미리 다 충전!<br>충전기, 보조배터리도 챙긴다.", "B" : "크게 신경쓰지 않는다.<br>충전기? 누군가 가져오겠지ㅎㅎ<br>애써 챙기진 않는다."}
		}
		
	var result = {
			"ISTJ": {"nickName" : "ISTJ", "explain" : "충동구매란 없다! 전자기기를 구매할 때 A to Z 잘 따져보고 계획을 세워 구입하는 편이에요.<br>효율을 중요시 여기기 때문에, 전자기기를 구입하면 사용 꿀팁 등을 꼭 찾아보곤 해요.<br>일정을 기록하는것을 좋아하기 때문에 캘린더 어플을 쓰긴 하지만 타인과 약속이 그리 많지 않아요. 혼자 있는게 젤 편하거든요.<br>같이 여행간 친구가 배터리가 없어서 허덕이면, 타박하면서도 준비된 보조배터리를 선뜻 빌려주는 겉바속촉 당신!", "img" : "resources/img/mbti/ISTJ.jpg", 
					"detail" : "-시간 약속을 중요시 여기는 당신에게-", "img_product" : "resources/img/product/w_sa3_1.jpg", "link" : "product_detail?product_idx=19"},	
			"ISFJ": {"nickName" : "ISFJ", "explain" : "모험을 좋아하지 않기 때문에 검증되지 않는 새로운 전자기기 사용을 미루는편이에요. 검증되고 안정적인 것이 좋거든요.<br>나만의 규칙을 정해 휴대폰 어플을 배치하는 걸 좋아해요. 폴더별/색깔별로 정리하는걸 즐긴답니다.<br>누군가에게 전화가 오면 받을까 말까 고민을 엄청하는 편이에요. 또, 남에게 도움주는 것을 좋아해서 본인의 전자기기를 선뜻 빌려주는 경우가 많아요.", "img" : "resources/img/mbti/ISFJ.jpg", 
					"detail" : "-가끔은 전화가 두려운 당신에게-", "img_product" : "resources/img/product/p_ap2_1.jpg", "link" : "product_detail?product_idx=23"},
			"INFJ": {"nickName" : "INFJ", "explain" : "나만의 감성으로 전자기기를 꾸며요. 레터링 케이스를 쓴다거나 예술적인 일러스트 케이스를 애용하는 당신.<br>감수성과 상상력이 풍부해 태블릿이나 노트북으로 다양한 장르의 드라마,영화 보는것을 즐겨요.<br>무던한 성격으로 최신 전자기기에 집착하지 않아요. 한 기기를 오래 쓰는 경우가 많답니다.", "img" : "resources/img/mbti/INFJ.jpg", 
					"detail" : "-OTT 감상을 즐기는 당신에게-", "img_product" : "resources/img/product/t_ap1_1.jpg", "link" : "product_detail?product_idx=46"},	
			"INTJ": {"nickName" : "INTJ", "explain" : "지식과 지적 능력을 기르는 걸 좋아해서 전자기기도 이를 위해 구입하는 경우가 많아요. 이북리더기를 구입해 책을 읽는다거나 태블릿으로 공부하는 걸 즐겨요.<br>무슨 일이든 세세하게 기록하고 계획하는 것을 좋아해 엑셀이나 캘린더 어플과 친한 당신!<br>독립적인 성향을 지녀 남에게 전자기기를 추천받는다기 보다 혼자 결정내리는 것을 선호해요.", "img" : "resources/img/mbti/INTJ.jpg", 
					"detail" : "-스마트하고 철두철미한 당신에게-", "img_product" : "resources/img/product/w_ap5_1.jpg", "link" : "product_detail?product_idx=16"},	
			"ISTP": {"nickName" : "ISTP", "explain" : "기계 조작을 잘하고 재밌어해 직접 분해하고 조립해 보는 경우가 많아요.<br>혼자만의 문화생활을 즐기는 편이라 영화관 보단 집에서 전자기기로 영화보는걸 선호하는 당신!<br>약간의 귀차니즘이 있기 때문에 메시지 확인이 늦어요. 휴대폰 액정이 깨지더라도 바로바로 수리하지 않는 경우가 많아요.", "img" : "resources/img/mbti/ISTP.jpg", 
					"detail" : "-침대위를 영화관으로 만들어줄-", "img_product" : "resources/img/product/t_ap6_1.jpg", "link" : "product_detail?product_idx=51"},	
			"ISFP": {"nickName" : "ISFP", "explain" : "전화보다 메시지를 선호하는 당신. 사람들과 소통하는 에너지가 한정적이여서 집에가면 연락두절되는 경우가 많아요.<br>개방적이고 유연한 사고를 가졌기 때문에 다른 사람이 전자기기를 추천하면 귀담아 듣는 경우가 많아요. 자기 생각이나 의견을 바꾸는 데 거리낌이 없답니다.<br>음악, 패션에 흥미를 갖고 있는 경우가 많아 헤드폰 구입에 관심이 있을 확률이 높아요!", "img" : "resources/img/mbti/ISFP.jpg", 
					"detail" : "-헤드폰도 패션으로 소화할 당신에게-", "img_product" : "resources/img/product/h_ap1_1.jpg", "link" : "product_detail?product_idx=57"},
			"INFP": {"nickName" : "INFP", "explain" : "휴대폰이나 노트북 바탕화면이 무질서해보이지만, 그 안에서 나만의 규칙이 있다고 주장해요.<br>연락이 귀찮은 당신, 메일함이나 메시지 알람이 잔뜩 쌓여있는 경우가 많아요.<br>공상에 쉽게 빠지며 자유롭게 상상의 나래를 펼치기 좋아하는 성격이기에 영화를 보거나 음악을 들으며 생각에 잠기는 일을 즐긴답니다.", "img" : "resources/img/mbti/INFP.jpg", 
					"detail" : "-음악만이 국가가 허락한..유일한 마약..감성충만 당신을 위해-", "img_product" : "resources/img/product/e_bo1_1.jpg", "link" : "product_detail?product_idx=35"},	
			"INTP": {"nickName" : "INTP", "explain" : "자신의 생각과 취향이 확고해요. 남이 본인이 산 전자기기를 비난해도 그려러니 크게 신경 쓰지 않는 성격이에요.<br>무표정으로 전자기기를 들여다 보고있는 것 같지만 머릿속으로는 다양한 아이디어와 질문이 가득해요!<br>사람들을 만나는 일에서 피로감을 느끼는 경우가 많아요. 가게에 가면 살 것은 이미 정했으니 제발 점원이 말 안걸어줬으면 좋겠다고 속으로 빌어요.", "img" : "resources/img/mbti/INTP.jpg", 
					"detail" : "-독특한 개성을 지닌 당신에게-", "img_product" : "resources/img/product/p_sa2_1.jpg", "link" : "product_detail?product_idx=28"},	
			"ESTP": {"nickName" : "ESTP", "explain" : "생각을 바로 행동으로 옮기는 당신! 재고 따지는 전자기기 구입보다는 본인이 꽂히는 제품을 사게되는 경우가 많아요.<br>남들이 가지 않는 길을 개척하는 것도 좋아해서 후기가 없는 신제품도 거침없이 구입한답니다.<br>친구들 사이에서 리더십이 있는 편이에요. 특히 노는 약속에 리더가 되는 경우가 많아 휴대폰 속 단체 카톡방에서 모임을 주도하는 경우가 많아요", "img" : "resources/img/mbti/ESTP.jpg", 
					"detail" : "-신제품을 두려워하지 않는 당신에게-", "img_product" : "resources/img/product/p_sa1_1.jpg", "link" : "product_detail?product_idx=27"},
			"ESFP": {"nickName" : "ESFP", "explain" : "사교성이 좋은 당신! 사람들과 만나고 소통하는 걸 좋아해요. 혹시 사회적 거리두기를 할 때 친구들과 노트북으로 화상모임을 주도하지는 않았나요?<br>미적 감각과 패션 감각이 매우 뛰어난 성격으로 전자기기도 패션아이템으로 소화시키는 경우가 많아요!<br>색깔있는 헤드폰을 패션아이템으로 소화한다거나, 감각적인 휴대폰 케이스를 사용하는 등 자신의 개성을 뽐내요!", "img" : "resources/img/mbti/ESFP.jpg", 
					"detail" : "-틀에 박힌 것을 싫어하는 당신에게-", "img_product" : "resources/img/product/h_ap3_1.jpg", "link" : "product_detail?product_idx=59"},	
			"ENFP": {"nickName" : "ENFP", "explain" : "새로운 사람 만나기를 좋아해요. 그렇기 때문에 휴대폰 속에는 늘 새로운 사람의 연락처가 주기적으로 저장되곤 한답니다.<br>활기가 넘치며 스몰토크가 일상인 당신, 전자기기를 사러 간 매장에서도 매장 직원과 짱친이 되어 수다를 떨고오곤 해요! 즉흥적인 전자기기 구입은 덤.<br>또, 관심 받는 것을 좋아해 전자기기를 개성있게 꾸미는것을 좋아한답니다.", "img" : "resources/img/mbti/ENFP.jpg", 
					"detail" : "-개성있는 물건이 어울리는 당신에게-", "img_product" : "resources/img/product/w_ap2_1.jpg", "link" : "product_detail?product_idx=13"},	
			"ENTP": {"nickName" : "ENTP", "explain" : "가끔 엄청난 계획이 떠올라서 휴대폰에 메모를 해두지만, 그걸 다시 열어보지 않는 매력이 있어요.<br>직설적이고 솔직하게 내 맘을 표현하는 것에 거리낌이 없는 당신. 누군가 당신의 전자기기에 대해서 무례한 발언을 하면 참지 않아요.<br>거추장스러운 케이스보단 쌩폰이 멋있다고 생각해요. 또, 휴대폰 배터리가 항상 간당간당 할 확률이 높아요.", "img" : "resources/img/mbti/ENTP.jpg", 
					"detail" : "-남들과는 다른 멋을 지닌 당신에게-", "img_product" : "resources/img/product/p_sa4_1.jpg", "link" : "product_detail?product_idx=30"},
			"ESTJ": {"nickName" : "ESTJ", "explain" : "이것저것 배우는 걸 좋아해서, 전자기기도 다양한 기능을 효율적으로 사용해요. 한 물건을 고장내지 않고 오래 사용하는 능력이 있답니다.<br>고가의 전자기기를 구입하는 목표를 세웠다면 그 목표를 달성할 가능성이 높아요! 그 목표 이룰때까지 한 우물만 파는 성향이 있기든요.<br>즉흥적인 구매를 하는 경우는 거의 없고 대부분 계획된 소비를 해요. 미루는 것을 싫어하고 정리정돈을 좋아해서 전자기기 알림함도 깨끗할 가능성이 높아요.", "img" : "resources/img/mbti/ESTJ.jpg", 
					"detail" : "-시간을 효율적으로 사용하는 당신에게-", "img_product" : "resources/img/product/w_sa4_1.jpg", "link" : "product_detail?product_idx=20"},	
			"ESFJ": {"nickName" : "ESFJ", "explain" : "배려심 넘치고 항상 남을 도울 준비가 돼있어요. 그 때문인지 메시지나 전화로 친구들의 고민을 들어주는 일이 잦아요.<br>사교성이 좋고 주변인을 잘 챙기기 때문에, 전자기기 구입을 고민하는 친구에게 본인이 아는 정보를 기꺼이 알려줘요.<br>자연스럽게 분위기를 주도하거나 리더 역할을 맡는 경우가 많아, 캘린더 어플에 기록된 약속이 많아요!", "img" : "resources/img/mbti/ESFJ.jpg", 
					"detail" : "-친구와 통화하는 일이 많은 당신에게-", "img_product" : "resources/img/product/p_ap1_1.jpg", "link" : "product_detail?product_idx=22"},	
			"ENFJ": {"nickName" : "ENFJ", "explain" : "사교성이 풍부하며 다른 사람들의 생각이나 의견에 진지한 관심을 가지고있어요.<br>그렇기 때문에 친구들과 영화나 음악에 대한 감상을 나누는 일을 즐깁니다.태블릿이나 휴대폰에서 음악, OTT 어플을 가장 많이 사용해요.<br> 친구들 사이에 인기가 많아 사진첩에 무리와 찍은 셀카가 많은 당신. 하지만 마이웨이 기질도 있어서, 혼자 여가시간을 보내는 것도 좋아해요.", "img" : "resources/img/mbti/ENFJ.jpg", 
					"detail" : "-가끔은 나만의 시간이 필요한 당신에게-", "img_product" : "resources/img/product/h_ma1_1.jpg", "link" : "product_detail?product_idx=63"},	
			"ENTJ": {"nickName" : "ENTJ", "explain" : "오직 세상에 믿을 사람은 나 하나라고 생각해요. 남이 이래라 저래라 하는걸 싫어해서 전적으로 본인의 의견대로 전자기기를 구입합니다.<br>도전을 즐기는 성격으로 새로운 유형의 전자기기 구입에도 거침없어요.<br>지식에 대한 욕구와 관심이 많아, 구입하려는 전자기기에 대해 철저하게 학습해요.", "img" : "resources/img/mbti/ENTJ.jpg", 
					"detail" : "-타인의 잔소리가 싫은 당신에게-", "img_product" : "resources/img/product/e_ap1_1.jpg", "link" : "product_detail?product_idx=31"}
		}
 	