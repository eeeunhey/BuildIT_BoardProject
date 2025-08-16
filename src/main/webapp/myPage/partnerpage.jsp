<%-- 작성일: 2025-08-16 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파트너 프로필 편집</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${ctx}/resources/css/partnerpage.css">
<%-- 외부 CSS --%>
</head>
<body>
	<div class="wrap">
		<div class="card">

			<!-- 상단 영역 -->
			<div class="top">
				<div class="avatar" aria-label="프로필 이미지">
					<span>👋</span>
					<div class="edit-badge">편집</div>
				</div>
				<div class="hello">
					<c:choose>
						<c:when test="${not empty profile.nickname}">${profile.nickname}님 환영해요.</c:when>
						<c:otherwise>안녕하세요! 환영해요.</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- 폼 시작 -->
			<form action="${ctx}/profile/save.do" method="post" id="profileForm"
				novalidate>
				<!-- 닉네임 -->
				<div class="row">
					<label for="nickname" class="req">닉네임</label> <input type="text"
						id="nickname" name="nickname" value="${profile.nickname}"
						placeholder="예) Heyseee" required>
				</div>

				<!-- 직무 -->
				<div class="row">
					<label for="role" class="req">직무</label> <select id="role"
						name="role" required>
						<option value="" disabled ${emptyprofile.role ? 'selected' : ''}>선택하세요</option>
						<option ${profile.role=='백엔드' ? 'selected' : ''}>백엔드</option>
						<option ${profile.role=='프론트엔드' ? 'selected' : ''}>프론트엔드</option>
						<option ${profile.role=='풀스택' ? 'selected' : ''}>풀스택</option>
						<option ${profile.role=='모바일' ? 'selected' : ''}>모바일</option>
						<option ${profile.role=='데이터' ? 'selected' : ''}>데이터</option>
						<option ${profile.role=='디자인' ? 'selected' : ''}>디자인</option>
					</select>
				</div>

				<!-- 소속 + 공개 설정 -->
				<div class="row">
					<div class="inline" style="justify-content: space-between">
						<label for="org">소속</label>
						<div class="radio" role="radiogroup" aria-label="소속 공개 설정">
							<label><input type="radio" name="orgPrivacy"
								value="PUBLIC" ${profile.orgPrivacy!='PRIVATE' ? 'checked' : ''}>
								공개</label> <label><input type="radio" name="orgPrivacy"
								value="PRIVATE"
								${profile.orgPrivacy=='PRIVATE' ? 'checked' : ''}> 비공개</label>
						</div>
					</div>
					<input type="text" id="org" name="org" value="${profile.org}"
						placeholder="예) 올라 회사, 올라 대학교...">
					<div class="tiny">공개로 설정하면 프로필에 소속이 표시됩니다.</div>
				</div>

				<!-- 교육 이력 (여러 개 추가/삭제 가능) -->
				<div class="row">
					<label>교육 이력</label>

					<div id="eduList" class="edu-list">
						<c:choose>
							<%-- profile.educationList : List<EduItem>(title, provider, start, end, type, note) --%>
							<c:when test="${not empty profile.educationList}">
								<c:forEach var="e" items="${profile.educationList}">
									<div class="item">
										<input type="text" name="educationTitle[]"
											placeholder="과정명 (예: 백엔드 부트캠프)" value="${e.title}"> <input
											type="text" name="educationProvider[]"
											placeholder="기관 (예: KDT, 패스트캠퍼스)" value="${e.provider}">
										<input type="month" name="educationStart[]" title="시작"
											value="${e.start}"> <input type="month"
											name="educationEnd[]" title="종료" value="${e.end}"> <select
											name="educationType[]" aria-label="유형">
											<option ${e.type=='부트캠프' ? 'selected' : ''}>부트캠프</option>
											<option ${e.type=='자격증 과정' ? 'selected' : ''}>자격증 과정</option>
											<option ${e.type=='온라인 강의' ? 'selected' : ''}>온라인 강의</option>
											<option ${e.type=='세미나/워크샵' ? 'selected' : ''}>세미나/워크샵</option>
											<option ${e.type=='기타' ? 'selected' : ''}>기타</option>
										</select> <input type="text" name="educationNote[]"
											placeholder="비고 (예: 수료, 진행중 등)" value="${e.note}">
										<button class="btn btn-ghost remove-edu" type="button">삭제</button>
									</div>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<%-- 초기 1행 기본 제공 --%>
								<div class="item">
									<input type="text" name="educationTitle[]"
										placeholder="과정명 (예: 백엔드 부트캠프)"> <input type="text"
										name="educationProvider[]" placeholder="기관 (예: KDT, 패스트캠퍼스)">
									<input type="month" name="educationStart[]" title="시작">
									<input type="month" name="educationEnd[]" title="종료"> <select
										name="educationType[]" aria-label="유형">
										<option selected>부트캠프</option>
										<option>자격증 과정</option>
										<option>온라인 강의</option>
										<option>세미나/워크샵</option>
										<option>기타</option>
									</select> <input type="text" name="educationNote[]"
										placeholder="비고 (예: 수료, 진행중 등)">
									<button class="btn btn-ghost remove-edu" type="button">삭제</button>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<button class="btn btn-ghost" type="button" id="addEdu">+
						교육 이력 추가</button>
					<div class="tiny">※ 여러 이력을 자유롭게 추가하세요. 비고에는 수료 여부/인증 링크 등을 적을
						수 있어요.</div>
				</div>

				<!-- 자기소개 -->
				<div class="row">
					<label for="bio">자기소개</label>
					<textarea id="bio" name="bio"
						placeholder="안녕하세요. 1년차 백엔드 개발자 Heyseee입니다.">${profile.bio}</textarea>
				</div>

				<!-- 관련분야(태그) -->
				<div class="row">
					<label for="chipInput">관련분야</label>
					<div class="chips" id="chips" aria-live="polite">
						<c:forEach var="t" items="${profile.tags}">
							<span class="chip" data-tag="${t}"> <span>${t}</span>
							<button type="button" aria-label="${t} 제거">×</button>
							</span>
						</c:forEach>
						<input id="chipInput" class="chip-input" type="text"
							placeholder="엔터로 태그 추가">
					</div>
					<input type="hidden" id="tagsHidden" name="tags"
						value="${fn:join(profile.tags, ',')}">
					<div class="tiny">예) JavaScript, React, Git, Python, Java, UI
						디자인 ...</div>
				</div>

				<!-- 링크 (여러 개) -->
				<div class="row links">
					<label>링크</label>
					<div id="linkList">
						<c:forEach var="link" items="${profile.links}">
							<div class="item">
								<input type="url" name="links" value="${link}"
									placeholder="https://example.com">
								<button class="btn btn-ghost remove-link" type="button">삭제</button>
							</div>
						</c:forEach>
					</div>
					<button class="btn btn-ghost" type="button" id="addLink">+
						추가</button>
				</div>

				<!-- 하단 버튼 -->
				<div class="footer">
					<a class="danger" href="${ctx}/member/withdraw.do">회원 탈퇴</a>
					<button class="btn btn-primary" type="submit">프로필 저장</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 스크립트 -->
	<script>
    // 태그 칩
    (function(){
      const chips = document.getElementById('chips');
      const input = document.getElementById('chipInput');
      const hidden = document.getElementById('tagsHidden');
      const getTags = () => Array.from(chips.querySelectorAll('.chip')).map(c => c.dataset.tag);
      const syncHidden = () => hidden.value = getTags().join(',');

      const addTag = (txt)=>{
        const tag = (txt||'').trim();
        if(!tag) return;
        if(getTags().some(t => t.toLowerCase() === tag.toLowerCase())) { input.value=''; return; }
        const el = document.createElement('span');
        el.className = 'chip'; el.dataset.tag = tag;
        el.innerHTML = `<span>${tag}</span><button type="button" aria-label="${tag} 제거">×</button>`;
        chips.insertBefore(el, input);
        input.value = '';
        syncHidden();
      };

      input.addEventListener('keydown', (e)=>{
        if(e.key === 'Enter'){ e.preventDefault(); addTag(input.value); }
        if(e.key === 'Backspace' && !input.value){
          const last = chips.querySelector('.chip:last-of-type');
          if(last){ last.remove(); syncHidden(); }
        }
      });

      chips.addEventListener('click', (e)=>{
        if(e.target.tagName === 'BUTTON'){
          e.target.closest('.chip').remove(); syncHidden();
        }
      });

      syncHidden();
    })();

    // 링크 추가/삭제
    (function(){
      const list = document.getElementById('linkList');
      document.getElementById('addLink').addEventListener('click', ()=>{
        const item = document.createElement('div');
        item.className = 'item';
        item.innerHTML = `
          <input type="url" name="links" placeholder="https://example.com">
          <button class="btn btn-ghost remove-link" type="button">삭제</button>`;
        list.appendChild(item);
      });
      list.addEventListener('click', (e)=>{
        if(e.target.classList.contains('remove-link')){
          e.target.closest('.item').remove();
        }
      });
    })();

    // 교육 이력 추가/삭제
    (function(){
      const list = document.getElementById('eduList');
      const addBtn = document.getElementById('addEdu');
      const rowHTML = `
        <div class="item">
          <input type="text"   name="educationTitle[]"    placeholder="과정명 (예: 백엔드 부트캠프)">
          <input type="text"   name="educationProvider[]" placeholder="기관 (예: KDT, 패스트캠퍼스)">
          <input type="month"  name="educationStart[]"    title="시작">
          <input type="month"  name="educationEnd[]"      title="종료">
          <select name="educationType[]" aria-label="유형">
            <option selected>부트캠프</option>
            <option>자격증 과정</option>
            <option>온라인 강의</option>
            <option>세미나/워크샵</option>
            <option>기타</option>
          </select>
          <input type="text"   name="educationNote[]"     placeholder="비고 (예: 수료, 진행중 등)">
          <button class="btn btn-ghost remove-edu" type="button">삭제</button>
        </div>`;

      addBtn.addEventListener('click', ()=> {
        list.insertAdjacentHTML('beforeend', rowHTML);
      });

      list.addEventListener('click', (e)=>{
        if(e.target.classList.contains('remove-edu')){
          e.target.closest('.item').remove();
        }
      });
    })();

    // 필수값 검증
    document.getElementById('profileForm').addEventListener('submit', function(e){
      const nn = document.getElementById('nickname').value.trim();
      const role = document.getElementById('role').value;
      if(!nn || !role){
        e.preventDefault();
        alert('필수 항목(*)을 입력해 주세요.');
      }
    });
  </script>
</body>
</html>
