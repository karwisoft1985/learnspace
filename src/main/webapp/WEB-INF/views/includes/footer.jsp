<!-- Footer -->
<link href='http://fonts.googleapis.com/css?family=Arizonia' rel='stylesheet' type='text/css'>
  
			<footer id="footer" class="footer-area fixed--footer">

				<!-- Footer Widgets -->
				<div class="footer__widgets ptb--100 bg--dark--light">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="widgets footer--widgets d-flex justify-content-between flex-md-wrap flex-wrap flex-lg-nowrap">

									<!-- Single Widgets -->
									<div class="single-widget widget--details">
										<div class="logo">
											<a href="index.html">
												<img src="<%=request.getContextPath()%>/resources/images/logo/logo-dark.png" alt="footer logo">
											</a>
										</div>
										<p style="font:400 30px/1.3 'Arizonia', Helvetica, sans-serif;"><I>&quot;<spring:message code="label.quran" />&quot;</I> Chap. 54:17</p>
									<!-- 	<div class="social-icons social-icons--rounded">
											<ul>
												<li class="facebook"><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
												<li class="twitter"><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
												<li class="instagram"><a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
												<li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
											</ul>
										</div>-->
									</div><!-- //Single Widgets -->

									<!-- Single Widgets -->
									<div class="single-widget widget--support">
										<h4 class="widget-title">Support</h4>
										<ul>
											<li><a href="#"  data-toggle="modal" data-target="#exampleModalabt"><spring:message code="label.about_us" /></a></li>
											<li><a href="#" data-toggle="modal" data-target="#exampleModal2"><spring:message code="label.help" /></a></li>
											<li><a href="#" data-toggle="modal" data-target="#exampleModalt"><spring:message code="label.termsuse" /></a></li>
											<li><a href="#" data-toggle="modal" data-target="#exampleModal3"><spring:message code="label.privacyp" /></a></li>
										</ul>
									</div><!-- //Single Widgets -->

									<!-- Single Widgets -->
									<div class="single-widget widget--contact">
										<h4 class="widget-title">Contact</h4>
										<ul>
											<li>
												<a href="mailto://info@quranspace.net">info@quranspace.net</a>
												<a href="#">www.quranspace.net</a>
											</li>
										</ul>
									</div><!-- //Single Widgets -->

									<!-- <div class="widget-row">
										<div class="single-widget widget--newsletter">
											<h4 class="widget-title">Newsletter</h4>
											<form action="#">
												<input type="text" placeholder="Email here">
												<button type="submit"><i class="fa fa-paper-plane-o"></i></button>
											</form>
										</div>
									</div>-->
								</div>
							</div>
						</div>
					</div>
				</div><!-- //Footer Widgets -->

				<!-- Footer Copyright -->
				<div class="footer__copyright bg--dark ptb--20">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<p><spring:message code="label.copyright" /> &copy; quranspace.net, <spring:message code="label.rights" />, 2018</p>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="footer__payment-icons text-right">
								<p><spring:message code="label.powered" /> <a href="http://karwisoft.com" target="_blank">KARWISOFT</a></p>
								</div>
							</div>
						</div>
					</div>
				</div><!-- //Footer Copyright -->

			</footer><!-- //Footer -->

			<!-- Login Form -->
			<div class="accountbox-wrapper">
				<div class="accountbox text-left">
					<ul class="nav accountbox__filters" id="myTab" role="tablist">
						<li>
							<a class="active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><spring:message code="label.login" /></a>
						</li>
						<li>
							<a id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><spring:message code="label.register" /></a>
						</li>
					</ul>
					<div class="accountbox__inner tab-content" id="myTabContent">
						<div class="accountbox__login tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							<form action="#">
								<div class="single-input">
									<input type="text" placeholder="User name or email" class="cr-round cr-round--lg">
								</div>
								<div class="single-input">
									<input type="password" placeholder="Password" class="cr-round cr-round--lg">
								</div>
								<div class="single-input">
									<button type="submit" class="cr-btn cr-btn--sm cr-btn--theme cr-round cr-round--lg"><span>Go</span></button>
								</div>
								<div class="accountbox-login__others">
									<h6>Or login with</h6>
									<div class="social-icons social-icons--rounded">
										<ul>
											<li class="facebook"><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
											<li class="twitter"><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
											<li class="pinterest"><a href="#"><i class="fa fa-google-plus"></i></a></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
						<div class="accountbox__register tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
							<form action="#">
								<div class="single-input">
									<input type="text" placeholder="User name" class="cr-round cr-round--lg">
								</div>
								<div class="single-input">
									<input type="email" placeholder="Email address" class="cr-round cr-round--lg">
								</div>
								<div class="single-input">
									<input type="password" placeholder="Password" class="cr-round cr-round--lg">
								</div>
								<div class="single-input">
									<input type="password" placeholder="Confirm password" class="cr-round cr-round--lg">
								</div>
								<div class="single-input">
									<button type="submit" class="cr-btn cr-btn--sm cr-btn--theme cr-round cr-round--lg"><span>Sign Up</span></button>
								</div>
							</form>
						</div>
						<span class="accountbox-close-button"><i class="icofont icofont-close"></i></span>
					</div>
				</div>
			</div><!-- //Login Form -->


			<!-- Cartbox -->
			<div class="cartbox-wrap">
				<div class="cartbox text-right">
					<button class="cartbox-close"><i class="icofont icofont-close"></i></button>
					<div class="cartbox__inner text-left">
						<div class="cartbox__items">
							<!-- Cartbox Single Item -->
							<div class="cartbox__item">
								<div class="cartbox__item__thumb">
									<a href="product-details.html">
										<img src="<%=request.getContextPath()%>/resources/images/product/small-thumbnail/1.png" alt="small thumbnail">
									</a>
								</div>
								<div class="cartbox__item__content">
									<h5><a href="product-details.html" class="product-name">Prayer Cap</a></h5>
									<p>Qty: <span>01</span></p>
									<span class="price">$15</span>
								</div>
								<button class="cartbox__item__remove">
									<i class="icofont icofont-ui-delete"></i>
								</button>
							</div><!-- //Cartbox Single Item -->
							<!-- Cartbox Single Item -->
							<div class="cartbox__item">
								<div class="cartbox__item__thumb">
									<a href="product-details.html">
										<img src="<%=request.getContextPath()%>/resources/images/product/small-thumbnail/2.png" alt="small thumbnail">
									</a>
								</div>
								<div class="cartbox__item__content">
									<h5><a href="product-details.html" class="product-name">Attar Perfume</a></h5>
									<p>Qty: <span>01</span></p>
									<span class="price">$25</span>
								</div>
								<button class="cartbox__item__remove">
									<i class="icofont icofont-ui-delete"></i>
								</button>
							</div><!-- //Cartbox Single Item -->
							<!-- Cartbox Single Item -->
							<div class="cartbox__item">
								<div class="cartbox__item__thumb">
									<a href="product-details.html">
										<img src="<%=request.getContextPath()%>/resources/images/product/small-thumbnail/3.png" alt="small thumbnail">
									</a>
								</div>
								<div class="cartbox__item__content">
									<h5><a href="product-details.html" class="product-name">Special T-shirt</a></h5>
									<p>Qty: <span>01</span></p>
									<span class="price">$30</span>
								</div>
								<button class="cartbox__item__remove">
									<i class="icofont icofont-ui-delete"></i>
								</button>
							</div><!-- //Cartbox Single Item -->
						</div>
						<div class="cartbox__total">
							<ul>
								<li><span class="cartbox__total__title">Subtotal</span><span class="price">$70</span></li>
								<li class="shipping-charge"><span class="cartbox__total__title">Shipping Charge</span><span class="price">$05</span></li>
								<li class="grandtotal">Total<span class="price">$75</span></li>
							</ul>
						</div>
						<div class="cartbox__buttons">
							<a href="cart.html" class="cr-btn cr-btn--transparent"><span>View cart</span></a>
							<a href="checkout.html" class="cr-btn cr-btn--theme"><span>Checkout</span></a>
						</div>
					</div>
				</div>
			</div><!-- //Cartbox -->

		</div><!-- //Main wrapper -->
		
		<!-- Modal -->
<div class="modal fade" id="exampleModalt" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="padding:2%">
      
      <div class="modal-body" style="text-align:center;">
                
<div class="row">
<h2>TERMS OF USE</h2>
<h3>AGREEMENT TO TERMS</h3>
 
<p  style="text-align:justify">These Terms of Use constitute a legally binding agreement made between you, whether personally or on behalf of an entity (&quot;you&quot;) and <a href="http://quranspace.net">QuranSpace.net</a> (&quot;we&quot;, &quot;us&quot; or &quot;our&quot;), concerning your access to and use of the quranspace.net website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto (collectively, the &quot;Site&quot;). You agree that by accessing the Site, you have read, understood, and agreed to be bound by all of these Terms of Use. IF YOU DO NOT AGREE WITH ALL OF THESE TERMS OF USE, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SITE AND YOU MUST DISCONTINUE USE IMMEDIATELY.
 
Supplemental terms and conditions or documents that may be posted on the Site from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Terms of Use at any time and for any reason. We will alert you about any changes by updating the &quot;Last updated&quot; date of these Terms of Use, and you waive any right to receive specific notice of each such change. It is your responsibility to periodically review these Terms of Use to stay informed of updates. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Terms of Use by your continued use of the Site after the date such revised Terms of Use are posted.  
 
The information provided on the Site is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Site from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable. 
 
The Site is intended for users who are at least 18 years old. Persons under the age of 18 are not permitted to use or register for the Site.</p>
<h3>INTELLECTUAL PROPERTY RIGHTS</h3>
 
<p  style="text-align:justify">Unless otherwise indicated, the Site is our proprietary property and all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics on the Site (collectively, the &quot;Content&quot;) and the trademarks, service marks, and logos contained therein (the &quot;Marks&quot;) are owned or controlled by us or licensed to us, and are protected by copyright and trademark laws and various other intellectual property rights and unfair competition laws of Canada, foreign jurisdictions, and international conventions. The Content and the Marks are provided on the Site &quot;AS IS&quot; for your information and personal use only. Except as expressly provided in these Terms of Use, no part of the Site and no Content or Marks may be copied, reproduced, aggregated, republished, uploaded, posted, publicly displayed, encoded, translated, transmitted, distributed, sold, licensed, or otherwise exploited for any commercial purpose whatsoever, without our express prior written permission.
 
Provided that you are eligible to use the Site, you are granted a limited license to access and use the Site and to download or print a copy of any portion of the Content to which you have properly gained access solely for your personal, non-commercial use. We reserve all rights not expressly granted to you in and to the Site, the Content and the Marks.</p>
 
<h3>USER REPRESENTATIONS</h3>
 
<p  style="text-align:justify">By using the Site, you represent and warrant that: (1) all registration information you submit will be true, accurate, current, and complete; (2) you will maintain the accuracy of such information and promptly update such registration information as necessary; (3) you have the legal capacity and you agree to comply with these Terms of Use;  (4) you are not a minor in the jurisdiction in which you reside; (5) you will not access the Site through automated or non-human means, whether through a bot, script, or otherwise; (6) you will not use the Site for any illegal or unauthorized purpose; and (7) your use of the Site will not violate any applicable law or regulation.<br>
 
If you provide any information that is untrue, inaccurate, not current, or incomplete, we have the right to suspend or terminate your account and refuse any and all current or future use of the Site (or any portion thereof). </p>
 
<h3>USER REGISTRATION</h3>
 
<p  style="text-align:justify">You may be required to register with the Site. You agree to keep your password confidential and will be responsible for all use of your account and password.</p>
 
<h3>PROHIBITED ACTIVITIES</h3>
 
<p style="text-align:justify">You may not access or use the Site for any purpose other than that for which we make the Site available. The Site may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by us.
As a user of the Site, you agree not to:<br>
1. Systematically retrieve data or other content from the Site to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from us. <br>
2. Make any unauthorized use of the Site, including collecting usernames and/or email addresses of users by electronic or other means for the purpose of sending unsolicited email, or creating user accounts by automated means or under false pretenses. <br>
3. Use a buying agent or purchasing agent to make purchases on the Site.<br> 
4. Use the Site to advertise or offer to sell goods and services.<br> 
5. Circumvent, disable, or otherwise interfere with security-related features of the Site, including features that prevent or restrict the use or copying of any Content or enforce limitations on the use of the Site and/or the Content contained therein. <br>
6. Engage in unauthorized framing of or linking to the Site.<br> 
7. Trick, defraud, or mislead us and other users, especially in any attempt to learn sensitive account information such as user passwords.<br> 
8. Make improper use of our support services or submit false reports of abuse or misconduct. <br>
9. Engage in any automated use of the system, such as using scripts to send comments or messages, or using any data mining, robots, or similar data gathering and extraction tools.<br> 
10. Interfere with, disrupt, or create an undue burden on the Site or the networks or services connected to the Site. <br>
11. Attempt to impersonate another user or person or use the username of another user. <br>
12. Use any information obtained from the Site in order to harass, abuse, or harm another person. <br>
13. Sell or otherwise transfer your profile.<br> 
14. Attempt to bypass any measures of the Site designed to prevent or restrict access to the Site, or any portion of the Site. <br>
15. Harass, annoy, intimidate, or threaten any of our employees or agents engaged in providing any portion of the Site to you.<br> 
16. Delete the copyright or other proprietary rights notice from any Content.<br> 
17. Copy or adapt the Site’s software, including but not limited to Flash, PHP, HTML, JavaScript, or other code. <br>
18. Upload or transmit (or attempt to upload or to transmit) viruses, Trojan horses, or other material, including excessive use of capital letters and spamming (continuous posting of repetitive text), that interferes with any party’s uninterrupted use and enjoyment of the Site or modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, or maintenance of the Site.<br> 
19. Use the Site in a manner inconsistent with any applicable laws or regulations. <br>

</p>
<h3>GUIDELINES FOR REVIEWS</h3>
 
<p  style="text-align:justify">We may provide you areas on the Site to leave reviews or ratings. When posting a review, you must comply with the following criteria: (1) you should have firsthand experience with the person/entity being reviewed; (2) your reviews should not contain offensive profanity, or abusive, racist, offensive, or hate language; (3) your reviews should not contain discriminatory references based on religion, race, gender, national origin, age, marital status, sexual orientation, or disability; (4) your reviews should not contain references to illegal activity; (5) you should not be affiliated with competitors if posting negative reviews; (6) you should not make any conclusions as to the legality of conduct; (7) you may not post any false or misleading statements; and (8) you may not organize a campaign encouraging others to post reviews, whether positive or negative. 
<br> 
We may accept, reject, or remove reviews in our sole discretion. We have absolutely no obligation to screen reviews or to delete reviews, even if anyone considers reviews objectionable or inaccurate. Reviews are not endorsed by us, and do not necessarily represent our opinions or the views of any of our affiliates or partners. We do not assume liability for any review or for any claims, liabilities, or losses resulting from any review. By posting a review, you hereby grant to us a perpetual, non-exclusive, worldwide, royalty-free, fully-paid, assignable, and sublicensable right and license to reproduce, modify, translate, transmit by any means, display, perform, and/or distribute all content relating to reviews.
19. Use the Site in a manner inconsistent with any applicable laws or regulations.
</p>   
<h3>SUBMISSIONS</h3>
 
<p  style="text-align:justify">You acknowledge and agree that any questions, comments, suggestions, ideas, feedback, or other information regarding the Site ("Submissions") provided by you to us are non-confidential and shall become our sole property. We shall own exclusive rights, including all intellectual property rights, and shall be entitled to the unrestricted use and dissemination of these Submissions for any lawful purpose, commercial or otherwise, without acknowledgment or compensation to you. You hereby waive all moral rights to any such Submissions, and you hereby warrant that any such Submissions are original with you or that you have the right to submit such Submissions. You agree there shall be no recourse against us for any alleged or actual infringement or misappropriation of any proprietary right in your Submissions. 
 </p>
<h3>THIRD-PARTY WEBSITES AND CONTENT</h3>
 <p style="text-align:justify">
The Site may contain (or you may be sent via the Site) links to other websites ("Third-Party Websites") as well as articles, photographs, text, graphics, pictures, designs, music, sound, video, information, applications, software, and other content or items belonging to or originating from third parties ("Third-Party Content"). Such Third-Party Websites and Third-Party Content are not investigated, monitored, or checked for accuracy, appropriateness, or completeness by us, and we are not responsible for any Third-Party Websites accessed through the Site or any Third-Party Content posted on, available through, or installed from the Site, including the content, accuracy, offensiveness, opinions, reliability, privacy practices, or other policies of or contained in the Third-Party Websites or the Third-Party Content. Inclusion of, linking to, or permitting the use or installation of any Third-Party Websites or any Third-Party Content does not imply approval or endorsement thereof by us. If you decide to leave the Site and access the Third-Party Websites or to use or install any Third-Party Content, you do so at your own risk, and you should be aware these Terms of Use no longer govern. You should review the applicable terms and policies, including privacy and data gathering practices, of any website to which you navigate from the Site or relating to any applications you use or install from the Site. Any purchases you make through Third-Party Websites will be through other websites and from other companies, and we take no responsibility whatsoever in relation to such purchases which are exclusively between you and the applicable third party. You agree and acknowledge that we do not endorse the products or services offered on Third-Party Websites and you shall hold us harmless from any harm caused by your purchase of such products or services. Additionally, you shall hold us harmless from any losses sustained by you or harm caused to you relating to or resulting in any way from any Third-Party Content or any contact with Third-Party Websites. 
 </p>
 <h3>SITE MANAGEMENT</h3>
 
<p style="text-align:justify">We reserve the right, but not the obligation, to: (1) monitor the Site for violations of these Terms of Use; (2) take appropriate legal action against anyone who, in our sole discretion, violates the law or these Terms of Use, including without limitation, reporting such user to law enforcement authorities; (3) in our sole discretion and without limitation, refuse, restrict access to, limit the availability of, or disable (to the extent technologically feasible) any of your Contributions or any portion thereof; (4) in our sole discretion and without limitation, notice, or liability, to remove from the Site or otherwise disable all files and content that are excessive in size or are in any way burdensome to our systems; and (5) otherwise manage the Site in a manner designed to protect our rights and property and to facilitate the proper functioning of the Site.
 </p>
<h3>TERM AND TERMINATION</h3>
<p style="text-align:justify"> 
These Terms of Use shall remain in full force and effect while you use the Site. WITHOUT LIMITING ANY OTHER PROVISION OF THESE TERMS OF USE, WE RESERVE THE RIGHT TO, IN OUR SOLE DISCRETION AND WITHOUT NOTICE OR LIABILITY, DENY ACCESS TO AND USE OF THE SITE (INCLUDING BLOCKING CERTAIN IP ADDRESSES), TO ANY PERSON FOR ANY REASON OR FOR NO REASON, INCLUDING WITHOUT LIMITATION FOR BREACH OF ANY REPRESENTATION, WARRANTY, OR COVENANT CONTAINED IN THESE TERMS OF USE OR OF ANY APPLICABLE LAW OR REGULATION. WE MAY TERMINATE YOUR USE OR PARTICIPATION IN THE SITE OR DELETE YOUR ACCOUNT AND ANY CONTENT OR INFORMATION THAT YOU POSTED AT ANY TIME, WITHOUT WARNING, IN OUR SOLE DISCRETION.
</p> 
<p style="text-align:justify">
If we terminate or suspend your account for any reason, you are prohibited from registering and creating a new account under your name, a fake or borrowed name, or the name of any third party, even if you may be acting on behalf of the third party. In addition to terminating or suspending your account, we reserve the right to take appropriate legal action, including without limitation pursuing civil, criminal, and injunctive redress.
</p> 
<h3>MODIFICATIONS AND INTERRUPTIONS </h3>
 
<p style="text-align:justify">We reserve the right to change, modify, or remove the contents of the Site at any time or for any reason at our sole discretion without notice. However, we have no obligation to update any information on our Site. We also reserve the right to modify or discontinue all or part of the Site without notice at any time. We will not be liable to you or any third party for any modification, price change, suspension, or discontinuance of the Site.  
 <br>
We cannot guarantee the Site will be available at all times. We may experience hardware, software, or other problems or need to perform maintenance related to the Site, resulting in interruptions, delays, or errors. We reserve the right to change, revise, update, suspend, discontinue, or otherwise modify the Site at any time or for any reason without notice to you. You agree that we have no liability whatsoever for any loss, damage, or inconvenience caused by your inability to access or use the Site during any downtime or discontinuance of the Site. Nothing in these Terms of Use will be construed to obligate us to maintain and support the Site or to supply any corrections, updates, or releases in connection therewith.
</p> 
<h3>GOVERNING LAW </h3>
 <p style="text-align:justify">
These Terms of Use and your use of the Site are governed by and construed in accordance with the laws of the Province of Ontario applicable to agreements made and to be entirely performed within theProvince of Ontario, without regard to its conflict of law principles.  
 </p>
<h3>DISPUTE RESOLUTION</h3>
<br>
<h4>Informal Negotiations</h4> 
<p style="text-align:justify">To expedite resolution and control the cost of any dispute, controversy, or claim related to these Terms of Use (each a "Dispute" and collectively, the &quot;Disputes&quot;) brought by either you or us (individually, a &quot;Party&quot; and collectively, the &quot;Parties&quot;), the Parties agree to first attempt to negotiate any Dispute (except those Disputes expressly provided below) informally for at least thirty (30) days before initiating arbitration. Such informal negotiations commence upon written notice from one Party to the other Party.
</p> 
<h4>Binding Arbitration</h4>
 <p style="text-align:justify">
If the Parties are unable to resolve a Dispute through informal negotiations, the Dispute (except those Disputes expressly excluded below) will be finally and exclusively resolved by binding arbitration. YOU UNDERSTAND THAT WITHOUT THIS PROVISION, YOU WOULD HAVE THE RIGHT TO SUE IN COURT AND HAVE A JURY TRIAL. The arbitration shall be commenced and conducted under the Arbitration Rules of the Canadian Arbitration Association ("CAA") which is available at the CAA website www.canadianarbitrationassociation.ca. Your arbitration fees and your share of arbitrator compensation shall be governed by the CAA Arbitration Rules. The arbitration may be conducted in person, through the submission of documents, by phone, or online. The arbitrator will make a decision in writing, but need not provide a statement of reasons unless requested by either Party. The arbitrator must follow applicable law, and any award may be challenged if the arbitrator fails to do so. Except where otherwise required by the applicable CAA rules or applicable law, the arbitration will take place in Canada, ON. Except as otherwise provided herein, the Parties may litigate in court to compel arbitration, stay proceedings pending arbitration, or to confirm, modify, vacate, or enter judgment on the award entered by the arbitrator.
 <br>
If for any reason, a Dispute proceeds in court rather than arbitration, the Dispute shall be commenced or prosecuted in the Province and federal courts located in Canada, ON, and the Parties hereby consent to, and waive all defenses of lack of personal jurisdiction, and forum non conveniens with respect to venue and jurisdiction in such Province and federal courts. Application of the United Nations Convention on Contracts for the International Sale of Goods and the the Uniform Computer Information Transaction Act (UCITA) are excluded from these Terms of Use.
 <br>
In no event shall any Dispute brought by either Party related in any way to the Site be commenced more than one (1) years after the cause of action arose. If this provision is found to be illegal or unenforceable, then neither Party will elect to arbitrate any Dispute falling within that portion of this provision found to be illegal or unenforceable and such Dispute shall be decided by a court of competent jurisdiction within the courts listed for jurisdiction above, and the Parties agree to submit to the personal jurisdiction of that court.
 </p>
<h4>Restrictions</h4>
<p style="text-align:justify"> 
The Parties agree that any arbitration shall be limited to the Dispute between the Parties individually. To the full extent permitted by law, (a) no arbitration shall be joined with any other proceeding; (b) there is no right or authority for any Dispute to be arbitrated on a class-action basis or to utilize class action procedures; and (c) there is no right or authority for any Dispute to be brought in a purported representative capacity on behalf of the general public or any other persons.
 </p>
<h3>Exceptions to Informal Negotiations and Arbitration</h3>
 
<p style="text-align:justify">The Parties agree that the following Disputes are not subject to the above provisions concerning informal negotiations and binding arbitration: (a) any Disputes seeking to enforce or protect, or concerning the validity of, any of the intellectual property rights of a Party; (b) any Dispute related to, or arising from, allegations of theft, piracy, invasion of privacy, or unauthorized use; and (c) any claim for injunctive relief. If this provision is found to be illegal or unenforceable, then neither Party will elect to arbitrate any Dispute falling within that portion of this provision found to be illegal or unenforceable and such Dispute shall be decided by a court of competent jurisdiction within the courts listed for jurisdiction above, and the Parties agree to submit to the personal jurisdiction of that court.
 </p>
<h3>CORRECTIONS</h3>
 
<p style="text-align:justify">There may be information on the Site that contains typographical errors, inaccuracies, or omissions, including descriptions, pricing, availability, and various other information. We reserve the right to correct any errors, inaccuracies, or omissions and to change or update the information on the Site at any time, without prior notice.
 </p>
<h3>DISCLAIMER</h3>
 <p style="text-align:justify">
THE SITE IS PROVIDED ON AN AS-IS AND AS-AVAILABLE BASIS. YOU AGREE THAT YOUR USE OF THE SITE AND OUR SERVICES WILL BE AT YOUR SOLE RISK. TO THE FULLEST EXTENT PERMITTED BY LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, IN CONNECTION WITH THE SITE AND YOUR USE THEREOF, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE MAKE NO WARRANTIES OR REPRESENTATIONS ABOUT THE ACCURACY OR COMPLETENESS OF THE SITE’S CONTENT OR THE CONTENT OF ANY WEBSITES LINKED TO THE SITE AND WE WILL ASSUME NO LIABILITY OR RESPONSIBILITY FOR ANY (1) ERRORS, MISTAKES, OR INACCURACIES OF CONTENT AND MATERIALS, (2) PERSONAL INJURY OR PROPERTY DAMAGE, OF ANY NATURE WHATSOEVER, RESULTING FROM YOUR ACCESS TO AND USE OF THE SITE, (3) ANY UNAUTHORIZED ACCESS TO OR USE OF OUR SECURE SERVERS AND/OR ANY AND ALL PERSONAL INFORMATION AND/OR FINANCIAL INFORMATION STORED THEREIN, (4) ANY INTERRUPTION OR CESSATION OF TRANSMISSION TO OR FROM THE SITE, (5) ANY BUGS, VIRUSES, TROJAN HORSES, OR THE LIKE WHICH MAY BE TRANSMITTED TO OR THROUGH THE SITE BY ANY THIRD PARTY, AND/OR (6) ANY ERRORS OR OMISSIONS IN ANY CONTENT AND MATERIALS OR FOR ANY LOSS OR DAMAGE OF ANY KIND INCURRED AS A RESULT OF THE USE OF ANY CONTENT POSTED, TRANSMITTED, OR OTHERWISE MADE AVAILABLE VIA THE SITE. WE DO NOT WARRANT, ENDORSE, GUARANTEE, OR ASSUME RESPONSIBILITY FOR ANY PRODUCT OR SERVICE ADVERTISED OR OFFERED BY A THIRD PARTY THROUGH THE SITE, ANY HYPERLINKED WEBSITE, OR ANY WEBSITE OR MOBILE APPLICATION FEATURED IN ANY BANNER OR OTHER ADVERTISING, AND WE WILL NOT BE A PARTY TO OR IN ANY WAY BE RESPONSIBLE FOR MONITORING ANY TRANSACTION BETWEEN YOU AND ANY THIRD-PARTY PROVIDERS OF PRODUCTS OR SERVICES. AS WITH THE PURCHASE OF A PRODUCT OR SERVICE THROUGH ANY MEDIUM OR IN ANY ENVIRONMENT, YOU SHOULD USE YOUR BEST JUDGMENT AND EXERCISE CAUTION WHERE APPROPRIATE.
 </p>
<h3>LIMITATIONS OF LIABILITY</h3>
 <p style="text-align:justify">
IN NO EVENT WILL WE OR OUR DIRECTORS, EMPLOYEES, OR AGENTS BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL, OR PUNITIVE DAMAGES, INCLUDING LOST PROFIT, LOST REVENUE, LOSS OF DATA, OR OTHER DAMAGES ARISING FROM YOUR USE OF THE SITE, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. NOTWITHSTANDING ANYTHING TO THE CONTRARY CONTAINED HEREIN, OUR LIABILITY TO YOU FOR ANY CAUSE WHATSOEVER AND REGARDLESS OF THE FORM OF THE ACTION, WILL AT ALL TIMES BE LIMITED TO THE AMOUNT PAID, IF ANY, BY YOU TO US DURING THE SIX (6) MONTH PERIOD PRIOR TO ANY CAUSE OF ACTION ARISING. CERTAIN STATE LAWS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES. IF THESE LAWS APPLY TO YOU, SOME OR ALL OF THE ABOVE DISCLAIMERS OR LIMITATIONS MAY NOT APPLY TO YOU, AND YOU MAY HAVE ADDITIONAL RIGHTS.
 </p>
<h3>INDEMNIFICATION</h3>
 <p style="text-align:justify">
You agree to defend, indemnify, and hold us harmless, including our subsidiaries, affiliates, and all of our respective officers, agents, partners, and employees, from and against any loss, damage, liability, claim, or demand, including reasonable attorneys’ fees and expenses, made by any third party due to or arising out of: (1) use of the Site; (2) breach of these Terms of Use; (3) any breach of your representations and warranties set forth in these Terms of Use; (4) your violation of the rights of a third party, including but not limited to intellectual property rights; or (5) any overt harmful act toward any other user of the Site with whom you connected via the Site. Notwithstanding the foregoing, we reserve the right, at your expense, to assume the exclusive defense and control of any matter for which you are required to indemnify us, and you agree to cooperate, at your expense, with our defense of such claims. We will use reasonable efforts to notify you of any such claim, action, or proceeding which is subject to this indemnification upon becoming aware of it.
  </p>
<h3>USER DATA</h3>
 <p style="text-align:justify">
We will maintain certain data that you transmit to the Site for the purpose of managing the performance of the Site, as well as data relating to your use of the Site. Although we perform regular routine backups of data, you are solely responsible for all data that you transmit or that relates to any activity you have undertaken using the Site. You agree that we shall have no liability to you for any loss or corruption of any such data, and you hereby waive any right of action against us arising from any such loss or corruption of such data.
  </p>
<h3>ELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES</h3>
 
<p style="text-align:justify">Visiting the Site, sending us emails, and completing online forms constitute electronic communications. You consent to receive electronic communications, and you agree that all agreements, notices, disclosures, and other communications we provide to you electronically, via email and on the Site, satisfy any legal requirement that such communication be in writing. YOU HEREBY AGREE TO THE USE OF ELECTRONIC SIGNATURES, CONTRACTS, ORDERS, AND OTHER RECORDS, AND TO ELECTRONIC DELIVERY OF NOTICES, POLICIES, AND RECORDS OF TRANSACTIONS INITIATED OR COMPLETED BY US OR VIA THE SITE. You hereby waive any rights or requirements under any statutes, regulations, rules, ordinances, or other laws in any jurisdiction which require an original signature or delivery or retention of non-electronic records, or to payments or the granting of credits by any means other than electronic means. 
 </p>
<h3>MISCELLANEOUS</h3>
 
<p style="text-align:justify">These Terms of Use and any policies or operating rules posted by us on the Site or in respect to the Site constitute the entire agreement and understanding between you and us. Our failure to exercise or enforce any right or provision of these Terms of Use shall not operate as a waiver of such right or provision. These Terms of Use operate to the fullest extent permissible by law. We may assign any or all of our rights and obligations to others at any time. We shall not be responsible or liable for any loss, damage, delay, or failure to act caused by any cause beyond our reasonable control. If any provision or part of a provision of these Terms of Use is determined to be unlawful, void, or unenforceable, that provision or part of the provision is deemed severable from these Terms of Use and does not affect the validity and enforceability of any remaining provisions. There is no joint venture, partnership, employment or agency relationship created between you and us as a result of these Terms of Use or use of the Site. You agree that these Terms of Use will not be construed against us by virtue of having drafted them. You hereby waive any and all defenses you may have based on the electronic form of these Terms of Use and the lack of signing by the parties hereto to execute these Terms of Use.
</p> 
<h3>CONTACT US </h3>
<p style="text-align:justify">
In order to resolve a complaint regarding the Site or to receive further information regarding use of the Site, please contact us at: 
 <ul>
<li>Quran Space</li>    
<li>1940 KingsdaleAve.</li>    
<li>Gloucester, ON, K1T1J1</li>
<li>Canada</li>  
<li>Phone: (613) 889 - 7515</li>
<li>info@quranspace.net</li>
</ul>
</p>
</div>
           
     </div>
      
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
   
    <div class="modal-content" style="padding:2%">
      
      <div class="modal-body" style="text-align:center;">
          
<div class="row">
<h3>Privacy policy</h3>
<p style="text-align:justify">This privacy policy (&quot;Policy&quot;) describes how Website Operator (&quot;Website Operator&quot;, &quot;we&quot;, &quot;us&quot; or &quot;our&quot;) collects, protects and uses the personally identifiable information (&quot;Personal Information&quot;) you (&quot;User&quot;, &quot;you&quot; or &quot;your&quot;) may provide on the <a href="http://quranspace.net">quranspace.net</a> website and any of its products or services (collectively, &quot;Website&quot; or &quot;Services&quot;). It also describes the choices available to you regarding our use of your Personal Information and how you can access and update this information. This Policy does not apply to the practices of companies that we do not own or control, or to individuals that we do not employ or manage.
</p>
<h3>Collection of personal information</h3>
<p style="text-align:justify">We receive and store any information you knowingly provide to us when you create an account, fill any online forms on the Website. When required this information may include your email address, name, or other Personal Information. You can choose not to provide us with certain information, but then you may not be able to take advantage of some of the Website's features. Users who are uncertain about what information is mandatory are welcome to contact us.
</p>
<h3>Collection of non-personal information</h3>
<p style="text-align:justify">When you visit the Website our servers automatically record information that your browser sends. This data may include information such as your device's IP address, browser type and version, operating system type and version, language preferences or the webpage you were visiting before you came to our Website, pages of our Website that you visit, the time spent on those pages, information you search for on our Website, access times and dates, and other statistics.</p>
<h3>Managing personal information</h3>
<p style="text-align:justify">You are able to access, add to, update and delete certain Personal Information about you. The information you can view, update, and delete may change as the Website or Services change. When you update information, however, we may maintain a copy of the unrevised information in our records. Some information may remain in our private records after your deletion of such information from your account. We will retain and use your information as necessary to comply with our legal obligations, resolve disputes, and enforce our agreements. We may use any aggregated data derived from or incorporating your Personal Information after you update or delete it, but not in a manner that would identify you personally. Once the retention period expires, Personal Information shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after the expiration of the retention period.
</p>
<h3>Use and processing of collected information</h3>
<p style="text-align:justify">Any of the information we collect from you may be used to personalize your experience; improve our Website; send notification emails such as password reminders, updates, etc; run and operate our Website and Services. Non-Personal Information collected is used only to identify potential cases of abuse and establish statistical information regarding Website usage. This statistical information is not otherwise aggregated in such a way that would identify any particular user of the system.
<br>
We may process Personal Information related to you if one of the following applies: (i) You have given their consent for one or more specific purposes. Note that under some legislations we may be allowed to process information until you object to such processing (by opting out), without having to rely on consent or any other of the following legal bases below. This, however, does not apply, whenever the processing of Personal Information is subject to European data protection law; (ii) Provision of information is necessary for the performance of an agreement with you and/or for any pre-contractual obligations thereof; (ii) Processing is necessary for compliance with a legal obligation to which you are subject; (iv) Processing is related to a task that is carried out in the public interest or in the exercise of official authority vested in us; (v) Processing is necessary for the purposes of the legitimate interests pursued by us or by a third party. In any case, we will be happy to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.
</p>
<h3>Information transfer and storage</h3>
<p style="text-align:justify">Depending on your location, data transfers may involve transferring and storing your information in a country other than your own. You are entitled to learn about the legal basis of information transfers to a country outside the European Union or to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by us to safeguard your information. If any such transfer takes place, you can find out more by checking the relevant sections of this document or inquire with us using the information provided in the contact section.
</p>
<h3>The rights of users</h3>
<p style="text-align:justify">You may exercise certain rights regarding your information processed by us. In particular, you have the right to do the following: (i) you have the right to withdraw consent where you have previously given your consent to the processing of your information; (ii) you have the right to object to the processing of your information if the processing is carried out on a legal basis other than consent; (iii) you have the right to learn if information is being processed by us, obtain disclosure regarding certain aspects of the processing and obtain a copy of the information undergoing processing; (iv) you have the right to verify the accuracy of your information and ask for it to be updated or corrected; (v) you have the right, under certain circumstances, to restrict the processing of your information, in which case, we will not process your information for any purpose other than storing it; (vi) you have the right, under certain circumstances, to obtain the erasure of your Personal Information from us; (vii) you have the right to receive your information in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. This provision is applicable provided that your information is processed by automated means and that the processing is based on your consent, on a contract which you are part of or on pre-contractual obligations thereof.
</p>
<h3>The right to object to processing</h3>
<p style="text-align:justify">Where Personal Information is processed for a public interest, in the exercise of an official authority vested in us or for the purposes of the legitimate interests pursued by us, you may object to such processing by providing a ground related to your particular situation to justify the objection. You must know that, however, should your Personal Information be processed for direct marketing purposes, you can object to that processing at any time without providing any justification. To learn, whether we are processing Personal Information for direct marketing purposes, you may refer to the relevant sections of this document.
</p>
<h3>How to exercise these rights</h3>
<p style="text-align:justify">Any requests to exercise User rights can be directed to the Owner through the contact details provided in this document. These requests can be exercised free of charge and will be addressed by the Owner as early as possible and always within one month.
</p>
<h3>Privacy of children</h3>
<p style="text-align:justify">We do not knowingly collect any Personal Information from children under the age of 13. If you are under the age of 13, please do not submit any Personal Information through our Website or Service. We encourage parents and legal guardians to monitor their children's Internet usage and to help enforce this Policy by instructing their children never to provide Personal Information through our Website or Service without their permission. If you have reason to believe that a child under the age of 13 has provided Personal Information to us through our Website or Service, please contact us.
</p>
<h3>Newsletters</h3>
<p style="text-align:justify">We offer electronic newsletters to which you may voluntarily subscribe at any time. You may choose to stop receiving our newsletter or marketing emails by following the unsubscribe instructions included in these emails or by contacting us. However, you will continue to receive essential transactional emails.
</p>
<h3>Cookies</h3>
<p style="text-align:justify">The Website uses &quot;cookies&quot; to help personalize your online experience. A cookie is a text file that is placed on your hard disk by a web page server. Cookies cannot be used to run programs or deliver viruses to your computer. Cookies are uniquely assigned to you, and can only be read by a web server in the domain that issued the cookie to you. We may use cookies to collect, store, and track information for statistical purposes to operate our Website and Services. You have the ability to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer.
</p>
<h3>Links to other websites</h3>
<p style="text-align:justify">Our Website contains links to other websites that are not owned or controlled by us. Please be aware that we are not responsible for the privacy practices of such other websites or third-parties. We encourage you to be aware when you leave our Website and to read the privacy statements of each and every website that may collect Personal Information.
</p>
<h3>Information security</h3>
<p style="text-align:justify">We secure information you provide on computer servers in a controlled, secure environment, protected from unauthorized access, use, or disclosure. We maintain reasonable administrative, technical, and physical safeguards in an effort to protect against unauthorized access, use, modification, and disclosure of Personal Information in its control and custody. However, no data transmission over the Internet or wireless network can be guaranteed. Therefore, while we strive to protect your Personal Information, you acknowledge that (i) there are security and privacy limitations of the Internet which are beyond our control; (ii) the security, integrity, and privacy of any and all information and data exchanged between you and our Website cannot be guaranteed; and (iii) any such information and data may be viewed or tampered with in transit by a third-party, despite best efforts.
</p>
<h3>Data breach</h3>
<p style="text-align:justify">In the event we become aware that the security of the Website has been compromised or users Personal Information has been disclosed to unrelated third-parties as a result of external activity, including, but not limited to, security attacks or fraud, we reserve the right to take reasonably appropriate measures, including, but not limited to, investigation and reporting, as well as notification to and cooperation with law enforcement authorities. In the event of a data breach, we will make reasonable efforts to notify affected individuals if we believe that there is a reasonable risk of harm to the user as a result of the breach or if notice is otherwise required by law. When we do we will post a notice on the Website, send you an email.</p>
<h3>Legal disclosure</h3>
<p style="text-align:justify">We will disclose any information we collect, use or receive if required or permitted by law, such as to comply with a subpoena, or similar legal process, and when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request. In the event we go through a business transition, such as a merger or acquisition by another company, or sale of all or a portion of its assets, your user account and personal data will likely be among the assets transferred.</p>
<h3>Changes and amendments</h3>
<p style="text-align:justify">We reserve the right to modify this privacy policy relating to the Website or Services at any time, effective upon posting of an updated version of this Policy on the Website. When we do we will post a notification on the main page of our Website. Continued use of the Website after any such changes shall constitute your consent to such changes. Policy was created with WebsitePolicies.com</p>
<h3>Acceptance of this policy</h3>
<p style="text-align:justify">You acknowledge that you have read this Policy and agree to all its terms and conditions. By using the Website or its Services you agree to be bound by this Policy. If you do not agree to abide by the terms of this Policy, you are not authorized to use or access the Website and its Services.</p>
<h3>Contacting us</h3>
<p style="text-align:justify">If you have any questions about this Policy, please contact us.
</p>
</div>
           
     </div>
      
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModalabt" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
   
    <div class="modal-content" style="padding:2%">
      
      <div class="modal-body" style="text-align:center;">
          
<div class="row">
<h3>About us</h3>
<p style="text-align:justify">Assalamu Alaykom,<br>
<b>Quran Space</b> is a free non-profit platform that brings together Quran Tutors and Students.<br>

<b>Our mission</b> is to help Muslims around the Globe getting access to an online Quran Tutor.<br>

Quran Space does not collect any money from Tutors or Students, we are offering our services free of charge. It is always up to the Tutor and Student to agree on the tutoring fees and how to collect them.<br>

For any questions please send an email to <a href="mailto://info@quranspace.net">info@quranspace.net</a><br>

Jazak'Allah khair,<br>
Quran Space Team
</p>
</div>
           
     </div>
      
    </div>
  </div>
</div>


		<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    

      
<div class="modal-body" >
 
 <h3>Contact Form</h3>
   
<div class="col-md-12">
 
<form action="contact"  id="formcontact" method="POST">         
<div class="row">

     <label style="color:#fff;"><spring:message code="label.name" /></label>
     <spring:message code="label.name" var="labelname"></spring:message>
      <input type="text" class="form-control" id="namecontact" name="namecontact" placeholder="${labelname } *" required />

</div>

<div class="row">

               <label style="color:#fff;">Email</label>
             <input type="email" class="form-control" id="emailcontact" name="emailcontact" placeholder="Email *" required />

</div>

<div class="row">

               <label style="color:#fff;"><spring:message code="label.subject" /></label>
               <spring:message code="label.subject" var="labelsubject"></spring:message>
       		 <input type="text" class="form-control" id="subjectcontact" name="subjectcontact" placeholder="${labelsubject} *" required />
</div>


<div class="row">

     <label style="color:#fff;">Message</label>
     <textarea class="form-control" rows="5" id="messagecontact" name="messagecontact" placeholder="Message *" required></textarea>

</div>
 <br>
<div class="row">
 
   <spring:message code="label.send" var="labelsend"></spring:message>
 <input type="submit" value="${labelsend }" class="btn brn-primary" style="float:right;" /><br>

</div>

</div>
           
 </div>
 
 </form>
      
    </div>
  </div>
</div>


		<!-- JS Files -->
		<script src="<%=request.getContextPath()%>/resources/js/jquery.captcha.basic.min.js"></script>		
		<script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/plugins.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/active.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
	<script>
$(document).ready(function(){
$('#formcontact').captcha();
});
</script>
	</body>
</html>