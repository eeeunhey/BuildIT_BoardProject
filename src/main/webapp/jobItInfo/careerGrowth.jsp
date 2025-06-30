<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>취업 성장</title>
    <link rel="stylesheet" href="/Board-WEB/resources/css/careerGrowth.css">
</head>
<body>
    <div class="container">

        <!-- 상단 타이틀 영역 -->
        <section class="header-box">
            <h1>IT 취업 성장 현황</h1>
            <p>취업 준비 상황과 IT 분야 지원 내역을 한눈에 확인해보세요.</p>
        </section>

        <!-- IT 정보 영역 -->
        <section class="info-box">
            <h2>📚 나의 IT 성장 기록</h2>
            <ul class="info-list">
                <li>프로그래밍 언어: Java, JavaScript, Python</li>
                <li>웹 개발 경험: JSP, Spring, MyBatis 사용</li>
                <li>관심 분야: 백엔드, AI 프로젝트, 자동화 도구 개발</li>
                <li>학습 중: Git, SQL, React Native</li>
            </ul>
        </section>

        <!-- 지원 내역 영역 -->
        <section class="application-box">
            <h2>📁 지원한 IT 공고 내역</h2>
            <table class="app-table">
                <thead>
                    <tr>
                        <th>공고명</th>
                        <th>회사명</th>
                        <th>지원일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Spring 백엔드 개발자</td>
                        <td>코드팩토리</td>
                        <td>2025-06-20</td>
                        <td>검토 중</td>
                    </tr>
                    <tr>
                        <td>AI 자동화 툴 개발</td>
                        <td>TechVision</td>
                        <td>2025-06-18</td>
                        <td>1차 면접 예정</td>
                    </tr>
                </tbody>
            </table>
        </section>

    </div>
</body>
</html>
