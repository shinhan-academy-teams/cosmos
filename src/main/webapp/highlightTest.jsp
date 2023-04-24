<!-- 
메인 홈 화면
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>COSMOS</title>
<link rel="icon" type="image/x-icon" href="${path}/images/favicon.ico">
<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/styles/github-dark-dimmed.min.css">
<style>
	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

	html, body {
		height: 100%;
	}

	#wrap {
		background-color: #FFFFFF;
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 36px 24px 84px;
		height: auto;
		min-height: calc(100vh - 64px);
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.test {
		background-color: #dcf6ff;
		width: 100%;
		padding: 48px;
	}
	
	.test > pre > code {
		padding: 24px;
		border-radius: 12px;
	}
	
	
</style>
</head>

<body>
	<%@ include file="common/header.jsp" %>
	<div id="wrap">
		<div class="test java">
			<h4>Java</h4>
			<pre>
				<code>
	import java.io.BufferedReader;
	import java.io.InputStreamReader;
	import java.io.StringReader;
	import java.util.LinkedList;
	import java.util.Queue;
	
	public class Main {
		static BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
	//	static StringBuilder output = new StringBuilder();
		static String src = """
				6
				"""; // output: 4
	
		public static void main(String[] args) throws Exception {
			input = new BufferedReader(new StringReader(src));
	
			int N = Integer.parseInt(input.readLine());
	
			Queue<Integer> queue = new LinkedList<>();
			for (int i = 1; i <= N; i++) {
				queue.offer(i);
			}
	
			int cnt = 1;
			while (queue.size() > 1) {
				if (cnt % 2 == 1) {
					queue.poll();
				} else {
					queue.add(queue.poll());
				}
	
				cnt++;
			}
	
			System.out.println(queue.poll());
		}
	
	}
				</code>
			</pre>
		</div>
		<div class="test javascript">
			<h4>JavaScript</h4>
			<pre>
				<code>
	let regexEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let emailIsOk = false;
	function func_email_check(e) {
		if(e.keyCode === 13){ // 이메일 입력하고 엔터로 아이디 찾기
			$('#find-id-btn').click();
		}

		let email = $(this).val(); // 입력된 email
		if(email.length == 0) { // 길이 0이면 두 알림 숨김.
			$('#email-value-valid').css('display', 'none');
			$('#email-value-invalid').css('display', 'none');
			emailIsOk = false;
		} else {
			if(!regexEmail.test(email)) { // 이메일 조건 불충족시 valid 숨기고 invalid 표시.
				$('#email-value-valid').css('display', 'none');
				$('#email-value-invalid').html('<img alt="warning" src="${path}/images/icon-warning.png">올바른 이메일 형식으로 입력해주세요.');
				$('#email-value-invalid').css('display', 'inline-block');
				emailIsOk = false;
			} else { // 이메일 조건 충족시 invalid 숨기고 valid 표시.
				$('#email-value-invalid').css('display', 'none');
				$('#email-value-valid').css('display', 'inline-block');
				emailIsOk = true;
			}
		}
	}
				</code>
			</pre>
		</div>
		<div class="test python">
			<h4>Python</h4>
			<pre>
				<code>
	n = int(input())
	stack = []
	result = []
	
	cur = 1
	flag = True
	for i in range(n):
	    target = int(input())
	    while cur<=target:
	        stack.append(cur)
	        result.append("+")
	        cur += 1
	    if stack[-1] == target:
	        stack.pop()
	        result.append("-")
	    else:
	        flag = False
	
	if (flag == True):
	    for i in result:
	        print(i)
	else:
	    print("NO")
				</code>
			</pre>
		</div>
	</div>
	<%@ include file="common/footer.jsp" %>
	
	<script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/highlight.min.js"></script>
	<script>hljs.highlightAll();</script>
	
</body>
</html>