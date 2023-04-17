<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="footer-wrap">
	<footer>
		<div id="footer-content">
			<div id="copyright">
				<span>Copyright © 2023 <a target="_blank" href="https://github.com/shinhan-academy-teams/cosmos">CosMaker</a> Inc. All rights reserved.</span>
			</div>
			<div>
				<div aria-hidden="true" class="separator"></div>
				<span class="footer-link"><a target="_blank" href="#">Privacy Policy</a></span>
				<div aria-hidden="true" class="separator"></div>
				<span class="footer-link"><a target="_blank" href="#">Terms of Use</a></span>
				<div aria-hidden="true" class="separator"></div>
			</div>
			<div id="logo-footer-div">
				<img alt="logo-cosmos" src="${path}/images/logo-footer-cosmos.png" onclick="javascript:location.href = '#top'"/>
				<img alt="logo-shinhanDS" src="${path}/images/logo-footer-shinhanDS.png" onclick="javascript:window.open('https://www.shinhands.co.kr')"/>
				<img alt="logo-kcci" src="${path}/images/logo_footer_kcci.png" onclick="javascript:window.open('https://www.kccistc.net')"/>
			</div>
		</div>
	</footer>
</div>

<style>
	#footer-wrap {
		background-color: #f5f5f7;
		height: 60px;
		position : relative;
		transform : translateY(-100%);
	}
	
	footer {
		position: relative;
		margin: 0 auto;
		display: flex;
		align-items: center;
		padding: 0 16px;
		height: 60px;
		width: 100%;
		max-width: 1200px;
		vertical-align: middle;
		font-weight: 300;
	}
	
	#footer-content {
		color: #6e6e73;
		font-size: 12px;
		line-height: 2;
		width: 100%;
	}
	
	#footer-content div {
		display: inline-block;
	}
	
	#copyright {
		margin-right: 36px;
	}
	
	a {
		color: #6e6e73;
		text-decoration: none;
	}
	
	span.footer-link {
		padding: 0px 24px;
	}
	
	div.separator {
		width: 1px;
		height: 16px;
		vertical-align: middle;
		background-color: #d2d2d7;
	}
	
	#logo-footer-div {
		float: right;
		text-align: right;
	}
	
	#logo-footer-div > img {
		cursor: pointer;
		max-height: 24px;
		margin-left: 24px;
	}
	
	img[alt="logo-cosmos"], img[alt="logo-shinhanDS"] {
		opacity: 0.5;
	}
	
</style>